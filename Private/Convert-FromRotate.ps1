function ConvertFrom-Rotate {
    [cmdletBinding()]
    param(
        [object] $Rotate
    )
    if ($Rotate -is [int]) {
        if ($Rotate -ne 0) {
            "rotate($($Rotate)deg)"
        }
    } elseif ($Rotate -is [string]) {
        if ($Rotate) {
            if (($Rotate -like '*deg*') -and ($Rotate -notlike '*rotate*')) {
                "rotate($Rotate)"
            } elseif (($Rotate -like '*deg*') -and ($Rotate -like '*rotate*')) {
                "$Rotate"
            } else {
                $Rotate
            }
        }
    }
}