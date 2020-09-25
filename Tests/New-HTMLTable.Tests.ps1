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
        New-HTML {
            New-HTMLTable -DataTable $Process -HideFooter
        } -FilePath $FilePath
        $Content = Get-Content -Path $FilePath -Raw
        $TableOutput = ConvertFrom-HtmlTable -Content $Content
        for ($i = 0; $i -lt $TableOutput.Count; $i++) {
            $Properties = $TableOutput[$i].PSObject.Properties.Name
            $Properties | Should -BeExactly Name, Value
            $Properties.Count | Should -Be 2
        }
        # Since we can't guarantee hashtable order we need to ignore order
        $GroupedNames = $TableOutput.Name | Group-Object
        $GroupedValues = $TableOutput.Value | Group-Object

        $GroupedNames.Count | Should -be 2
        $GroupedValues.Count | Should -be 4

        $TableOutput[3].Name | Should -BeIn 'Test', 'Test2'
        $TableOutput[3].Value | Should -BeIn 'Test3', 'Test4', 'Test1', 'Test2'
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
        New-HTML {
            New-HTMLTable -DataTable $Process -HideFooter
        } -FilePath $FilePath
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
    It 'Given Out-HTMLView (OrderedDictionary) we should get same nr of rows and properties per each row' {
        $FilePath = "$PSScriptRoot\TemporaryTest.html"
        $Process = [ordered] @{
            Test  = 'Test3'
            TEst2 = 'TEst4'
        }
        New-HTML {
            New-HTMLTable -DataTable $Process -HideFooter
        } -FilePath $FilePath
        $Content = Get-Content -Path $FilePath -Raw
        $TableOutput = ConvertFrom-HtmlTable -Content $Content
        for ($i = 0; $i -lt $TableOutput.Count; $i++) {
            $Properties = $TableOutput[$i].PSObject.Properties.Name
            $Properties | Should -BeExactly Name, Value
            $Properties.Count | Should -Be 2
        }
        $TableOutput[0].Name | Should -Be 'Test'
        $TableOutput[1].Name | Should -Be 'Test2'
        $TableOutput[0].Value | Should -Be 'Test3'
        $TableOutput[1].Value | Should -Be 'TEst4'
        if (Test-Path $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }
    }
    It 'Given Out-HTMLView (PSCustomObject) we should get same nr of rows and properties per each row' {
        $FilePath = "$PSScriptRoot\TemporaryTest.html"
        $Process = [PSCustomObject] @{
            Test1 = 'Value1'
            TEst2 = 'Value2'
            Test3 = 'Value3'
        }
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
        $TableOutput[0].Test1 | Should -Be 'Value1'
        $TableOutput[0].Test2 | Should -Be 'Value2'
        $TableOutput[0].Test3 | Should -Be 'Value3'
        $TableOutput[1].Test3 | Should -Be $null
        if (Test-Path $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }
    }
    It 'Given New-HTMLTable with Null values it shouldnt throw' {
        $FilePath = "$PSScriptRoot\TemporaryTest.html"
        $Output = for($i = 0;$i -le 10; $i++) {
            $null
        }
        New-HTML {
            New-HTMLTable -DataTable $Output -HideFooter
        } -FilePath $FilePath

        if (Test-Path $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }
    }
}