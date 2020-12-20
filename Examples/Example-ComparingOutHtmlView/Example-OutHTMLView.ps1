Import-Module .\PSWriteHTML.psd1 -Force

$Objects2 = @(
    Get-ADComputer -SearchBase 'OU=Domain Controllers,DC=ad,DC=evotec,DC=xyz' -Filter * -Properties *
)
$Objects2 | Out-HtmlView -Compare -HighlightDifferences  {
    New-HTMLTableCondition -Name 'Name' -Value 'AllowReversiblePasswordEncryption' -BackgroundColor Gold -Row
    New-HTMLTableCondition -Name 'Status' -ComparisonType string -Operator eq -Value $false -BackgroundColor Red -Color White
    New-HTMLTableCondition -Name 'Status' -ComparisonType string -Operator eq -Value $true -BackgroundColor Green -Color White
}
