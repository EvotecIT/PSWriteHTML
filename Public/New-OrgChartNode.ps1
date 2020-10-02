function New-OrgChartNode {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER Children
    Define children of the node by specifying nested nodes (self-nesting)

    .PARAMETER Name
    Name of the node

    .PARAMETER Title
    Title of the node

    .PARAMETER ClassName
    Parameter description

    .EXAMPLE
    New-HTML {
        New-HTMLOrgChart {
            New-OrgChartNode -Name 'Test' -Title 'Test2' {
                New-OrgChartNode -Name 'Test' -Title 'Test2'
                New-OrgChartNode -Name 'Test' -Title 'Test2'
                New-OrgChartNode -Name 'Test' -Title 'Test2' {
                    New-OrgChartNode -Name 'Test' -Title 'Test2'
                }
            }
        } -AllowExport -ExportExtension pdf -Draggable
    } -FilePath $PSScriptRoot\Example-OrgChart01.html -ShowHTML -Online

    .NOTES
    General notes
    #>
    [cmdletBinding()]
    param(
        [scriptblock] $Children,
        [string] $Name,
        [string] $Title,
        [string] $ClassName
    )
    $ChartNode = [ordered] @{
        name      = $Name
        title     = $Title
        className = $ClassName
        nodeId    = $Name
    }
    if ($Children) {
        $ChildrenOutput = & $Children
        $ChartNode['children'] = @($ChildrenOutput)
    }
    Remove-EmptyValue -Hashtable $ChartNode
    $ChartNode
}