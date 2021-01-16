Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    $Table2 = New-HTMLTable -DataTable (Get-Process | Select-Object -First 1)
    $DataTable3 = @(
        [PSCustomObject] @{
            SomeObject = 'Test2'
            New        = 'Test'
            Table      = [string] $Table2
        }
    )
    New-HTMLTable -DataTable $DataTable3 -InvokeHTMLTags
} -ShowHTML -Online -FilePath $PSScriptRoot\Example7_12.html