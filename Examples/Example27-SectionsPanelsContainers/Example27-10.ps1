Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force
New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example27-10.html -Show {
    New-HTMLSection -HeaderText 'Default Section Style' {
        New-HTMLText -Color Red -Text 'test1' -Alignment center
    }
    New-HTMLSection {
        New-HTMLText -Color Red -Text 'test2' -Alignment center
    }
}
