Function New-HTMLColumn {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace with Content"),
        [alias('ColumnCount')][ValidateSet('1', '2', '3', '4', '5', '6')][string] $Columns = 1
    )
    Begin {}
    Process {
        $Class = $Columns.Replace('1', 'one').Replace('2', 'two').Replace('3', 'three').Replace('4', 'four').Replace('5', 'five').Replace('6', 'six')
   
        $DivColumn = [Ordered] @{
            Tag        = 'div'
            Attributes = [ordered]@{
                'class' = "$Class column card"
            }
            Value      = Invoke-Command -ScriptBlock $Content
        }
        $HTML = Set-Tag -HtmlObject $DivColumn
    }
    End {
        return $HTML
    }
}