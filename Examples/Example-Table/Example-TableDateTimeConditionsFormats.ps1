Import-Module .\PSWriteHTML.psd1 -Force

# Demonstrates date comparisons with formats commonly used in PowerShell/.NET output,
# and verifies both HTML and JavaScript DataStore modes.

$DateDeleteCheck = Get-Date -Year 2025 -Month 1 -Day 5 -Hour 0 -Minute 0 -Second 0

$AdminsDisabled = @(
    [pscustomobject]@{ User = 'Before threshold'; RefreshTokenDate = $DateDeleteCheck.AddDays(-1) }
    [pscustomobject]@{ User = 'Equal to threshold'; RefreshTokenDate = $DateDeleteCheck }
    [pscustomobject]@{ User = 'After threshold'; RefreshTokenDate = $DateDeleteCheck.AddDays(1) }
    [pscustomobject]@{ User = 'Empty / null'; RefreshTokenDate = $null }
)

New-HTML {
    New-HTMLSection -HeaderText 'HTML DataStore (dd/MM/yyyy)' {
        New-HTMLTableOption -DataStore HTML -DateTimeFormat 'dd/MM/yyyy HH:mm:ss'
        New-HTMLTable -DataTable $AdminsDisabled -HideFooter -DisablePaging -DateTimeSortingFormat 'DD/MM/YYYY HH:mm:ss' {
            New-HTMLTableHeader -Title 'HTML: Highlight RefreshTokenDate < threshold'
            New-HTMLTableCondition -Name 'RefreshTokenDate' -ComparisonType 'date' -Operator lt -Value $DateDeleteCheck -BackgroundColor Red -Color Black -FailBackgroundColor LightGreen -FailColor Black -DateTimeFormat 'dd/MM/YYYY HH:mm:ss'
        }
    }

    New-HTMLSection -HeaderText 'JavaScript DataStore (dd/MM/yyyy)' {
        New-HTMLTableOption -DataStore JavaScript -DateTimeFormat 'dd/MM/yyyy HH:mm:ss'
        New-HTMLTable -DataTable $AdminsDisabled -HideFooter -DisablePaging -DateTimeSortingFormat 'DD/MM/YYYY HH:mm:ss' {
            New-HTMLTableHeader -Title 'JavaScript: Highlight RefreshTokenDate < threshold'
            New-HTMLTableCondition -Name 'RefreshTokenDate' -ComparisonType 'date' -Operator lt -Value $DateDeleteCheck -BackgroundColor Red -Color Black -FailBackgroundColor LightGreen -FailColor Black -DateTimeFormat 'dd/MM/YYYY HH:mm:ss'
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-TableDateTimeConditionsFormats.html -Online
