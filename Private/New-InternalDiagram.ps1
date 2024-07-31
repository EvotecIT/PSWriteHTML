function New-InternalDiagram {
    <#
    .SYNOPSIS
    Creates a new internal diagram with specified nodes, edges, events, options, dimensions, and styling.

    .DESCRIPTION
    This function creates a new internal diagram with the provided nodes, edges, events, and options. It allows customization of dimensions, background image, filtering options, and more.

    .PARAMETER Nodes
    Specifies the collection of nodes for the diagram.

    .PARAMETER Edges
    Specifies the collection of edges connecting the nodes.

    .PARAMETER Events
    Specifies the events associated with the diagram.

    .PARAMETER Options
    Specifies the options for configuring the diagram.

    .PARAMETER Height
    Specifies the height of the diagram.

    .PARAMETER Width
    Specifies the width of the diagram.

    .PARAMETER BackgroundImage
    Specifies the background image for the diagram.

    .PARAMETER BackgroundSize
    Specifies the size of the background image. Default is '100% 100%'.

    .PARAMETER IconsAvailable
    Indicates if icons are available for use in the diagram.

    .PARAMETER DisableLoader
    Indicates whether the loader should be disabled.

    .PARAMETER EnableFiltering
    Indicates whether filtering functionality is enabled.

    .PARAMETER MinimumFilteringChars
    Specifies the minimum number of characters required for filtering. Default is 3.

    .PARAMETER EnableFilteringButton
    Indicates whether a filtering button should be displayed.

    .EXAMPLE
    New-InternalDiagram -Nodes @($Node1, $Node2) -Edges @($Edge1) -Events @($Event1) -Options $DiagramOptions -Height 500 -Width 800 -BackgroundImage 'bg.jpg' -EnableFiltering -EnableFilteringButton
    Creates a new internal diagram with specified nodes, edges, events, options, dimensions, and background image with filtering enabled.

    .EXAMPLE
    New-InternalDiagram -Nodes @($Node1, $Node2) -Edges @($Edge1) -Options $DiagramOptions -Height 400 -Width 600
    Creates a new internal diagram with specified nodes, edges, and options with custom dimensions.

    #>
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
        [switch] $DisableLoader,
        [switch] $EnableFiltering,
        [int] $MinimumFilteringChars = 3,
        [switch] $EnableFilteringButton
    )
    $Script:HTMLSchema.Features.VisNetwork = $true
    $Script:HTMLSchema.Features.VisData = $true
    $Script:HTMLSchema.Features.Moment = $true
    $Script:HTMLSchema.Features.VisNetworkLoad = $true
    $Script:HTMLSchema.Features.EscapeRegex = $true


    $UseFilteringButton = $EnableFilteringButton.IsPresent

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
    if ($EnableFiltering -or $UseFilteringButton) {
        $Script:HTMLSchema.Features.VisNetworkFind = $true
    }

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
                if ($EnableFiltering -or $UseFilteringButton) {
                    New-HTMLTag -Tag 'div' -Attributes @{ class = 'searchDiagram' } -Value {
                        New-HTMLTag -Tag 'input' -Attributes @{ type = 'search'; class = 'searchInput'; id = "searchInput$ID"; placeholder = 'Filter name...' }
                        if ($UseFilteringButton) {
                            New-HTMLTag -Tag 'button' -Attributes @{ id = "searchButton$ID"; class = 'searchButton'; type = 'button' } -Value { 'Filter' }
                        }
                    }
                }
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

    } else {
        $Div = New-HTMLTag -Tag 'div' -Attributes $AttributesOutside {
            if ($EnableFiltering -or $UseFilteringButton) {
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'searchDiagram' } -Value {
                    New-HTMLTag -Tag 'input' -Attributes @{ type = 'search'; class = 'searchInput'; id = "searchInput$ID"; placeholder = 'Filter name...' }
                    if ($UseFilteringButton) {
                        New-HTMLTag -Tag 'button' -Attributes @{ id = "searchButton$ID"; class = 'searchButton'; type = 'button' } -Value { 'Filter' }
                    }
                }
            }
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
            foreach ($E in $Events) {
                New-DiagramInternalEvent -ID $E.ID -ColumnID $E.ColumnID
            }
            '});'
        )
    }

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

        if ($EnableFiltering -or $UseFilteringButton) {
            $SearchByTyping = if ($UseFilteringButton) { "false" } else { "true" }
            "setupSearch(nodes, edges, 'searchInput$ID', 'searchButton$ID', $SearchByTyping, $MinimumFilteringChars); // Enables typing search only"
        }

    } -NewLine

    $Div
    $Script:HTMLSchema.Diagrams.Add($Script)
}