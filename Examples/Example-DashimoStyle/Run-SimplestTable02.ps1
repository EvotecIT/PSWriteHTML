Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 200
$Process1 = Get-Process | Select-Object -First 5

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\Output\DashboardEasy02.html -Show {
    Section -Name 'Test1' -TextAlignment left -TextBackGroundColor BlueViolet {
        Table -DataTable $Process -PagingOptions @(50, 100, 150, 200) -HideFooter
        #Table -DataTable $Process1
    }
    Section -Name 'Test3' -BackgroundColor DarkOrange {
        Table -DataTable $Process1
        #  Table -DataTable $Process1
    }
    Section -Name 'Test2' -Collapsable {
        Panel {
            #    Table -DataTable $Process1
        }
        Panel {
            #   Table -DataTable $Process1
        }
    }
}