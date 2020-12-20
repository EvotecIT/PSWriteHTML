Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 15 | Select-Object name, Priorityclass, fileversion, handles, cpu

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\Output\DashboardEasy05.html -Show {
    Section -Name 'Test' -Collapsable {
        Container {
            Panel {
                Table -DataTable $Process {
                    TableButtonPDF
                    TableButtonCopy
                    TableButtonExcel
                    TableButtonPageLength
                } -Buttons @() -DisableSearch -PagingOptions @(5, 10)  -HideFooter
            }
            Panel {
                Table -DataTable $Process -DisableSearch -HideFooter -PagingOptions @(5, 10)
            }
            Panel {
                Table -DataTable $Process {
                    TableButtonPDF -PageSize A10 -Orientation landscape
                    TableButtonCopy
                    TableButtonExcel
                } -Buttons @() -DisableSearch -DisablePaging -HideFooter
            }
        }
    }
}