Import-Module "$PSScriptRoot\..\PSWriteHTML.psd1" -Force

Describe 'New-TableCondition' {
    It 'Serializes dot and quoted comma thresholds into columnHighlighter rules' {
        $FilePath = "$PSScriptRoot\TemporaryCondition.html"
        $htmlStore = @(
            [PSCustomObject] @{
                Item  = 'Pass threshold'
                Value = '0,17'
            }
        )
        $jsStore = @(
            [PSCustomObject] @{
                Item  = 'Pass threshold'
                Value = 0.17
            }
        )

        New-HTML {
            New-HTMLTable -DataTable $htmlStore -HideFooter {
                New-TableCondition -Name 'Value' -ComparisonType number -Operator le -Value '0,2' -Color SeaGreen -FailColor FireBrick
            }
            New-HTMLTable -DataTable $jsStore -HideFooter {
                New-TableCondition -Name 'Value' -ComparisonType number -Operator le -Value 0.2 -Color SeaGreen -FailColor FireBrick
            } -DataStore JavaScript
        } -FilePath $FilePath -Online

        $Content = Get-Content -Path $FilePath -Raw
        $Content | Should -Match '"columnHighlighter"'
        $Content | Should -Match '"value": "0,2"'
        $Content | Should -Match '"value": 0.2'

        if (Test-Path $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }
    }

    It 'Receives bare comma decimals as an array because of PowerShell parsing' {
        $FilePath = "$PSScriptRoot\TemporaryConditionArray.html"
        $bareCommaValue = 0,2

        New-HTML {
            $script:conditionWithBareComma = New-TableCondition -Name 'Value' -ComparisonType number -Operator le -Value $bareCommaValue
        } -FilePath $FilePath

        $bareCommaValue.GetType().FullName | Should -Be 'System.Object[]'
        $bareCommaValue.Count | Should -Be 2
        $bareCommaValue[0] | Should -Be 0
        $bareCommaValue[1] | Should -Be 2
        $script:conditionWithBareComma.Output.Value.GetType().FullName | Should -Be 'System.Object[]'
        $script:conditionWithBareComma.Output.Value.Count | Should -Be 2
        $script:conditionWithBareComma.Output.Value[0] | Should -Be 0
        $script:conditionWithBareComma.Output.Value[1] | Should -Be 2

        if (Test-Path $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }
    }
}
