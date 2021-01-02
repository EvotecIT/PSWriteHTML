function ConvertTo-Size {
    [cmdletBinding()]
    param(
        [alias('TextSize', 'FontSize')][object] $Size
    )
    $Point = $false
    if ($Size -is [int]) {
        $Size
    } elseif ($Size -is [string]) {
        $IntSize = 0
        if ($Size -like '*px') {
            $Size = $Size -replace 'px'
        } elseif ($Size -like '*pt') {
            $Size = $Size -replace 'pt'
            $Point = $true # 1.3333333333333333
        }
        $Conversion = [int]::TryParse($Size, [ref] $IntSize)
        if ($Conversion) {
            if ($Point) {
                $IntSize * 1.3333333333333333
            } else {
                $IntSize
            }
        }
    }
}