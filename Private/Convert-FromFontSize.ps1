function ConvertFrom-FontSize {
    [cmdletBinding()]
    param(
        [object] $TextSize
    )
    if ($TextSize -is [int]) {
        if ($TextSize) {
            "$($TextSize)px"
        }
    } elseif ($TextSize -is [string]) {
        if ($TextSize) {
            $IntSize = 0
            $Conversion = [int]::TryParse($TextSize, [ref] $IntSize)
            if ($Conversion) {
                "$($IntSize)px"
            } else {
                $TextSize
            }
        }
    } else {
        $TextSize
    }
}