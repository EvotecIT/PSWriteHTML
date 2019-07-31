Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Title' -UseCssLinks -UseJavaScriptLinks -FilePath $PSScriptRoot\Example25.html {
    New-HTMLContent -HeaderText '0 section' {
        New-HTMLPanel {
            New-HTMLMessage -TextHeader 'Maintenance' -Text "We've planned maintenance on 24th of January 2020. It will last 30 hours." -IconRegular address-card
            New-HTMLMessage -TextHeader 'Maintenance' -Text "We've planned maintenance on 24th of January 2020. It will last 30 hours." -IconColor DarkGrey -BarColor ForestGreen -TextColor Gainsboro -IconBrands 500px
            New-HTMLMessage -TextHeader 'Maintenance' -Text "We've planned maintenance on 24th of January 2020. It will last 30 hours." -IconColor AliceBlue -BarColor Grey -TextHeaderColor Gold -IconRegular eye
        }
    }
} -ShowHTML