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
        # [string] $ClassName,
        [string] $TitleBackgroundColor,
        [string] $TitleBorderColor,
        [string] $TitleColor,
        [string] $ContentBackgroundColor,
        [string] $ContentBorderColor,
        [string] $ContentColor
    )

    $ClassName = "orgchartColoring$(Get-RandomStringName -Size 8 -LettersOnly)"
    $StyleNodeInformation = @{
        ".orgchart .$ClassName .title"   = @{
            'color'            = ConvertFrom-Color -Color $TitleColor
            'border-color'     = ConvertFrom-Color -Color $TitleBorderColor
            'background-color' = ConvertFrom-Color -Color $TitleBackgroundColor
        }
        ".orgchart .$ClassName .content" = @{
            'color'            = ConvertFrom-Color -Color $ContentColor
            'border-color'     = ConvertFrom-Color -Color $ContentBorderColor
            'background-color' = ConvertFrom-Color -Color $ContentBackgroundColor
        }
    }
    Remove-EmptyValue -Hashtable $StyleNodeInformation -Recursive -Rerun 2
    if ($StyleNodeInformation) {
        Add-HTMLStyle -Placement Header -Css $StyleNodeInformation -SkipTags
    }
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

Register-ArgumentCompleter -CommandName New-OrgChartNode -ParameterName TitleBackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-OrgChartNode -ParameterName TitleColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-OrgChartNode -ParameterName BorderColor -ScriptBlock $Script:ScriptBlockColors