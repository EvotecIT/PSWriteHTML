Describe 'New-HTML / Save-HTML' {
    It 'Given New-HTML it should create HTML file' {
        $FilePath = "$PSScriptRoot\TemporaryTest.html"
        New-HTML {

        } -FilePath $FilePath
        $PathExists = Test-Path -LiteralPath $FilePath
        $PathExists | Should -Be $True
        if ($PathExists) {
            Remove-Item -LiteralPath $FilePath
        }
    }
    It 'Given New-HTML with wrong path it should create HTML file in temporary location' {
        # This path is by default wrong. We want it to fail.
        $FilePath = "Z:\Windows"
        New-HTML {

        } -FilePath $FilePath -WarningVariable Warnings -WarningAction SilentlyContinue
        $PathExists = Test-Path -LiteralPath $FilePath
        $PathExists | Should -Be $false
        if ($PathExists) {
            Remove-Item -LiteralPath $FilePath
        }
        #Regex pattern to extract Path from Warning
        $firstString = "Saving HTML to file "
        $secondString = "$"
        $pattern = "$firstString(.*?)$secondString"
        $result = [regex]::Match($Warnings[1], $pattern).Groups[1].Value
        #Write-host $result
        $PathExists = ($result -and (Test-Path -LiteralPath $result))
        $PathExists | Should -Be $True
        if ($PathExists) {
            Remove-Item -LiteralPath $result
        }
    }
}