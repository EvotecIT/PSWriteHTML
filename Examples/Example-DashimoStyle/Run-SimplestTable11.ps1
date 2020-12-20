Import-Module .\PSWriteHTML.psd1 -Force

$outputfile = "$PSScriptRoot\Output\DashboardEasy11.html"
$p1 = Get-Process | select-object -first 5

Dashboard -Name "Office365 Status" -FilePath $outputfile -AutoRefresh 300 {
    Tab -Name 'Current Issues' {
        Section -Invisible {
            Section -Name 'Current Issues' {
                Table -DataTable $p1  -Style cell-border {
                    TableConditionalFormatting -Name 'Name' -ComparisonType string -Operator eq -Value "1Password" -Color White -BackgroundColor Crimson -Row
                    TableConditionalFormatting -Name 'Name' -ComparisonType string -Operator eq -Value "AppVShNotify" -Color White -BackgroundColor DarkOrange -Row
                    TableConditionalFormatting -Name 'Name' -ComparisonType string -Operator eq -Value "ApplicationFrameHost" -Color White -BackgroundColor Yellow -Row
                }
            }
        }
    }
} -Show