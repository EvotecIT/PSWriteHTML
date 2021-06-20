function New-ChartBar {
    [alias('ChartBar')]
    [CmdletBinding()]
    param(
        [string] $Name,
        [object] $Value,
        [string] $NameExpected,
        [object] $ValueExpected
    )
    <#
    [PSCustomObject] @{
        ObjectType = 'Bar'
        Name       = $Name
        Value      = $Value
        series     = [ordered]@{
            name = $Name
            type = 'column'
            data = $Value
        }
    }
    #>
    $ChartBar = [PSCustomObject] @{
        ObjectType = 'Bar'
        #Name       = $Name
        #Value      = $Value
        series     = [ordered] @{
            name = $Name # This will be translated into options.xaxis.categories
            #type = 'column'
            data = [ordered] @{
                x     = $Name
                y     = $Value
                goals = @{
                    name  = $NameExpected
                    value = $ValueExpected
                }
            }
        }

    }
    Remove-EmptyValue -Hashtable $ChartBar.series -Recursive -Rerun 2
    $ChartBar
}