Import-Module .\PSWriteHTML.psd1 -Force

#$Process = Get-Process | Select-Object -First 30
$ProcessSmaller = Get-Process | Select-Object -First 1

New-HTML -Name 'Test' -FilePath "$PSScriptRoot\Example27-08.html" -Show {
    New-HTMLSection -HeaderText 'Test 0' {
        New-HTMLSection -HeaderText 'Test 1' {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLSection -HeaderText 'Test 2' {
            New-HTMLTable -DataTable $ProcessSmaller
        }
    }
    New-HTMLSection -HeaderText 'Test 0' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $ProcessSmaller
        }
    }
    New-HTMLPanel {
        New-HTMLPanel {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $ProcessSmaller
        }
    }
    New-HTMLPanel -Invisible {
        New-HTMLSection {
            New-HTMLPanel {
                New-HTMLTable -DataTable $ProcessSmaller
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $ProcessSmaller
            }
        }
    }
    New-HTMLSection -HeaderText 'This is what you want right?' {
        New-HTMLPanel -Invisible {
            New-HTMLPanel {
                New-HTMLTable -DataTable $ProcessSmaller
            }
            New-HTMLPanel {
                New-HTMLTable -DataTable $ProcessSmaller
            }
        }
    }
}
