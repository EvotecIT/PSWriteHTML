Import-Module .\PSWriteHTML.psd1 -Force

$htmlDot = @(
    [PSCustomObject] @{
        Item  = 'Pass threshold'
        Value = '0.17'
    }
    [PSCustomObject] @{
        Item  = 'Fail threshold'
        Value = '0.25'
    }
    [PSCustomObject] @{
        Item  = 'Exact threshold'
        Value = '0.20'
    }
    [PSCustomObject] @{
        Item  = 'Negative value'
        Value = '-0.05'
    }
)

$htmlComma = @(
    [PSCustomObject] @{
        Item  = 'Pass threshold'
        Value = '0,17'
    }
    [PSCustomObject] @{
        Item  = 'Fail threshold'
        Value = '0,25'
    }
    [PSCustomObject] @{
        Item  = 'Exact threshold'
        Value = '0,20'
    }
    [PSCustomObject] @{
        Item  = 'Negative value'
        Value = '-0,05'
    }
)

$jsDot = @(
    [PSCustomObject] @{
        Item  = 'Pass threshold'
        Value = 0.17
    }
    [PSCustomObject] @{
        Item  = 'Fail threshold'
        Value = 0.25
    }
    [PSCustomObject] @{
        Item  = 'Exact threshold'
        Value = 0.20
    }
    [PSCustomObject] @{
        Item  = 'Negative value'
        Value = -0.05
    }
)

$jsComma = @(
    [PSCustomObject] @{
        Item  = 'Pass threshold'
        Value = '0,17'
    }
    [PSCustomObject] @{
        Item  = 'Fail threshold'
        Value = '0,25'
    }
    [PSCustomObject] @{
        Item  = 'Exact threshold'
        Value = '0,20'
    }
    [PSCustomObject] @{
        Item  = 'Negative value'
        Value = '-0,05'
    }
)

$exampleCode = @'
New-TableCondition -Name "Value" -ComparisonType number -Operator le -Value 0.2 -Color SeaGreen -FailColor FireBrick
New-TableCondition -Name "Value" -ComparisonType number -Operator le -Value '0,2' -Color SeaGreen -FailColor FireBrick

# Avoid bare -Value 0,2 in PowerShell.
# PowerShell parses it as an Object[] containing 0 and 2.
'@

New-HTML -TitleText 'PSWriteHTML decimal number conditions' -Online -FilePath "$PSScriptRoot\Example-LocaleDecimals.html" {
    New-HTMLSection -HeaderText 'Locale decimal conditions' {
        New-HTMLText -TextBlock {
            'This example proves the same decimal comparison works for HTML-backed tables and JavaScript-backed tables.'
            'Use -Value 0.2 for a numeric literal, or quote locale-formatted text with -Value ''0,2''.'
            'Do not use bare -Value 0,2 in PowerShell because it becomes an Object[] before PSWriteHTML sees it.'
        }
        New-HTMLCodeBlock -Code $exampleCode -Style 'PowerShell' -Theme enlighter
    }

    New-HTMLSection -HeaderText 'HTML store with dot decimals' {
        New-HTMLTable -DataTable $htmlDot -Buttons copyHtml5, excelHtml5, csvHtml5, pdfHtml5 -PagingLength 5 {
            New-TableCondition -Name 'Value' -ComparisonType number -Operator le -Value 0.2 -Color SeaGreen -FailColor FireBrick
        }
    }

    New-HTMLSection -HeaderText 'HTML store with comma decimals' {
        New-HTMLTable -DataTable $htmlComma -Buttons copyHtml5, excelHtml5, csvHtml5, pdfHtml5 -PagingLength 5 {
            New-TableCondition -Name 'Value' -ComparisonType number -Operator le -Value '0,2' -Color SeaGreen -FailColor FireBrick
        }
    }

    New-HTMLSection -HeaderText 'JavaScript store with numeric values' {
        New-HTMLTable -DataTable $jsDot -Buttons copyHtml5, excelHtml5, csvHtml5, pdfHtml5 -PagingLength 5 {
            New-TableCondition -Name 'Value' -ComparisonType number -Operator le -Value 0.2 -Color SeaGreen -FailColor FireBrick
        } -DataStore JavaScript
    }

    New-HTMLSection -HeaderText 'JavaScript store with comma-formatted strings' {
        New-HTMLTable -DataTable $jsComma -Buttons copyHtml5, excelHtml5, csvHtml5, pdfHtml5 -PagingLength 5 {
            New-TableCondition -Name 'Value' -ComparisonType number -Operator le -Value '0,2' -Color SeaGreen -FailColor FireBrick
        } -DataStore JavaScript
    }
}
