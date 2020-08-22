function ConvertFrom-FontSize {
    [cmdletBinding()]
    param(
        [alias('TextSize')][object] $FontSize
    )
    if ($FontSize -is [int]) {
        if ($FontSize) {
            "$($FontSize)px"
        }
    } elseif ($FontSize -is [string]) {
        if ($FontSize) {
            $IntSize = 0
            $Conversion = [int]::TryParse($FontSize, [ref] $IntSize)
            if ($Conversion) {
                "$($FontSize)px"
            } else {
                $FontSize
            }
        }
    } else {
        $FontSize
    }
}