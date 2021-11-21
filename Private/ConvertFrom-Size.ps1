function ConvertFrom-Size {
    [cmdletBinding()]
    param(
        [alias('TextSize', 'FontSize')][object] $Size
    )
    if ($Size -is [int]) {
        "$($Size)px"
    } elseif ($Size -is [string]) {
        $IntSize = 0
        $Conversion = [int]::TryParse($Size, [ref] $IntSize)
        if ($Conversion) {
            "$($Size)px"
        } else {
            $Size
        }
    } else {
        $Size
    }
}