Import-Module .\PSWriteHTML.psd1 -Force
Import-Module PSWriteHTML.Maps -Force

New-HTML {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLMap -Map poland
        }
        New-HTMLPanel {
            New-HTMLMap -Map usa_states
        }
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example-Maps.html