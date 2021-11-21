Import-Module .\PSWriteHTML.psd1 -Force

#$Process = Get-Process | Select-Object -First 30
$ProcessSmaller = Get-Process | Select-Object -First 1

New-HTML -Name 'Test' -FilePath "$PSScriptRoot\Example27-01.html" -Show {
    New-HTMLSection -HeaderText 'Test Header' -HeaderTextSize 20 {
        New-HTMLSection -HeaderText 'Test 1' -CanCollapse -Collapsed {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLSection -HeaderText 'Test 2' -CanCollapse -Collapsed {
            New-HTMLTable -DataTable $ProcessSmaller
        } -Margin 20px
    }
    New-HTMLSection -Collapsed -CanCollapse {
        New-HTMLPanel {
            New-HTMLChart -Gradient {
                New-ChartPie -Name 'Test' -Value 20
                New-ChartPie -Name 'Test1' -Value 30
                New-ChartPie -Name 'Test2' -Value 40
                New-ChartPie -Name 'Test1' -Value 30
                New-ChartPie -Name 'Test2' -Value 40
            }
        }
        New-HTMLPanel {
            New-HTMLChart -Gradient {
                New-ChartPie -Name 'Test' -Value 20
                New-ChartPie -Name 'Test1' -Value 30
                New-ChartPie -Name 'Test2' -Value 40
                New-ChartPie -Name 'Test1' -Value 30
                New-ChartPie -Name 'Test2' -Value 40
            }
        }
    } -Margin 50px
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Test 1' {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLSection -HeaderText 'Test 2' {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLSection -HeaderText 'Test 3' {

        }
    }
    New-HTMLSection -HeaderText 'Test Invisibility' {
        New-HTMLSection -Invisible {
            New-HTMLSection -HeaderText 'Test 1' {
                New-HTMLTable -DataTable $ProcessSmaller
            }
            New-HTMLSection -HeaderText 'Test 2' {
                New-HTMLTable -DataTable $ProcessSmaller
            }
            New-HTMLSection -HeaderText 'Test 3' {

            }
        }
    }
} -Online -Format