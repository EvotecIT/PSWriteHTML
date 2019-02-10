Function New-HTMLColumn {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace with Content"),
        [alias('ColumnCount')][ValidateSet('1', '2', '3', '4', '5', '6')][string] $Columns = 1,
        [alias('BackgroundShade')][RGBColors]$BackgroundColor
    )
    if ($null -ne $BackgroundColor) {
        $BackGroundColorFromRGB = ConvertFrom-Color -Color $BackgroundColor
        $DivColumnStyle = "background-color:$BackGroundColorFromRGB"
    } else {
        $DivColumnStyle = ''
    }
    $Class = $Columns.Replace('1', 'one').Replace('2', 'two').Replace('3', 'three').Replace('4', 'four').Replace('5', 'five').Replace('6', 'six')
        
    New-HTMLTag -Tag 'div' -class "$Class column card" -style $DivColumnStyle {
        Invoke-Command -ScriptBlock $Content
    }
}


New-HTMLTag -Tag 'html' -Attributes @{ class = "something somethingelse"} {
    New-HTMLTag -Tag 'body'  {

    }
}
