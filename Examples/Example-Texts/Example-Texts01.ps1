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
    New-HTMLText -Text @(
        "This is a string with [SomeURL](https://evotec.xyz) and this isn't. "
        "This is more complicated [URL](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn535495(v=ws.11)) with double () and it doesn't work properly "
        "More URLs in one line  [SomeURL](https://evotec.xyz) and and [SomeURL](https://evotec.xyz)."
    )
    # This doesn't work properly
    New-HTMLText -Text @(
        "This is a string with [SomeURL](https://evotec.xyz) and this isn't. "
        "This is more complicated [URL](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn535495(v=ws.11)) with double () and it doesn't work properly "
        "More URLs in one line  [SomeURL](https://evotec.xyz) and and [SomeURL](https://evotec.xyz)."
    )

    New-HTMLText -Text @(
        'This is some text with HTML inside <a href="http://example.com/" target="_blank">Hello, world!</a>'
    )
    New-HTMLList {
        New-HTMLListItem -Text '[Link2](https://evotec.xyz) SomeText (TestingText in brackets) and more [more test in brackets] (and more)'
        New-HTMLListItem -Text 'Using standard link <a href="http://example.com/" target="_blank">Hello, world!</a>'
    }

    New-HTMLList {
        New-HTMLListItem -Text '[Link2](https://evotec.xyz) SomeText (TestingText in brackets) and more [more test in brackets] (and more)'
        New-HTMLListItem -Text 'Using standard link ', (New-HTMLLink -Text 'Hello World' -Target "_blank" -HrefLink 'https://evotec.xyz')
    }
}