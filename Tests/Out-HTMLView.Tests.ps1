Describe 'Out-HTMLView' {
    It 'Given Out-HTMLView (Standard Object Array) we should get same nr of rows and properties per each row' {
        $FilePath = "$PSScriptRoot\TemporaryTest.html"
        $Process = Get-Process | Select-Object -First 5
        Out-HtmlView -DataTable $Process -HideFooter -FilePath $FilePath -PreventShowHTML
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
    It 'Given Out-HTMLView (HashTable Array) we should get same nr of rows and properties per each row' {
        $FilePath = "$PSScriptRoot\TemporaryTest.html"
        $Process = @(
            @{
                Test  = 'Test3'
                TEst2 = 'TEst4'
            }
            @{
                Test  = 'Test1'
                TEst2 = 'TEst2'
            }
        )
        Out-HtmlView -DataTable $Process -HideFooter -FilePath $FilePath -PreventShowHTML
        $Content = Get-Content -Path $FilePath -Raw
        $TableOutput = ConvertFrom-HtmlTable -Content $Content
        for ($i = 0; $i -lt $TableOutput.Count; $i++) {
            $Properties = $TableOutput[$i].PSObject.Properties.Name
            $Properties | Should -BeExactly Name, Value
            $Properties.Count | Should -Be 2
        }
        $TableOutput[0].Name | Should -Be 'Test'
        $TableOutput[1].Name | Should -Be 'Test2'
        $TableOutput[2].Name | Should -Be 'Test'
        $TableOutput[3].Name | Should -Be 'Test2'
        $TableOutput[0].Value | Should -Be 'Test3'
        $TableOutput[1].Value | Should -Be 'TEst4'
        $TableOutput[2].Value | Should -Be 'Test1'
        $TableOutput[3].Value | Should -Be 'TEst2'
        if (Test-Path $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }
    }
    It 'Given Out-HTMLView (OrderedDictionary Array) we should get same nr of rows and properties per each row' {
        $FilePath = "$PSScriptRoot\TemporaryTest.html"
        $Process = @(
            [ordered] @{
                Test  = 'Test3'
                TEst2 = 'TEst4'
            }
            [ordered] @{
                Test  = 'Test1'
                TEst2 = 'TEst2'
            }
        )
        Out-HtmlView -DataTable $Process -HideFooter -FilePath $FilePath -PreventShowHTML
        $Content = Get-Content -Path $FilePath -Raw
        $TableOutput = ConvertFrom-HtmlTable -Content $Content
        for ($i = 0; $i -lt $TableOutput.Count; $i++) {
            $Properties = $TableOutput[$i].PSObject.Properties.Name
            $Properties | Should -BeExactly Name, Value
            $Properties.Count | Should -Be 2
        }
        $TableOutput[0].Name | Should -Be 'Test'
        $TableOutput[1].Name | Should -Be 'Test2'
        $TableOutput[2].Name | Should -Be 'Test'
        $TableOutput[3].Name | Should -Be 'Test2'
        $TableOutput[0].Value | Should -Be 'Test3'
        $TableOutput[1].Value | Should -Be 'TEst4'
        $TableOutput[2].Value | Should -Be 'Test1'
        $TableOutput[3].Value | Should -Be 'TEst2'
        if (Test-Path $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }
    }
}