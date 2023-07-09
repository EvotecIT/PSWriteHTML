Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLMap -Map poland
        }
        New-HTMLPanel {
            New-HTMLMap -Map usa_states
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLMap -Map world_countries
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLMap -Map European_Union
        }
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example-Maps.html