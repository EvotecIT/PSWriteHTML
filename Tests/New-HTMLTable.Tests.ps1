Describe 'New-HTMLTable' {
    It 'Given New-HTMLTable we should get same nr of rows and properties per each row' {
        $FilePath = "$PSScriptRoot\TemporaryTest.html"
        $Process = Get-Process | Select-Object -First 5
        New-HTML {
            New-HTMLTable -DataTable $Process -HideFooter
        } -FilePath $FilePath
        $Content = Get-Content -Path $FilePath -Raw
        $TableOutput = ConvertFrom-HtmlTable -Content $Content
        for ($i = 0; $i -lt $TableOutput.Count; $i++) {
            $Properties = $Process[$i].PSObject.Properties.Name
            $PropertiesTable = $TableOutput[$i].PSObject.Properties.Name
            $Properties.Count -eq $PropertiesTable.Count | Should -Be $true
        }
        if (Test-Path $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }
    }
}