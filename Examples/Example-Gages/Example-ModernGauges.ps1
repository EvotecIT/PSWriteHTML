Import-Module (Join-Path $PSScriptRoot '../../PSWriteHTML.psd1') -Force

New-HTML -TitleText 'Service health gauges' -FilePath (Join-Path $PSScriptRoot 'Example-ModernGauges.html') {
    New-HTMLSection -HeaderText 'Service health' {
        New-HTMLPanel {
            New-HTMLGauge -Label 'Queue utilization' -Value 67 -Unit '%' -Color '#0078d4'
        }
        New-HTMLPanel {
            New-HTMLGauge -Label 'Response time' -Value 180 -MinValue 0 -MaxValue 250 -Unit ' ms' -Color '#a35400'
        }
    }
}
