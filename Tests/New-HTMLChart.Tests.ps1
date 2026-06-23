Import-Module "$PSScriptRoot\..\PSWriteHTML.psd1" -Force

Describe 'New-HTMLChart additive chart APIs' {
    It 'Exports easy chart commands as public module functions' {
        $Commands = @(
            'New-ChartArea'
            'ChartArea'
            'New-ChartScatter'
            'ChartScatter'
            'New-ChartBubble'
            'ChartBubble'
            'New-ChartHeatmap'
            'ChartHeatmap'
            'New-ChartRadar'
            'ChartRadar'
            'New-ChartLabel'
            'ChartLabel'
        )

        foreach ($Command in $Commands) {
            Get-Command -Name $Command -Module PSWriteHTML -ErrorAction Stop | Should -Not -BeNullOrEmpty
        }
    }

    It 'Serializes additive ApexCharts types and label options' {
        $FilePath = "$PSScriptRoot\TemporaryCharts.html"

        New-HTML -TitleText 'Chart API Test' -FilePath $FilePath -Online {
            New-HTMLChart -Title 'Area' {
                New-ChartAxisX -Name 'Jan', 'Feb', 'Mar'
                New-ChartDataLabel -Enabled -OffsetX 1 -OffsetY 2
                New-ChartArea -Name 'Revenue' -Value 10, 20, 15 -Color Blue -Curve smooth
            }
            New-HTMLChart -Title 'Scatter' {
                New-ChartScatter -Name 'Samples' -X 1, 2, 3 -Y 10, 25, 18 -Color Purple
            }
            New-HTMLChart -Title 'Raw Scatter' {
                New-ChartScatter -Name 'RawSamples' -Data @(, @(1, 10), , @(2, 25)) -Color Purple
            }
            New-HTMLChart -Title 'Raw Point Scatter' {
                New-ChartScatter -Name 'RawPoint' -Data ([ordered] @{ x = 1; y = 10 }) -Color Purple
            }
            New-HTMLChart -Title 'Scalar Area' {
                New-ChartArea -Name 'SingleArea' -Value 10 -Color Blue
            }
            New-HTMLChart -Title 'Bubble' {
                New-ChartBubble -Name 'Risk' -X 1, 2, 3 -Y 20, 30, 15 -Z 5, 12, 8 -Color Orange
            }
            New-HTMLChart -Title 'Heatmap' {
                New-ChartHeatmap -Name 'Monday' -X 'AM', 'PM' -Y 12, 18
            }
            New-HTMLChart -Title 'Radar' {
                New-ChartAxisX -Name 'A', 'B', 'C'
                New-ChartRadar -Name 'Coverage' -Value 70, 85, 62 -Color Green
            }
            New-HTMLChart -Title 'Scalar Radar' {
                New-ChartRadar -Name 'SingleRadar' -Value 10 -Color Green
            }
            New-HTMLChart -Title 'Labels' {
                New-ChartPie -Name 'One' -Value 1
                New-ChartPie -Name 'Two' -Value 2
                New-ChartLabel -Name 'First', 'Second'
            }
        }

        $Content = Get-Content -Path $FilePath -Raw
        $Content | Should -Match '"type"\s*:\s*"area"'
        $Content | Should -Match '"type"\s*:\s*"scatter"'
        $Content | Should -Match '"data"\s*:\s*\[\s*\[\s*1\s*,\s*10\s*\]\s*,\s*\[\s*2\s*,\s*25\s*\]'
        $Content | Should -Match '"name"\s*:\s*"RawSamples"[\s\S]*"data"\s*:\s*\[\s*\[\s*1\s*,\s*10\s*\]\s*,\s*\[\s*2\s*,\s*25\s*\]'
        $Content | Should -Match '"name"\s*:\s*"RawPoint"[\s\S]*"data"\s*:\s*\[\s*\{\s*"x"\s*:\s*1\s*,\s*"y"\s*:\s*10\s*\}\s*\]'
        $Content | Should -Match '"name"\s*:\s*"SingleArea"[\s\S]*"data"\s*:\s*\[\s*10\s*\]'
        $Content | Should -Match '"type"\s*:\s*"bubble"'
        $Content | Should -Match '"type"\s*:\s*"heatmap"'
        $Content | Should -Match '"type"\s*:\s*"radar"'
        $Content | Should -Match '"name"\s*:\s*"SingleRadar"[\s\S]*"data"\s*:\s*\[\s*10\s*\]'
        $Content | Should -Match '"labels"\s*:\s*\[\s*"First"\s*,\s*"Second"\s*\]'
        $Content | Should -Match '"offsetY"\s*:\s*2'

        if (Test-Path $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }
    }
}
