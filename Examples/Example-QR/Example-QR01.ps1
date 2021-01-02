Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -Online -FilePath $PSScriptRoot\Example-QR01.html {
    New-HTMLQRCode -Link 'https://evotec.xyz'
} -ShowHTML