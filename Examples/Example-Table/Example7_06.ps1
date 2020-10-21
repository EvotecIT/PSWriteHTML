Import-Module .\PSWriteHTML.psd1 -Force

$Table = Get-Process | Select-Object -First 4

New-HTML -TitleText "Testing HideButtons" -Online -FilePath "$PSScriptRoot\Example7_06.html" {
    # Hide Buttons
    New-HTMLSection -HeaderText "Hide Buttons" -Content {
        New-HTMLTable -DataTable $Table -HideButtons
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText "Hide Buttons" -Content {
            New-HTMLTable -DataTable $Table -HideButtons -Transpose
        }
        New-HTMLSection -HeaderText 'Some chart' {
            New-HTMLChart {
                New-ChartPie -Name 'Passed' -Value 5 -Color $ColorPassed
                New-ChartPie -Name 'Failed' -Value 10 -Color $ColorFailed
                New-ChartPie -Name 'Skipped' -Value 15 -Color $ColorSkipped
            }
        }
    }
    New-HTMLSection -HeaderText "Code used to generate above tables" -Content {
        New-HTMLCodeBlock {
            New-HTMLSection -HeaderText "Hide Buttons" -Content {
                New-HTMLTable -DataTable $Table -HideButtons
            }

            New-HTMLSection -Invisible {
                New-HTMLSection -HeaderText "Hide Buttons" -Content {
                    New-HTMLTable -DataTable $Table -HideButtons -Transpose
                }
                New-HTMLSection -HeaderText 'Some chart' {
                    New-HTMLChart {
                        New-ChartPie -Name 'Passed' -Value 5 -Color $ColorPassed
                        New-ChartPie -Name 'Failed' -Value 10 -Color $ColorFailed
                        New-ChartPie -Name 'Skipped' -Value 15 -Color $ColorSkipped
                    }
                }
            }
        }
    }
} -ShowHTML