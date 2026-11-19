<#
.SYNOPSIS
Checks the visible nodes and directed links as readers fold and unfold diagram groups.
.DESCRIPTION
Serve ReportDirectory at BaseUri on loopback before running the test.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string] $ReportDirectory,
    [Parameter(Mandatory)][uri] $BaseUri,
    [ValidateSet('Edge', 'Firefox')][string] $Browser = 'Edge',
    [switch] $Online,
    [switch] $Capture
)

$ErrorActionPreference = 'Stop'
if ($BaseUri.Scheme -ne 'http' -or $BaseUri.Host -ne '127.0.0.1') {
    throw 'BaseUri must point to the loopback HTTP server serving ReportDirectory.'
}
Import-Module (Join-Path $PSScriptRoot '../../PSWriteHTML.psd1') -Force
Import-Module PSParseHTML -MinimumVersion 3.0.9
$null = New-Item -ItemType Directory -Path $ReportDirectory -Force
$Icon = Join-Path $ReportDirectory 'icon.svg'
[IO.File]::WriteAllText($Icon, '<svg xmlns="http://www.w3.org/2000/svg" width="1" height="1"/>')

$null = New-HTML -FilePath (Join-Path $ReportDirectory 'diagram-groups.html') -FavIcon $Icon -Online:$Online {
    New-HTMLDiagram -Height 450 -EnableFiltering {
        New-DiagramNode -Id 'App' -Label 'Application' -X -160 -Y -65
        New-DiagramNode -Id 'Db' -Label 'Database' -X -160 -Y 65
        New-DiagramNode -Id 'Proxy' -Label 'Reverse proxy' -X 160 -Y -65
        New-DiagramNode -Id 'Web' -Label 'Web server' -X 160 -Y 65
        New-DiagramNode -Id 'Internet' -Label 'Internet' -X 360 -Y 0
        New-DiagramGroup -Name 'Internal Network' -NodeId 'app', 'Db'
        New-DiagramGroup -Name 'DMZ' -NodeId 'Proxy', 'Web'
        New-DiagramOptionsPhysics -Enabled $false
        New-DiagramLink -From 'App' -To 'Db' -Label 'sql'
        New-DiagramLink -From 'Proxy' -To 'Web' -Label 'http'
        New-DiagramLink -From 'App' -To 'Proxy' -Label 'outbound' -ArrowsToEnabled
        New-DiagramLink -From 'Web' -To 'Db' -Label 'inbound' -ArrowsToEnabled
        New-DiagramLink -From 'Internet' -To 'Proxy' -Label 'https' -ArrowsToEnabled
    }
    New-HTMLDiagram -Height 400 {
        New-DiagramNode -Id 'Other' -Label 'Other server' -IconSolid 'server'
        New-DiagramGroup -Name 'DMZ' -NodeId 'Other' -Collapsed
        New-DiagramOptionsPhysics -Enabled $false
    }
}

function Assert-DiagramView {
    param(
        [string[]] $NodeNames,
        [string[]] $Links
    )

    $View = Invoke-HtmlBrowserScript -Session $Session -Script @'
() => {
    const network = Object.values(diagramTracker).find(item => item.body.data.nodes.get("App"));
    const displayId = id => network.isCluster(id) ? network.body.nodes[id].options.label : id;
    return {
        nodes: network.body.nodeIndices.map(displayId).sort().join("|"),
        links: network.body.edgeIndices.map(id => {
            const edge = network.body.edges[id];
            const labels = edge.options.label.split(" / ").sort().join(" / ");
            if (labels === "inbound / outbound") {
                const endpoints = [displayId(edge.fromId), displayId(edge.toId)].sort();
                const bidirectional = edge.options.arrows.from.enabled && edge.options.arrows.to.enabled;
                const baseCount = network.getBaseEdges(id).length;
                return endpoints.join(bidirectional ? "<>" : ">") + ":" + labels + ":" + baseCount;
            }
            return displayId(edge.fromId) + ">" + displayId(edge.toId) + ":" + labels;
        }).sort().join("|")
    };
}
'@
    [Array]::Sort($NodeNames, [StringComparer]::Ordinal)
    [Array]::Sort($Links, [StringComparer]::Ordinal)
    if ($View.nodes -cne ($NodeNames -join '|') -or $View.links -cne ($Links -join '|')) {
        throw "Unexpected visible graph. Nodes [$($View.nodes)]. Links [$($View.links)]. Expected nodes [$NodeNames] and links [$Links]."
    }
}

