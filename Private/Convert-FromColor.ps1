function ConvertFrom-Color {
    [alias('Convert-FromColor')]
    [CmdletBinding()]
    param (
        [ValidateScript({$_ -in $Script:RGBColors.Keys -or $_ -match "^#([A-Fa-f0-9]{6})$" -or $_ -eq ""})]
        [alias('Colors')][string[]] $Color,
        [switch] $AsDecimal
    )
    $Colors = foreach ($C in $Color) {
        $Value = $Script:RGBColors."$C"
        if($C -match "^#([A-Fa-f0-9]{6})$"){
            return $C
        }
        if ($null -eq $Value) {
            return
        }
        $HexValue = Convert-Color -RGB $Value
        Write-Verbose "Convert-FromColor - Color Name: $C Value: $Value HexValue: $HexValue"
        if ($AsDecimal) {
            [Convert]::ToInt64($HexValue, 16)
        } else {
            "#$($HexValue)"
        }
    }
    $Colors
}