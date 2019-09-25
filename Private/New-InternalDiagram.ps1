function New-InternalDiagram {
    [CmdletBinding()]
    param(
        [System.Collections.IList] $Nodes,
        [System.Collections.IList] $Edges,
        [System.Collections.IDictionary] $Options,
        [string] $Height,
        [string] $Width
    )
    $Script:HTMLSchema.Features.VisNetwork = $true

    if ($Width -or $Height) {
        $Style = @{
            'width' = $Width
            'height' = $Height
        }
    }

    [string] $ID = "Diagram-" + (Get-RandomStringName -Size 8)
    $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = $ID; class = 'diagram'; style = $Style }

    $ConvertedNodes = $Nodes -join ','
    $ConvertedEdges = $Edges -join ','

    $Script = New-HTMLTag -Tag 'script' -Value {
        # Convert Dictionary to JSON and return chart within SCRIPT tag
        # Make sure to return with additional empty string

        '// create an array with nodes'
        "var nodes = new vis.DataSet([$ConvertedNodes]);"

        '// create an array with edges'
        "var edges = new vis.DataSet([$ConvertedEdges]);"

        '// create a network'
        "var container = document.getElementById('$ID');"
        "var data = {"
        "   nodes: nodes,"
        "   edges: edges"
        "};"

        if ($Options) {
            $ConvertedOptions = $Options | ConvertTo-Json -Depth 5 | ForEach-Object { [System.Text.RegularExpressions.Regex]::Unescape($_) }
            "var options = $ConvertedOptions;"
        } else {
            "var options = {};"
        }
        'var network = new vis.Network(container, data, options);'
    } -NewLine

    $Div
    $Script:HTMLSchema.Diagrams.Add($Script)
}