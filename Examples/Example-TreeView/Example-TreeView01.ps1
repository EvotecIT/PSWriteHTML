Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example-TreeView01.html" {
    New-HTMLTree -Checkbox none {
        New-HTMLTreeChildCounter -Deep -HideZero -HideExpanded
        New-HTMLTreeNode -Title 'Power comes on' {
            New-HTMLTreeNode -Title 'Live screen' {
                New-HTMLTreeNode -Title 'New build'
                New-HTMLTreeNode -Title '<b>No</b> new build' {
                    New-HTMLTreeNode -Title 'Need two tries to boot' {
                        New-HTMLTreeNode -Title 'Premature power_good signal. Try different power supply.' -Icon 'https://cdn-icons-png.flaticon.com/512/6897/6897039.png'
                    }
                    New-HTMLTreeNode -Title 'Does not need two tries to boot'
                }
            }
            New-HTMLTreeNode -Title "<b>No</b> live screen" {
                New-HTMLTreeNode -Title "Proceed to video failure chart" -Icon 'https://cdn-icons-png.flaticon.com/512/1294/1294758.png'
            }
        }
    } -EnableChildCounter -AutoScroll -MinimumExpandLevel 1
} -Online -ShowHTML