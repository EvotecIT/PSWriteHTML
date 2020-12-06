# THIS IS NOT FINISHED
# I DON'T KNOW HOW TO BUILD THIS :-)

Import-Module .\PSWriteHTML.psd1 -Force

$Content = Get-ChildItem -LiteralPath 'C:\Support\Application-FFMPG' -Recurse
#$CurrentParent = $_.PSParentPath -replace 'Microsoft.PowerShell.Core\FileSystem::',''
if ($CurrentParent) {


}

New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example33_02.html" {
    New-HTMLTree -Checkbox none {


        foreach ($_ in $Content) {



            New-TreeNode -Title $Parent {
              #  New-TreeNode -Title $_.Name
            }
        }
        <#
        New-TreeNode -Title 'Test' -Id 'Test' -Folder {
            New-TreeNode -Title 'ooh' {
                New-TreeNode -Title 'Test1'
                New-TreeNode -Title 'Test2' {
                    New-TreeNode -Title 'Nope'
                }
            }
        }
        #>
    }
} -Online #-ShowHTML