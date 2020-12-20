Import-Module .\PSWriteHTML.psd1 -Force

$Process = Get-Process | Select-Object -First 30

Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\Output\DashboardEasy03.html -Show {
    Section -Name 'Test1' -TextAlignment left -TextBackGroundColor BlueViolet {
        Table -DataTable $Process
        Table -DataTable $Process {
            TableConditionalFormatting -Name 'ID' -ComparisonType number -Operator gt -Value 16000 -Color BlueViolet -Row
            TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Normal' -BackgroundColor Gold
            TableConditionalFormatting -Name 'PriorityClass' -ComparisonType string -Operator eq -Value 'Idle' -BackgroundColor Gold -Color Green
        } -PreContent {
            New-HTMLText -Text 'TestPreContent' -Color Coral -Alignment center
        } -PostContent {
            # Notice how I'm adding table below another table in a very specific scenario
            New-HTMLText -Text 'TestPostContent' -Color Coral -Alignment center
            Table -DataTable $Process
        }
    }
    Section -Name 'Test3' -BackgroundColor DarkOrange {
        Table -DataTable $Process -DisablePaging
        Container {
            # a different way to add post and pre content
            Table -DataTable $Process1
            New-HTMLText -Text 'TestPostContent' -Color DodgerBlue -Alignment center
            Table -DataTable $Process
        }
    }
    Section -Name 'Test2' -Collapsable {
        Panel {
            Table -DataTable $Process
        }
        Panel {
            Table -DataTable $Process
        }
    }
}