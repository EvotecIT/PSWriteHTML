Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -Online -FilePath $PSScriptRoot\Example-QR02.html {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLQRCode -Link 'https://evotec.xyz'
        }
        New-HTMLPanel {
            New-HTMLQRCode -Link 'https://evotec.xyz'
        }
    }
    # Unfortunetly this table when defined outside of New-HTML won't work, not yet - would need to think on new solution
    $Table = @(
        [PSCustomObject] @{
            ComputerName = 'EvoWin'
            QRCode       = New-HTMLQRCode -Link 'https://evotec.xyz/EvoWin' -Height 50 -Width 50 -Title 'Evotec' -TitleColor Red
        }
        [PSCustomObject] @{
            ComputerName = 'EvoMac'
            QRCode       = New-HTMLQRCode -Link 'https://evotec.xyz/EvoMac' -Height 50 -Width 50
        }
    )
    New-HTMLTable -DataTable $Table -Filtering -InvokeHTMLTags
} -ShowHTML