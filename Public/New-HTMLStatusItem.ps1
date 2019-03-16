function New-HTMLStatusItem {
    param(
        $ServiceName,
        $ServiceStatus,
        [ValidateSet('Dead', 'Bad', 'Good')]$Icon = 'Good',
        [ValidateSet('0%', '10%', '30%', '70%', '100%')][string] $Percentage = '100%'
    )
    #$Script:HTMLSchema.Features.StatusButtonical = $true
    if ($Icon -eq 'Dead') {
        $IconType = 'performanceDead'
    } elseif ($Icon -eq 'Bad') { 
        $IconType = 'performanceProblem'
    } elseif ($Icon -eq 'Good') {
        #$IconType = 'performance'
    }

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

    New-HTMLTag -Tag 'div' -Attributes @{ class = 'buttonical'; style = $Colors } -Value {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'label' } {
            New-HTMLTag -Tag 'span' -Attributes @{ class = 'performance' } {
                $ServiceName
            }
        }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'middle' } 
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'status'} {
            New-HTMLTag -Tag 'input' -Attributes @{ name = Get-Random; type = 'radio'; value = 'other-item'; checked = 'true' } -SelfClosing
            New-HTMLTag -Tag 'span' -Attributes @{ class = "performance $IconType" } {
                $ServiceStatus
            }            
        }
    }
}