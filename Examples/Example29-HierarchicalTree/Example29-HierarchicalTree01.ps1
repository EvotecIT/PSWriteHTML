Import-Module .\PSWriteHTML.psd1 -Force

#$Process = Get-Process | Select-Object -First 30
#$ProcessSmaller = Get-Process | Select-Object -First 1

New-HTML -Name 'Test' -FilePath "$PSScriptRoot\Example29-HierarchicalTree01.html" -Show {
    New-HTMLSection {
        New-HTMLSection -HeaderText 'Test 1' {
            New-HTMLTable -DataTable $ProcessSmaller
        }
        New-HTMLSection -HeaderText 'Test 2' {
            New-HTMLHierarchicalTree {
                New-TreeNode -Label 'Test' -Description 'Long test'
                New-TreeNode -Label 'Test 2nd' -To 'Test' -Description 'You need1'
                New-TreeNode -Label 'Test 3rd' -To 'Test' -Description 'You ooo'
                New-TreeNode -Label 'Test 4th' -To 'Test 2nd' -Description 'You ooo'
            }
        }
    }
} -UseCssLinks -UseJavaScriptLinks