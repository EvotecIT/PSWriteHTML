Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example-TreeView02.html" {
    New-HTMLTree -Checkbox none {
        New-HTMLTreeNode -Title 'Power comes on' -Icon 'https://cdn-icons-png.flaticon.com/512/5610/5610944.png' {
            New-HTMLTreeNode -Title 'Live screen' -Icon 'https://cdn-icons-png.flaticon.com/512/5610/5610944.png' {
                New-HTMLTreeNode -Title 'New build' -Icon 'https://cdn-icons-png.flaticon.com/512/5610/5610944.png'
                New-HTMLTreeNode -Title '<b>No</b> new build' -Icon 'https://cdn-icons-png.flaticon.com/512/6939/6939131.png' {
                    New-HTMLTreeNode -Title 'Need two tries to boot' -Icon 'https://cdn-icons-png.flaticon.com/512/5610/5610944.png' {
                        New-HTMLTreeNode -Title 'Premature power_good signal. Try different power supply.' -Icon 'https://cdn-icons-png.flaticon.com/512/6897/6897039.png'
                    }
                    New-HTMLTreeNode -Title 'Does not need two tries to boot' -Icon 'https://cdn-icons-png.flaticon.com/512/6939/6939131.png'
                }
            }
            New-HTMLTreeNode -Title "<b>No</b> live screen" -Icon 'https://cdn-icons-png.flaticon.com/512/6939/6939131.png' {
                New-HTMLTreeNode -Title "Proceed to video failure chart" -Icon 'https://cdn-icons-png.flaticon.com/512/1294/1294758.png'
            }
        }
    } -AutoScroll -MinimumExpandLevel 1
} -Online -ShowHTML