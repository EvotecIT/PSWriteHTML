Import-Module .\PSWriteHTML.psd1 -Force


New-HTML {
    New-HTMLText -Text @(
        "This is a string with [SomeURL](https://evotec.xyz) and this isn't. "
        "This is more complicated [URL](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn535495(v=ws.11)) with double () and it doesn't work properly "
        "More URLs in one line  [SomeURL](https://evotec.xyz) and and [SomeURL](https://evotec.xyz)."
    )
    New-HTMLText -Text @(
        "[Attacking Read-Only Domain Controllers (RODCs) to Own Active Directory](https://adsecurity.org/?p=3592)"
    )
} -ShowHTML