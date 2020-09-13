Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -Title 'Shows how to control diagram height' {
    New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor Grey -RemoveShadow
    New-HTMLSection -Title 'Shows how to fill whole screen with diagram' {
        New-HTMLDiagram -Height 'calc(100vh - 50px)' {
            New-DiagramNode -Label 'Test' -To 'test2' -Shape box -FontColor Red

            $Label = @"
This is Test
This is more test
Ooops
"@
            New-DiagramNode -Id 'test2' -Label $Label -FontMulti html -Shape box -FontAlign left
        }
    }
    #New-HTMLTable -DataTable (Get-Process | Select-Object -First 2)
} -FilePath $PSScriptRoot\Example-BasicWithHeight.html -Online -ShowHTML


