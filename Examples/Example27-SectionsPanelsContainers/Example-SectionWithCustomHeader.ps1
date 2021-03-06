
Import-Module .\PSWriteHTML.psd1 -Force

$ProcessSmaller = Get-Process | Select-Object -First 1

New-HTML -Name 'Test' -FilePath "$PSScriptRoot\Example27-01.html" -Show {
    $CustomHeader = New-HTMLText -TextDecoration line-through -FontSize 20px {
        'Test'
    }
    New-HTMLSection -HeaderText $CustomHeader {
        New-HTMLSection -HeaderText 'Test 1' -CanCollapse -Collapsed {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLSection -HeaderText 'Test 2' -CanCollapse -Collapsed {
            New-HTMLTable -DataTable $ProcessSmaller
        }
    }
}
