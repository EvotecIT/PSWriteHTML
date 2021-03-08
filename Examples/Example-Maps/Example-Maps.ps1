Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection -Invisible {
        #New-HTMLPanel {
        #    New-HTMLMap -Map poland
       # }
        New-HTMLPanel {
            New-HTMLMap -Map world_countries
        }
    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example-Maps.html