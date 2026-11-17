BeforeAll {
    Import-Module (Join-Path $PSScriptRoot '../PSWriteHTML.psd1') -Force
}

Describe 'Chart X-axis bounds' {
    It 'preserves explicit numeric bounds: <Case>' -TestCases @(
        @{ Case = 'zero minimum'; Minimum = 0; Maximum = 10 }
        @{ Case = 'negative range ending at zero'; Minimum = -10; Maximum = 0 }
        @{ Case = 'fractional range'; Minimum = -0.25; Maximum = 0.75 }
        @{ Case = 'large numeric range'; Minimum = 3000000000; Maximum = 4000000000 }
    ) {
        param($Case, $Minimum, $Maximum)

        $Html = New-HTML -Online {
            New-HTMLChart {
                New-ChartAxisX -Type numeric -MinValue $Minimum -MaxValue $Maximum
                New-ChartLine -Name 'Samples' -Value 1, 2
            }
        }
        $Json = [regex]::Match($Html, '(?s)var options = (.*?)\s*if \(options.chart.type').Groups[1].Value
        $Options = $Json | ConvertFrom-Json

        $Options.xaxis.min | Should -Be $Minimum
        $Options.xaxis.max | Should -Be $Maximum
    }

    It 'leaves unspecified bounds available for automatic scaling' {
        $Html = New-HTML -Online {
            New-HTMLChart {
                New-ChartAxisX -Names First, Second
                New-ChartLine -Name 'Samples' -Value 1, 2
            }
        }
        $Json = [regex]::Match($Html, '(?s)var options = (.*?)\s*if \(options.chart.type').Groups[1].Value
        $Options = $Json | ConvertFrom-Json

        $Options.xaxis.PSObject.Properties.Name | Should -Not -Contain 'min'
        $Options.xaxis.PSObject.Properties.Name | Should -Not -Contain 'max'
    }

    It 'preserves epoch bounds and multiple intervals for the same timeline label' {
        $Start = [datetime]::SpecifyKind([datetime]'1969-12-31', [DateTimeKind]::Utc)
        $End = [datetime]::SpecifyKind([datetime]'1970-01-01', [DateTimeKind]::Utc)
        $Html = New-HTML -Online {
            New-HTMLChart {
                New-ChartAxisX -MinValue $Start -MaxValue $End
                New-ChartTimeLine -Name 'Work' -DateFrom $Start -DateTo $Start.AddHours(2) -TimeZoneOffset '+00:00'
                New-ChartTimeLine -Name 'Work' -DateFrom $Start.AddHours(4) -DateTo $End -TimeZoneOffset '+00:00'
            }
        }
        $Json = [regex]::Match($Html, '(?s)var options = (.*?)\s*if \(options.chart.type').Groups[1].Value
        $Options = $Json | ConvertFrom-Json

        $Options.xaxis.type | Should -Be 'datetime'
        $Options.xaxis.min | Should -Be -86400000
        $Options.xaxis.max | Should -Be 0
        $Options.series[0].data | Should -HaveCount 2
        $Options.series[0].data[0].x | Should -Be 'Work'
        $Options.series[0].data[1].x | Should -Be 'Work'
    }
}
