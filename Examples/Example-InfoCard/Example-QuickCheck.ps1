Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection -HeaderText "Application Overview" {
        New-HTMLSection -Invisible {
            New-HTMLPanel { New-HTMLText -Text "Total Applications" -FontSize 14pt -Color '#666666'; New-HTMLText -Text 55 -FontSize 24pt -Color '#0078d4' }
            New-HTMLPanel { New-HTMLText -Text "App Registrations" -FontSize 14pt -Color '#666666'; New-HTMLText -Text 63 -FontSize 24pt -Color '#0078d4' }
            New-HTMLPanel { New-HTMLText -Text "Enterprise Apps" -FontSize 14pt -Color '#666666'; New-HTMLText -Text 45454 -FontSize 24pt -Color '#0078d4' }
            New-HTMLPanel { New-HTMLText -Text "Microsoft Apps" -FontSize 14pt -Color '#666666'; New-HTMLText -Text 123 -FontSize 24pt -Color '#0078d4' }
        }
        New-HTMLSection -Invisible {
            New-HTMLPanel { New-HTMLText -Text "Managed Identities" -FontSize 14pt -Color '#666666'; New-HTMLText -Text 13 -FontSize 24pt -Color '#0078d4' }
            New-HTMLPanel { New-HTMLText -Text "Apps w/ Delegated Permissions" -FontSize 14pt -Color '#666666'; New-HTMLText -Text 19 -FontSize 24pt -Color '#0078d4' }
            New-HTMLPanel { New-HTMLText -Text "Apps w/ Application Permissions" -FontSize 14pt -Color '#666666'; New-HTMLText -Text 500 -FontSize 24pt -Color '#0078d4' }
            New-HTMLPanel { New-HTMLText -Text "Apps with No Sign-In Activity" -FontSize 14pt -Color '#666666'; New-HTMLText -Text 2300 -FontSize 24pt -Color '#d13438' }
        }
    }
} -FilePath "$PSScriptRoot\Example-QuickCheck1.html" -Online -Show