$Options = @{ Browser = 'Firefox'; Visible = $false; ViewportWidth = 1100; ViewportHeight = 700 }
if ($Browser -eq 'Edge') {
    $Options.Browser = 'Chromium'
    $Options.BrowserChannel = 'msedge'
}
$Session = Start-HtmlBrowserSession -Url ([uri]::new($BaseUri, 'diagram-groups.html')).AbsoluteUri @Options
try {
    $Session.Page.SetDefaultTimeout(15000)
    $GroupButtons = $Session.Page.Locator('.diagramGroupControls button')
    $Internal = $GroupButtons.Nth(0)
    $DMZ = $GroupButtons.Nth(1)
    $OtherDMZ = $GroupButtons.Nth(2)
    $null = $Internal.WaitForAsync().GetAwaiter().GetResult()
    $null = $OtherDMZ.WaitForAsync().GetAwaiter().GetResult()
    if ($OtherDMZ.TextContentAsync().GetAwaiter().GetResult() -ne 'Expand DMZ') {
        throw 'The second diagram did not start collapsed.'
    }

    $ExpandedNodes = 'App', 'Db', 'Proxy', 'Web', 'Internet'
    $ExpandedLinks = 'App>Db:sql', 'Proxy>Web:http', 'App>Proxy:outbound', 'Web>Db:inbound', 'Internet>Proxy:https'
    Assert-DiagramView -NodeNames $ExpandedNodes -Links $ExpandedLinks
    if ($Capture) {
        $null = Save-HtmlBrowserScreenshot -Session $Session -OutFile (Join-Path $ReportDirectory 'expanded.png') -Selector '.diagramGroupPanel:first-of-type'
    }

    $null = $Internal.PressAsync('Enter').GetAwaiter().GetResult()
    if ($Internal.GetAttributeAsync('aria-expanded').GetAwaiter().GetResult() -ne 'false') {
        throw 'The group button did not indicate that the internal network was collapsed.'
    }
    Assert-DiagramView -NodeNames 'Internal Network', 'Proxy', 'Web', 'Internet' -Links 'Proxy>Web:http', 'Internal Network>Proxy:outbound', 'Web>Internal Network:inbound', 'Internet>Proxy:https'

    $null = $DMZ.ClickAsync().GetAwaiter().GetResult()
    Assert-DiagramView -NodeNames 'Internal Network', 'DMZ', 'Internet' -Links 'DMZ<>Internal Network:inbound / outbound:2', 'Internet>DMZ:https'
    if ($Capture) {
        $null = Save-HtmlBrowserScreenshot -Session $Session -OutFile (Join-Path $ReportDirectory 'collapsed.png') -Selector '.diagramGroupPanel:first-of-type'
    }

    # Open the first group before the second to exercise a link between two clusters.
    $null = $Internal.ClickAsync().GetAwaiter().GetResult()
    Assert-DiagramView -NodeNames 'App', 'Db', 'DMZ', 'Internet' -Links 'App>Db:sql', 'App>DMZ:outbound', 'DMZ>Db:inbound', 'Internet>DMZ:https'
    $null = $DMZ.PressAsync('Space').GetAwaiter().GetResult()
    Assert-DiagramView -NodeNames $ExpandedNodes -Links $ExpandedLinks

    $null = $DMZ.ClickAsync().GetAwaiter().GetResult()
    $Search = $Session.Page.Locator('.searchInput')
    $null = $Search.FillAsync('reverse').GetAwaiter().GetResult()
    Assert-DiagramView -NodeNames 'Proxy' -Links @()
    $null = $Search.FillAsync('').GetAwaiter().GetResult()
    Assert-DiagramView -NodeNames $ExpandedNodes -Links $ExpandedLinks

    if ($OtherDMZ.TextContentAsync().GetAwaiter().GetResult() -ne 'Expand DMZ') {
        throw 'Toggling the first diagram affected the second diagram.'
    }
    $null = $OtherDMZ.ClickAsync().GetAwaiter().GetResult()
    if ($OtherDMZ.TextContentAsync().GetAwaiter().GetResult() -ne 'Collapse DMZ') {
        throw 'The second diagram did not expand.'
    }
    "PASS: $Browser restored every directed link and kept both diagrams independent."
} finally {
    Close-HtmlBrowserSession -Session $Session -ErrorAction Stop
}
