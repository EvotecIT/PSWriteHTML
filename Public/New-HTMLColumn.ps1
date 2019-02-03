Function New-HTMLColumn {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace with Content"),
        [alias('ColumnCount')][ValidateSet('1', '2', '3', '4', '5', '6')][string] $Columns = 1,
        [alias('BackgroundShade')][RGBColors]$BackgroundColor
    )
    Begin {}
    Process {
        if ($null -ne $BackgroundColor) {
            $BackGroundColorFromRGB = ConvertFrom-Color -Color $BackgroundColor
            $DivColumnStyle = "background-color:$BackGroundColorFromRGB"
        } else {
            $DivColumnStyle = ''
        }

        $Class = $Columns.Replace('1', 'one').Replace('2', 'two').Replace('3', 'three').Replace('4', 'four').Replace('5', 'five').Replace('6', 'six')
        $DivColumn = [Ordered] @{
            Tag        = 'div'
            Attributes = [ordered]@{
                'class' = "$Class column card"
                'style' = $DivColumnStyle
            }
            Value      = Invoke-Command -ScriptBlock $Content
        }
        $HTML = Set-Tag -HtmlObject $DivColumn
    }
    End {
        return $HTML
    }
}