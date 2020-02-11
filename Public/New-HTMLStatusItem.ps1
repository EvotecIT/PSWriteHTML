function New-HTMLStatusItem {
    [CmdletBinding(DefaultParameterSetName = 'Percent')]
    param(
        [string] $ServiceName,

        [string] $ServiceStatus,

        [ValidateSet('Dead', 'Bad', 'Good')]
        [string]$Icon = 'Good',

        [ValidateSet('0%', '10%', '30%', '70%', '100%')]
        [Parameter(ParameterSetName = 'Percent')]
        [string]$Percentage = '100%',

        [ValidatePattern('^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$')]
        [Parameter(ParameterSetName = 'Hex')]
        [string]$BackgroundColor,

        [ValidatePattern('^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$')]
        [string]$FontColor = '#5f6982',

        [ValidatePattern('^&#x[A-Fa-f0-9]{4,5}')]
        [string]$IconHex
    )
    #$Script:HTMLSchema.Features.StatusButtonical = $true
    if ($IconHex) {
        $IconType = $IconHex
    }
    else {
        if ($Icon -eq 'Dead') {
            $IconType = '&#x2620'
        } elseif ($Icon -eq 'Bad') {
            $IconType = '&#x2639'
        } elseif ($Icon -eq 'Good') {
            $IconType = '&#x2714'
        }
    }

    if ($PSCmdlet.ParameterSetName -eq 'Percent') {
        if ($Percentage -eq '100%') {
            $Colors = 'background-color: #0ef49b;'
        } elseif ($Percentage -eq '70%') {
            $Colors = 'background-color: #d2dc69;'
        } elseif ($Percentage -eq '30%') {
            $Colors = 'background-color: #faa04b;'
        } elseif ($Percentage -eq '10%') {
            $Colors = 'background-color: #ff9035;'
        } elseif ($Percentage -eq '0%') {
            $Colors = 'background-color: #ff5a64;'
        }
    }
    elseif ($PSCmdlet.ParameterSetName -eq 'Hex') {
        $Colors = "background-color: $BackgroundColor"
    }

    New-HTMLTag -Tag 'div' -Attributes @{ class = 'buttonical'; style = $Colors } -Value {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'label' } {
            New-HTMLTag -Tag 'span' -Attributes @{ class = 'performance'; style = "color: $FontColor" } {
                $ServiceName
            }
        }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'middle' }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'status'} {
            New-HTMLTag -Tag 'input' -Attributes @{ name = Get-Random; type = 'radio'; value = 'other-item'; checked = 'true' } -SelfClosing
            New-HTMLTag -Tag 'span' -Attributes @{ class = 'performance'; style = "color: $FontColor" } {
                $ServiceStatus
                New-HTMLTag -Tag 'span' -Attributes @{ class = 'icon' } {
                    $IconType
                }
            }
        }
    }
}