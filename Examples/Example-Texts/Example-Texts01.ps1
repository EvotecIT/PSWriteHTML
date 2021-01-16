Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-Texts01.html -Show {
    New-HTMLText -Text '[Link1](https://evotec.xyz) - Text Without Link 1 - [Link2](https://evotec.xyz) - Text Without Link 2 -', ' [Link2](https://evotec.xyz) SomeText'
    New-HTMLText -TextBlock {
        "[test](https://evotec.xyz) oh no [test](https://evotec.xyz) oh no"
        '[test](https://evotec.xyz) oh no'
        '[test](https://evotec.xyz) oh no [TextNotLink] and (LinkButNoText)'
    }
    New-HTMLList {
        New-HTMLListItem -Text '[Link1](https://evotec.xyz) - Text Without Link 1 - [Link2](https://evotec.xyz) - Text Without Link 2 -', ' [Link2](https://evotec.xyz) SomeText'
        New-HTMLListItem -Text '[Link1](https://evotec.xyz) - Text Without Link 1 - [Link2](https://evotec.xyz) - Text Without Link 2'
        New-HTMLListItem -Text '[Link2](https://evotec.xyz) SomeText'
        New-HTMLListItem -Text '[Link2](https://evotec.xyz) SomeText (TestingText in brackets) and more [more test in brackets] (and more)'
    }
}