Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 5
$Process1 = Get-Process | Select-Object -First 5
$Process2 = Get-Process | Select-Object -First 5
$Process3 = Get-Process | Select-Object -First 5

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\Output\DashboardEasy.html -Show {
    Tab -Name 'First tab' {
        Section -Name 'Test' {
            Table -DataTable $Process -Filtering
        }
        Section -Name 'Test2' -Collapsable -Collapsed {
            Panel {
                Table -DataTable $Process1
            }
            Panel {
                Table -DataTable $Process1
            }
        }
        Section -Name 'Test3' {
            Table -DataTable $Process -DefaultSortColumn 'Id'
        }
    }
    Tab -Name 'second tab' {
        Panel {
            Table -DataTable $Process2
        }
        Panel {
            Table -DataTable $Process2
        }
        Panel {
            Table -DataTable $Process3 -DefaultSortIndex 4 -ScrollCollapse
        }
    }
} -Online