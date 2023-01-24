Import-Module .\PSWriteHTML.psd1 -Force

# Define HTML
New-HTML {
    New-HTMLSection {
        New-HTMLChart {
            New-ChartPie -Name 'Pie Part 1' -Value 20
            New-ChartPie -Name 'Pie Part 2' -Value 30
            New-ChartPie -Name 'Pie Part 3' -Value 40
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartsPie.html -Online