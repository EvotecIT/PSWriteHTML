function New-MapLegendOption {
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