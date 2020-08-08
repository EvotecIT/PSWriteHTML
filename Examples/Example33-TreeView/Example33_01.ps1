#Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example33_01.html" {
    New-HTMLTree -Checkbox none {
        New-TreeNode -Title 'Test' -Id 'Test' -Folder {
            New-TreeNode -Title 'ooh' {
                New-TreeNode -Title 'Test1'
                New-TreeNode -Title 'Test2' {
                    New-TreeNode -Title 'Nope'
                }
            }
        }
    }
} -Online -ShowHTML