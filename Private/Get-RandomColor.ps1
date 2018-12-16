
Function Get-RandomColor {
    <#
.SYNOPSIS
	Random colour Function
#>
    param(
        [int]$Min = 0,
        [int]$max = 255
    )
    Write-Output ([string](Get-Random -Maximum $max -Minimum $Min) + ',' )
}