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
            if ($TextSize -like '*px' -or $TextSize -like '*pt') {
                $TextSize
            } else {
                "$($TextSize)px"
            }
        }
    } else {
        $TextSize
    }
}