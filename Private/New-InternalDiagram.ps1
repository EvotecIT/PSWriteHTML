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
        [string] $BackgroundSize = '100% 100%'
    )
    $Script:HTMLSchema.Features.VisNetwork = $true
    $Script:HTMLSchema.Features.VisData = $true
    $Script:HTMLSchema.Features.Moment = $true

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

    $Attributes = [ordered] @{
        class = 'diagram'
        style = $Style
    }

    $AttributesInside = [ordered] @{
        class = 'diagram'
        style = @{
            position = 'absolute'
        }
        id    = $ID
    }

    $Div = New-HTMLTag -Tag 'div' -Attributes $Attributes {
        New-HTMLTag -Tag 'div' -Attributes $AttributesInside
    }
    $ConvertedNodes = $Nodes -join ', '
    $ConvertedEdges = $Edges -join ', '

    if ($Events.Count -gt 0) {
        [Array] $PreparedEvents = @(
            # https://stackoverflow.com/questions/3446170/escape-string-for-use-in-javascript-regex'
            @'
            function escapeRegExp(string) {
                return string.toString().replace(/[.*+?^${}()|[\]\\]/g, '\\$&'); // $& means the whole matched string
            };
'@
            'network.on("click", function (params) {'
            'params.event = "[original event]";'
            'var findValue = escapeRegExp(params.nodes);'
            foreach ($_ in $Events) {
                New-DiagramInternalEvent -ID $_.ID -ColumnID $_.ColumnID
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
        "var Container = document.getElementById('$ID'); "
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
        'var network = new vis.Network(Container, data, options); '

        $PreparedEvents
    } -NewLine

    $Div
    $Script:HTMLSchema.Diagrams.Add($Script)
}