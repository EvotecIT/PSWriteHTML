Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -Title 'Shows how to control diagram height' {
    New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor Grey -RemoveShadow
    New-HTMLSection -Title 'Shows how to fill whole screen with diagram' {
        New-HTMLDiagram -Height 'calc(100vh - 50px)' {
            New-DiagramNode -Label 'Test'
            New-DiagramNode -Label 'test2'
        }
    }
    New-HTMLTable -DataTable (Get-Process | Select-Object -First 2)
} -FilePath $PSScriptRoot\Example-BasicWithHeight.html -Online -ShowHTML