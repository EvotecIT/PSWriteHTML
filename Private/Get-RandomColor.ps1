
Function Get-RandomColor {
    <#
    .SYNOPSIS
        Random colour Function
    #>
    param(
        [int]$RMin = 0,
        [int]$RMax = 255,
        [int]$GMin = 0,
        [int]$GMax = 255,
        [int]$BMin = 0,
        [int]$BMax = 255
    )
    $R = (Get-Random -Maximum $RMax -Minimum $RMin)
    $G = (Get-Random -Maximum $GMax -Minimum $GMin)
    $B = (Get-Random -Maximum $BMax -Minimum $BMin)

    @($R, $G, $B)
}