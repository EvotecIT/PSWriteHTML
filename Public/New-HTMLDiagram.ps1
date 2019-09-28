function New-HTMLDiagram {
    [alias('Diagram')]
    [CmdletBinding()]
    param(
        [ScriptBlock] $Diagram,
        [string] $Height,
        [string] $Width,
        [switch] $BundleImages
    )
    if (-not $Script:HTMLSchema.Features) {
        Write-Warning 'New-HTMLDiagram - Creation of HTML aborted. Most likely New-HTML is missing.'
        Exit
    }

    $DataEdges = [System.Collections.Generic.List[System.Collections.IDictionary]]::new()
    $DataNodes = [ordered] @{ }


    [Array] $Settings = & $Diagram
    foreach ($Node in $Settings) {
        if ($Node.Type -eq 'DiagramNode') {
            $ID = $Node.Settings['id']
            $DataNodes[$ID] = $Node.Settings
            #$DataEdges.Add($Node.Edges)
            foreach ($From in $Node.Edges.From) {
                foreach ($To in $Node.Edges.To) {
                    $Edge = $Node.Edges.Clone()
                    $Edge['from'] = $From
                    $Edge['to'] = $To
                    $DataEdges.Add($Edge)
                }
            }
        } elseif ($Node.Type -eq 'DiagramOptionsInteraction') {
            $DiagramOptionsInteraction = $Node.Settings
        } elseif ($Node.Type -eq 'DiagramOptionsManipulation') {
            $DiagramOptionsManipulation = $Node.Settings
        } elseif ($Node.Type -eq 'DiagramOptionsPhysics') {
            $DiagramOptionsPhysics = $Node.Settings
        } elseif ($Node.Type -eq 'DiagramOptionsLayout') {
            $DiagramOptionsLayout = $Node.Settings
        } elseif ($Node.Type -eq 'DiagramOptionsNodes') {
            $DiagramOptionsNodes = $Node.Settings
        } elseif ($Node.Type -eq 'DiagramOptionsEdges') {
            $DiagramOptionsEdges = $Node.Settings
        } elseif ($Node.Type -eq 'DiagramLink') {
            if ($Node.Settings.From -and $Node.Settings.To) {
                foreach ($From in $Node.Settings.From) {
                    foreach ($To in $Node.Settings.To) {
                        $Edge = $Node.Edges.Clone()
                        $Edge['from'] = $From
                        $Edge['to'] = $To
                        $DataEdges.Add($Edge)
                    }
                }
            }
            $DataEdges.Add($Node.Edges)
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


    [Array] $Nodes = foreach ($_ in $DataNodes.Keys) {
        if ($DataNodes[$_]['image']) {
            if ($BundleImages) {
                $DataNodes[$_]['image'] = Convert-Image -Image $Node.Image
            }
        }
        $NodeJson = $DataNodes[$_] | ConvertTo-Json -Depth 5 #| ForEach-Object { [System.Text.RegularExpressions.Regex]::Unescape($_) }

        # We need to fix wrong escaped chars, Unescape breaks other parts
        $Replace = @{
            '"\"Font Awesome 5 Solid\""'   = "'`"Font Awesome 5 Solid`"'"
            '"\"Font Awesome 5 Brands\""'  = "'`"Font Awesome 5 Brands`"'"
            '"\"Font Awesome 5 Regular\""' = "'`"Font Awesome 5 Regular`"'"
            '"\"Font Awesome 5 Free\""'    = "'`"Font Awesome 5 Free`"'"
            '"\"Font Awesome 5 Free Regular\""'    = "'`"Font Awesome 5 Free Regular`"'"
            '"\"Font Awesome 5 Free Solid\""'    = "'`"Font Awesome 5 Free Solid`"'"
            '"\"Font Awesome 5 Free Brands\""'    = "'`"Font Awesome 5 Free Brands`"'"
            '"\\u'                         = '"\u'
        }
        foreach ($R in $Replace.Keys) {
            $NodeJson = $NodeJson.Replace($R, $Replace[$R])
        }
        $NodeJson
    }
    [Array] $Edges = foreach ($_ in $DataEdges) {
        #if ($_.From -and $_.To) {
        #    foreach ($SingleTo in $_.To) {
        # [ordered] @{
        #    from = $_.From
        #     to   = $SingleTo
        # } | ConvertTo-Json -Depth 5
        $_ | ConvertTo-Json -Depth 5 #| ForEach-Object { [System.Text.RegularExpressions.Regex]::Unescape($_) }
        #}
        #}
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
    if ($DiagramOptionsPhysics) {
        if ($DiagramOptionsPhysics['physics']) {
            $Options['physics'] = $DiagramOptionsPhysics['physics']
        }
    }
    if ($DiagramOptionsLayout) {
        if ($DiagramOptionsLayout['layout']) {
            $Options['layout'] = $DiagramOptionsLayout['layout']
        }
    }
    if ($DiagramOptionsEdges) {
        if ($DiagramOptionsEdges['edges']) {
            $Options['edges'] = $DiagramOptionsEdges['edges']
        }
    }
    if ($DiagramOptionsNodes) {
        if ($DiagramOptionsNodes['nodes']) {
            $Options['nodes'] = $DiagramOptionsNodes['nodes']
        }
    }


    New-InternalDiagram -Nodes $Nodes -Edges $Edges -Options $Options -Width $Width -Height $Height
}
