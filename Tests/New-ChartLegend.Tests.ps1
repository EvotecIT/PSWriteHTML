BeforeAll {
    Import-Module (Join-Path $PSScriptRoot '../PSWriteHTML.psd1') -Force
}

Describe 'Chart legend spacing' {
    It 'preserves explicit legend margins: <Case>' -TestCases @(
        @{ Case = 'vertical only'; Margins = @{ ItemMarginVertical = 12 }; Horizontal = $null; Vertical = 12 }
        @{ Case = 'zero vertical only'; Margins = @{ ItemMarginVertical = 0 }; Horizontal = $null; Vertical = 0 }
        @{ Case = 'horizontal only'; Margins = @{ ItemMarginHorizontal = 8 }; Horizontal = 8; Vertical = $null }
        @{ Case = 'both margins'; Margins = @{ ItemMarginHorizontal = 8; ItemMarginVertical = 12 }; Horizontal = 8; Vertical = 12 }
    ) {
        param($Case, $Margins, $Horizontal, $Vertical)
        $Html = New-HTML -Online {
            New-HTMLChart {
                New-ChartPie -Name 'First' -Value 1
                New-ChartPie -Name 'Second' -Value 2
                New-ChartLegend @Margins
            }
        }
        $Json = [regex]::Match($Html, '(?s)var options = (.*?)\s*if \(options.chart.type').Groups[1].Value
        $Legend = ($Json | ConvertFrom-Json).legend

        $Legend.itemMargin.horizontal | Should -Be $Horizontal
        $Legend.itemMargin.vertical | Should -Be $Vertical
    }

    It 'leaves unspecified legend margins at the vendor defaults' {
        $Html = New-HTML -Online {
            New-HTMLChart {
                New-ChartPie -Name 'First' -Value 1
                New-ChartLegend
            }
        }
        $Json = [regex]::Match($Html, '(?s)var options = (.*?)\s*if \(options.chart.type').Groups[1].Value
        ($Json | ConvertFrom-Json).legend.PSObject.Properties.Name | Should -Not -Contain 'itemMargin'
    }
}
