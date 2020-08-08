#Import-Module .\PSWriteHTML.psd1 -Force

$ProcessSmaller = Get-Process | Select-Object -First 1

New-HTML -Name 'Test' -FilePath "$PSScriptRoot\Example29-HierarchicalTree01.html" -Show {
    New-HTMLSection {
        New-HTMLSection -HeaderText 'Test 1' {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLSection -HeaderText 'Test 2' {
            New-HTMLHierarchicalTree {
                New-HierarchicalTreeNode -Label 'Test' -Description 'Long test'
                New-HierarchicalTreeNode -Label 'Test 2nd' -To 'Test' -Description 'You need1'
                New-HierarchicalTreeNode -Label 'Test 3rd' -To 'Test' -Description 'You ooo'
                New-HierarchicalTreeNode -Label 'Test 4th' -To 'Test 2nd' -Description 'You ooo'
            }
        }
    }
} -Online