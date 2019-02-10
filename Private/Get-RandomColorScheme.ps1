Function Get-RandomColorScheme {
    <#
    .SYNOPSIS
    Generate a colour scheme

    
    .DESCRIPTION
    Generate a colour scheme
    
    .PARAMETER NumberOfSchemes
    Parameter description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    
    param
    (
        [Parameter(Mandatory = $false)][int]$NumberOfSchemes = 1
    )

    [string] $Hover = 0.3
    [string] $color = 0.6
    [string] $border = 1
    [string] $background = 0.7
    [int] $ColorSwing = 8

    $ColorReference = Get-Random -Minimum 1 -Maximum 3
    $BaseColor = (Get-Random -Maximum (200 - $ColorSwing) -Minimum (50 + $ColorSwing))
    $BCMax = $BaseColor + $ColorSwing
    $BCMin = $BaseColor - $ColorSwing

    $i = 0
    while ($i -ne $NumberOfSchemes) {       
        switch ($ColorReference) {
            1 { [int[]] $base = Get-RandomColor -rmin $BCMin -rmax $BCMax }
            2 { [int[]] $base = Get-RandomColor -gmin $BCMin -gmax $BCMax }
            3 { [int[]] $base = Get-RandomColor -bmin $BCMin -bcmax $BCMax }
        }

        [PSCustomObject] @{
            Background = "rgba($($base + $background -join ','))"
            Border     = "rgba($($base + $border -join ','))"
            Colour     = "rgba($($base + $color -join ','))"
            Hover      = "rgba($($base + $Hover -join ','))"
        }
        $i++
    }


}