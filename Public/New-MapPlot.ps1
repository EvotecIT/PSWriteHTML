function New-MapPlot {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $Plot,
        [Parameter(Mandatory)][double] $Latitude,
        [Parameter(Mandatory)][double] $Longitude,
        [string] $Href,
        [Parameter(Mandatory)][string] $Value,
        [alias('Tooltip')][scriptblock] $TooltipContent
    )

    $OutputObject = [ordered] @{
        Type          = 'MapPlot'
        Configuration = [ordered] @{
            $Plot = [ordered] @{
                latitude  = $Latitude
                longitude = $Longitude
                href      = $Href
                value     = $Value
                tooltip   = @{
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