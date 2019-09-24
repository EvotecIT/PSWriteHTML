function New-HTMLDiagram {
    [alias('Diagram')]
    [CmdletBinding()]
    param(
        [ScriptBlock] $Diagram
    )
    if (-not $Script:HTMLSchema.Features) {
        Write-Warning 'New-HTMLDiagram - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }

    $Data = [System.Collections.Generic.List[object]]::new()

    [Array] $Settings = & $Diagram
    foreach ($Node in $Settings) {
        if ($Node.Type -eq 'DiagramNode') {
            $Data.Add($Node.Settings)
        } elseif ($Node.Type -eq 'DiagramOptionsInteraction') {
            $DiagramOptionsInteraction = $Node.Settings
        } elseif ($Node.Type -eq 'DiagramOptionsManipulation') {
            $DiagramOptionsManipulation = $Node.Settings
        }
    }

    <#
    {id: 14, shape: 'circularImage', image: DIR + '14.png'},
    {id: 15, shape: 'circularImage', image: DIR + 'missing.png', brokenImage: DIR + 'missingBrokenImage.png', label:"when images\nfail\nto load"},
    {id: 16, shape: 'circularImage', image: DIR + 'anotherMissing.png', brokenImage: DIR + '9.png', label:"fallback image in action"}
    {id: 5, label:'colorObject', color: {background:'pink', border:'purple'}},
    {id: 6, label:'colorObject + highlight', color: {background:'#F03967', border:'#713E7F',highlight:{background:'red',border:'black'}}},
    {id: 7, label:'colorObject + highlight + hover', color: {background:'cyan', border:'blue',highlight:{background:'red',border:'blue'},hover:{background:'white',border:'red'}}}
    {id: 1,label: 'User 1',group: 'users'},
    {id: 2,label: 'User 2',group: 'users'},
    {id: 3,label: 'Usergroup 1',group: 'usergroups'}
    nodes.push({id: 1, label: 'Main', image: DIR + 'Network-Pipe-icon.png', shape: 'image'});
    nodes.push({id: 2, label: 'Office', image: DIR + 'Network-Pipe-icon.png', shape: 'image'});
    nodes.push({id: 3, label: 'Wireless', image: DIR + 'Network-Pipe-icon.png', shape: 'image'});
    {id: 3,  shape: 'image', image: DIR + '3.png', label: "imagePadding{2,10,8,20}+size", imagePadding: { left: 2, top: 10, right: 8, bottom: 20}, size: 40, color: { border: 'green', background: 'yellow', highlight: { border: 'yellow', background: 'green' }, hover: { border: 'orange', background: 'grey' } } },
    {id: 9,  shape: 'image', image: DIR + '9.png', label: "useImageSize + imagePadding:15", shapeProperties: { useImageSize: true }, imagePadding: 30, color: { border: 'blue', background: 'orange', highlight: { border: 'orange', background: 'blue' }, hover: { border: 'orange', background: 'grey' } } },
    var url = "data:image/svg+xml;charset=utf-8,"+ encodeURIComponent(svg);
    {id: 2, label: 'Using SVG', image: url, shape: 'image'}
   
    #>


    $Nodes = foreach ($_ in $Data) {
        $Node = [ordered] @{ }
        $Node['id'] = $_.ID
        $Node['label'] = $_.Label

        # Play with colors
        if ($_.Border -or $_.Background -or $_.HighlightBackground -or $_.HighlightBorder -or $_.HoverBackground -or $_.HoverBorder) {
            $Node['color'] = @{ }
            if ($_.Background) {
                $Node['color']['background'] = ConvertFrom-Color -Color $_.Background
            }
            if ($_.Border) {
                $Node['color']['border'] = ConvertFrom-Color -Color $_.Border
            }
            if ($_.HighlightBackground -or $_.HighlightBorder) {
                $Node['color']['highlight'] = @{ }
                if ($_.HighlightBackground) {
                    $Node['color']['highlight']['background'] = ConvertFrom-Color -Color $_.HighlightBackground
                }
                if ($_.HighlightBorder) {
                    $Node['color']['highlight']['border'] = ConvertFrom-Color -Color $_.HighlightBorder
                }
            }

            if ($_.HoverBackground -or $_.HoverBorder) {
                $Node['color']['hover'] = @{ }
                if ($_.HoverBackground) {
                    $Node['color']['hover']['background'] = ConvertFrom-Color -Color $_.HoverBackground
                }
                if ($_.HoverBorder) {
                    $Node['color']['hover']['border'] = ConvertFrom-Color -Color $_.HoverBorder
                }
            }
        }
        if ($_.Shape -ne 'default') {
            $Node['shape'] = $_.Shape
        }
        if ($_.Size) {
            $Node['size'] = $_.Size
        }

        if ($_.Icon) {
            $Node['icon'] = @{
                face = 'FontAwesome'
                code = $_.Icon
                size = $_.Size
                color = ConvertFrom-Color -Color $_.Background
            }
        } elseif ($_.Image) {
           # {id: 2, label: 'Using SVG', image: url, shape: 'image'}
           $Node['image'] = $_.Image
        }

        $Node | ConvertTo-Json -Depth 5
    }
    $Edges = foreach ($_ in $Data) {
        if ($_.From -and $_.To) {
            foreach ($SingleTo in $_.To) {
                [ordered] @{
                    from = $_.From
                    to   = $SingleTo
                } | ConvertTo-Json -Depth 5
            }
        }
    }

    $Options = @{ }
    if ($DiagramOptionsInteraction) {
        if ($DiagramOptionsInteraction['interaction']) {
            $Options['interaction'] = $DiagramOptionsInteraction['interaction']
        }
    }
    if ($DiagramOptionsManipulation) {
        if ($DiagramOptionsManipulation['manipulation']) {
            $Options['manipulation'] = $DiagramOptionsManipulation['manipulation']
        }
    }


    New-InternalDiagram -Nodes $Nodes -Edges $Edges -Options $Options
}
