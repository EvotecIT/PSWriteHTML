Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My diagram' -Online:$true -FilePath $PSScriptRoot\Example-FontsAwesome.html {
    New-HTMLDiagram {
        New-DiagramNode -Label 'IconBrands example' -IconBrands accessible-icon
        New-DiagramNode -Label 'IconRegular example' -IconRegular address-card
        New-DiagramNode -Label 'IconSolid example' -IconSolid air-freshener
    } -DisableLoader
} -ShowHTML