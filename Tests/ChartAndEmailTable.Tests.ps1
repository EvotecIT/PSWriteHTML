BeforeAll {
    Import-Module (Join-Path $PSScriptRoot '../PSWriteHTML.psd1') -Force

    function Get-TestChartOptions {
        param([string] $Html)
        $Json = [regex]::Match($Html, '(?s)var options = (.*?)\s*if \(options.chart.type').Groups[1].Value
        $Json | ConvertFrom-Json
    }
}

Describe 'Chart and email report options' {
    It 'keeps stroke widths attached to the correct series in a mixed chart' {
        $Html = New-HTML -Online {
            New-HTMLChart {
                New-ChartAxisX -Names First, Second
                New-ChartLine -Name Default -Value 2, 3
                New-ChartBar -Name Columns -Value 4, 5
                New-ChartLine -Name Dashed -Value 6, 7 -Width 4 -Dash 8
            }
        }
        $Options = Get-TestChartOptions -Html $Html

        ($Options.series.name -join ',') | Should -Be 'Default,Columns,Dashed'
        ($Options.stroke.width -join ',') | Should -Be '2,0,4'
        ($Options.stroke.dashArray -join ',') | Should -Be '0,0,8'
    }

    It 'sets chart colors while allowing a title color override' {
        $Html = New-HTML -Online {
            New-HTMLChart -Title 'Status' -TitleColor '#ff8533' -TextColor '#fafbfc' -BackgroundColor '#151922' {
                New-ChartBar -Name Counts -Value 2, 3
            }
        }
        $Options = Get-TestChartOptions -Html $Html

        $Options.chart.foreColor | Should -Be '#fafbfc'
        $Options.chart.background | Should -Be '#151922'
        $Options.title.style.color | Should -Be '#ff8533'
    }

    It 'writes email column widths on data cells and preserves cell formatting' {
        $Rows = [pscustomobject]@{ Name = 'Alpha'; Details = 'Open report'; State = 'Ready' }
        $Html = EmailBody {
            EmailTable -Table $Rows {
                EmailTableColumnOption -ColumnIndex 0 -Width '220px'
                EmailTableColumnOption -ColumnIndex 1 -Width '30%'
                New-TableContent -ColumnName Name -BackgroundColor '#ff8533'
            }
        }

        $Cells = [regex]::Matches($Html, '<td\b[^>]*>[^<]*</td>').Value
        $Cells | Should -HaveCount 3
        $Cells[0] | Should -Match '\bwidth="220"'
        $Cells[0] | Should -Match 'width:220px'
        $Cells[0] | Should -Match 'background-color:#ff8533'
        $Cells[1] | Should -Match '\bwidth="30%"'
        $Cells[2] | Should -Not -Match '\bwidth'
    }

    It 'emits scoped header and content rules for email data tables' {
        $Rows = [pscustomobject]@{ Name = 'Alpha'; State = 'Ready' }
        $Html = EmailBody {
            New-HTMLTableStyle -Type Header -TextColor '#fafbfc' -BackgroundColor '#151922' -FontFamily Calibri
            New-HTMLTableStyle -Type Header -FontSize 18
            New-HTMLTableStyle -Type Content -TextColor '#1155aa'
            EmailTable -Table $Rows
            EmailLayout { EmailLayoutColumn { EmailText -Text 'Layout' } }
        }

        $HeaderRule = [regex]::Match($Html, 'table\.dataTables > thead > tr > th\s*\{([^}]+)').Groups[1].Value
        $HeaderRule | Should -Match 'color:\s*#fafbfc'
        $HeaderRule | Should -Match 'background-color:\s*#151922'
        $HeaderRule | Should -Match 'font-size:\s*18px'
        $HeaderRule | Should -Match 'font-family:\s*Calibri'
        $Html | Should -Match 'table\.dataTables > tbody > tr > td\s*\{[^}]*color:\s*#1155aa'
    }

    It 'styles a simplified email table without adding global email table rules' {
        $Rows = [pscustomobject]@{ Name = 'Alpha'; State = 'Ready' }
        $Html = EmailBody {
            New-HTMLTableStyle -Type Header -BackgroundColor '#151922'
            EmailTable -Table $Rows -Simplify
            EmailLayout { EmailLayoutColumn { EmailText -Text 'Layout' } }
        }

        $Html | Should -Match 'table\.simplify > thead > tr > th\s*\{[^}]*background-color:\s*#151922'
        $Html | Should -Not -Match '(?:^|[>}])\s*table td\s*\{'
    }
}
