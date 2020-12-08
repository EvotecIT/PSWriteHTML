function New-InternalDiagram {
    [CmdletBinding()]
    param(
        [System.Collections.IList] $Nodes,
        [System.Collections.IList] $Edges,
        [System.Collections.IList] $Events,
        [System.Collections.IDictionary] $Options,
        [object] $Height,
        [object] $Width,
        [string] $BackgroundImage,
        [string] $BackgroundSize = '100% 100%',
        [switch] $IconsAvailable,
        [switch] $DisableLoader
    )
    $Script:HTMLSchema.Features.VisNetwork = $true
    $Script:HTMLSchema.Features.VisData = $true
    $Script:HTMLSchema.Features.Moment = $true
    $Script:HTMLSchema.Features.VisNetworkLoad = $true
    $Script:HTMLSchema.Features.EscapeRegex = $true
    # We need to disable loader if physics is disabled, as it doesn't give us anything
    # and it prevents loading
    if ($Options.physics -and $Options.physics.enabled -eq $false) {
        $DisableLoader = $true
    }
    if (-not $DisableLoader) {
        $Script:HTMLSchema.Features.VisNetworkLoadingBar = $true
    }
    # Vis network clustering allows to cluster more than 1 node, there's no code to enable it yet
    #$Script:HTMLSchema.Features.VisNetworkClustering = $true


    [string] $ID = "Diagram-" + (Get-RandomStringName -Size 8)

    $Style = [ordered] @{
        position = 'relative'
        width    = ConvertFrom-Size -Size $Width
        height   = ConvertFrom-Size -Size $Height
    }
    if ($BackgroundImage) {
        $Style['background'] = "url('$BackgroundImage')"
        $Style['background-size'] = $BackgroundSize
    }

    $AttributesOutside = [ordered] @{
        class = 'diagram'
        style = $Style
    }

    $AttributesInside = [ordered] @{
        class = 'diagram diagramObject'
        style = @{
            position = 'absolute'
        }
        id    = "$ID"
    }

    if (-not $DisableLoader) {
        $Div = New-HTMLTag -Tag 'div' -Attributes @{ class = 'diagramWrapper' } -Value {
            New-HTMLTag -Tag 'div' -Attributes $AttributesOutside -Value {
                New-HTMLTag -Tag 'div' -Attributes $AttributesInside
            }
            New-HTMLTag -Tag 'div' -Attributes @{ id = "$ID-diagramLoadingBar"; class = 'diagramLoadingBar' } {
                New-HTMLTag -Tag 'div' -Attributes @{ class = "diagramOuterBorder" } {
                    New-HTMLTag -Tag 'div' -Attributes @{ id = "$ID-diagramText"; class = 'diagramText' } -Value { '0%' }
                    New-HTMLTag -Tag 'div' -Attributes @{ class = 'diagramBorder' } {
                        New-HTMLTag -Tag 'div' -Attributes @{ id = "$ID-diagramBar"; class = 'diagramBar' }
                    }
                }
            }
        }

        <#
        $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = "$ID-diagramWrapper"; class = 'diagramWrapper' } -Value {
            New-HTMLTag -Tag 'div' -Attributes $AttributesOutside -Value {
                New-HTMLTag -Tag 'div' -Attributes $AttributesInside
            }
            New-HTMLTag -Tag 'div' -Attributes @{ id = "$ID-diagramLoadingBar"; class = 'diagramLoadingBar' } {
                New-HTMLTag -Tag 'div' -Attributes @{ class = "$ID-diagramOuterBorder" } {
                    New-HTMLTag -Tag 'div' -Attributes @{ id = "$ID-diagramText"; class = 'diagramText' } -Value { '0%' }
                    New-HTMLTag -Tag 'div' -Attributes @{ id = "$ID-diagramBorder"; class = 'diagramBorder' } {
                        New-HTMLTag -Tag 'div' -Attributes @{ id = "$ID-diagramBar"; class = 'diagramBar' }
                    }
                }
            }
        }
        #>
    } else {
        $Div = New-HTMLTag -Tag 'div' -Attributes $AttributesOutside {
            New-HTMLTag -Tag 'div' -Attributes $AttributesInside
        }
    }
    $ConvertedNodes = $Nodes -join ', '
    $ConvertedEdges = $Edges -join ', '

    if ($Events.Count -gt 0) {
        [Array] $PreparedEvents = @(

            'network.on("click", function (params) {'
            'params.event = "[original event]";'
            'var findValue = escapeRegExp(params.nodes);'
            foreach ($_ in $Events) {
                New-DiagramInternalEvent -ID $_.ID -ColumnID $_.ColumnID
            }
            '});'
        )
    }
    if ($DisableLoader) {
        $LoadingBarEvent = ''
    } else {
        $LoadingBarEvent = @"
            network.on("stabilizationProgress", function (params) {
                var maxWidth = 496;
                var minWidth = 20;
                var widthFactor = params.iterations / params.total;
                var width = Math.max(minWidth, maxWidth * widthFactor);

                document.getElementById("$ID-diagramBar").style.width = width + "px";
                document.getElementById("$ID-diagramText").innerHTML = Math.round(widthFactor * 100) + "%";
            });
            network.once("stabilizationIterationsDone", function () {
                document.getElementById("$ID-diagramText").innerHTML = "100%";
                document.getElementById("$ID-diagramBar").style.width = "496px";
                document.getElementById("$ID-diagramLoadingBar").style.opacity = 0;
                // really clean the dom element
                setTimeout(function () {
                    document.getElementById("$ID-diagramLoadingBar").style.display = "none";
                }, 500);
            });
            //window.addEventListener("load", () => {
            //    draw();
            //});
"@
    }

    $FunctionInclude = @"
    function loadDiagram(container, data, options) {
        var network = new vis.Network(container, data, options);
        $PreparedEvents
        $LoadingBarEvent
    }
"@

    $Script = New-HTMLTag -Tag 'script' -Value {
        # Convert Dictionary to JSON and return chart within SCRIPT tag
        # Make sure to return with additional empty string

        '// create an array with nodes'
        "var nodes = new vis.DataSet([$ConvertedNodes]); "

        '// create an array with edges'
        "var edges = new vis.DataSet([$ConvertedEdges]); "

        '// create a network'
        "var container = document.getElementById('$ID'); "
        "var data = { "
        "   nodes: nodes, "
        "   edges: edges"
        " }; "

        if ($Options) {
            $ConvertedOptions = $Options | ConvertTo-Json -Depth 5 | ForEach-Object { [System.Text.RegularExpressions.Regex]::Unescape($_) }
            "var options = $ConvertedOptions; "
        } else {
            "var options = { }; "
        }
        $DisableLoaderString = (-not $DisableLoader).ToString().ToLower()
        $IconsAvailableString = $IconsAvailable.IsPresent.ToString().ToLower()
        "var network = loadDiagramWithFonts(container, data, options, '$ID', $DisableLoaderString , $IconsAvailableString);"
        "diagramTracker['$ID'] = network;"
        "$PreparedEvents"

    } -NewLine

    $Div
    $Script:HTMLSchema.Diagrams.Add($Script)
}