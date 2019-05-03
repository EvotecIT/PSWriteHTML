function New-HTMLToast {
    [CmdletBinding()]
    param(
        [string] $TextHeader,
        [string] $Text,
        [ValidateSet('Green', 'Blue', 'Orange')] $Color = "Green",
        [ValidateSet('Success', 'Information', 'Exclamation')][string] $Icon = 'Success',
        [string] $Type = 'central'
    )
    $Script:HTMLSchema.Features.Toast = $true
    if ($Type -eq 'central') {
        $DivClass = "toast $($Color.ToLower()) central"
    } else {
        $DivClass = "toast $($Color.ToLower())"
    }
    New-HTMLTag -Tag 'div' -Attributes @{ class = $DivClass } {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'toast__icon' } {
            if ($Icon -eq 'Success') {
                New-IconSuccess
            } elseif ($Icon -eq 'Information') {
                New-IconInfo
            } elseif ($Icon -eq 'Exclamation') {
                New-IconExclamation
            }
        }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'toast__content' } {
            New-HTMLTag -Tag 'p' -Attributes @{ class = 'toast__type' } {
                $TextHeader
            }
            New-HTMLTag -Tag 'p' -Attributes @{ class = 'toast__message' } {
                $Text
            }
        }
    }
}