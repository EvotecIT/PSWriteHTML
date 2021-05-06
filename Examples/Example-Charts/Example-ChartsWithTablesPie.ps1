Import-Module .\PSWriteHTML.psd1 -Force

# Define data
$DataTable = @(
    [PSCustomObject] @{
        Name  = 'My Object 1'
        Time  = 1
        Money = 5
        Taxes = 20
    }
    [PSCustomObject] @{
        Name  = 'My Object 2'
        Time  = 3
        Money = 1
        Taxes = 5
    }
    [PSCustomObject] @{
        Name  = 'My Object 3'
        Time  = 12
        Money = 5
        Taxes = 1
    }
)

# Define HTML
New-HTML {
    New-HTMLSection {
        for ($i = 0; $i -le 5; $i++) {
            #New-HTMLContainer {
            New-HTMLChart {
                New-ChartToolbar -Download
                foreach ($Object in $DataTable) {
                    New-ChartPie -Name $Object.Name -Value $Object.Time
                }
            }
            #}
        }
    } -Direction column
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartsWithTablesPie.html -Online #-Format