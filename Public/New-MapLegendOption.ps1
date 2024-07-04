function New-MapLegendOption {
    <#
    .SYNOPSIS
    Creates a new map legend option with specified parameters.

    .DESCRIPTION
    This function creates a new map legend option with the provided parameters. It allows customization of the legend title, redraw behavior on resize, and display mode.

    .PARAMETER Type
    Specifies the type of the legend option. Valid values are 'area' and 'plot'.

    .PARAMETER Title
    Specifies the title of the legend option.

    .PARAMETER RedrawOnResize
    Specifies whether the legend should redraw on resize. Default is $null.

    .PARAMETER Mode
    Specifies the display mode of the legend option. Valid values are 'horizontal' and 'vertical'.

    .EXAMPLE
    New-MapLegendOption -Type "area" -Title "Area Legend" -RedrawOnResize $true -Mode "horizontal"
    Creates a new map legend option for an area with the title "Area Legend", redraws on resize, and displays horizontally.

    .EXAMPLE
    New-MapLegendOption -Type "plot" -Title "Plot Legend" -Mode "vertical"
    Creates a new map legend option for a plot with the title "Plot Legend" and displays vertically.

    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][ValidateSet('area', 'plot')]$Type,
        [string] $Title,
        [nullable[bool]] $RedrawOnResize,
        [ValidateSet('horizontal', 'vertical')][string] $Mode
    )

    $OutputObject = [ordered] @{
        Type          = 'MapLegendOption'
        Configuration = [ordered] @{
            default = [ordered] @{
                redrawOnResize = $RedrawOnResize
            }
            area    = [ordered] @{}
            plot    = [ordered] @{}
        }
    }
    if ($Type -eq 'area') {
        $OutputObject.Configuration.area = [ordered] @{
            title = $Title
            mode  = $Mode
        }
    } elseif ($Type -eq 'plot') {
        $OutputObject.Configuration.plot = [ordered] @{
            title = $Title
            mode  = $Mode
        }
    }
    Remove-EmptyValue -Hashtable $OutputObject.Configuration -Recursive -Rerun 2
    $OutputObject
}