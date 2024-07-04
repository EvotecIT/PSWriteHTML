function New-MapArea {
    <#
    .SYNOPSIS
    Creates a new MapArea object with specified parameters.

    .DESCRIPTION
    This function creates a new MapArea object with the specified area, href, value, and optional tooltip content.

    .PARAMETER Area
    Specifies the area for the MapArea object. This parameter is mandatory.

    .PARAMETER Href
    Specifies the href attribute for the MapArea object.

    .PARAMETER Value
    Specifies the value attribute for the MapArea object. This parameter is mandatory.

    .PARAMETER Tooltip
    Specifies the tooltip content for the MapArea object. This parameter can be provided as a script block.

    .EXAMPLE
    New-MapArea -Area "North" -Href "north.html" -Value "North Region" -Tooltip { "This is the North region." }

    Creates a new MapArea object for the North region with the specified href, value, and tooltip content.

    .EXAMPLE
    New-MapArea -Area "South" -Href "south.html" -Value "South Region"

    Creates a new MapArea object for the South region with the specified href and value.

    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $Area,
        [string] $Href,
        [Parameter(Mandatory)][string] $Value,
        [alias('Tooltip')][scriptblock] $TooltipContent
    )

    $OutputObject = [ordered] @{
        Type          = 'MapArea'
        Configuration = [ordered] @{
            $Area = [ordered] @{
                href    = $Href
                value   = $Value
                tooltip = @{
                    content = if ($TooltipContent) {
                        $ValueExecuted = & $TooltipContent
                        $ValueExecuted -join ""
                    } else {
                        $null
                    }
                }
            }
        }
    }
    Remove-EmptyValue -Hashtable $OutputObject.Configuration -Recursive -Rerun 2
    $OutputObject
}