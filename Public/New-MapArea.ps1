function New-MapArea {
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