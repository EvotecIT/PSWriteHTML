Import-Module .\PSWriteHTML.psd1 -Force

if ($null -eq $Table) {
    $Table = (Get-Process | Select-Object -First 5 -Property Name, BasePriority, Company, CompanyName)
}
if ($null -eq $Table1) {
    $Table1 = (Get-ChildItem | Select-Object -First 5 -Property Name, BasePriority, Company, CompanyName)
}

$Output = EmailBody -FontSize 8px -FontFamily 'Tahoma' {
    EmailText -Text 'This should be font 8pt, table should also be font 8pt'
    EmailTable -Table $Table
    EmailText -LineBreak

    EmailTextBox -FontFamily 'Calibri' -Size 17 -TextDecoration underline -Color DarkSalmon -Alignment center {
        'Demonstration'
    }
    EmailText -LineBreak
    EmailTextBox -FontFamily 'Calibri' -Size 15 {
        "This is some text that's preformatted with Emoji 🤷 ‍️"
        "Adding more text, notice ths should be on next line"
        ""
        "Empty line above will cause a blank space. If you want to continue writting like you would do in normal email please use here strings as seen below."
        @"
                This is tricky but it works like one ❤
                big line... even thou we've split this over few lines
                already this will be one continues line. Get it right? 😎
"@
        ""
    }
    # This acts a bit differently
    EmailText -FontFamily 'Calibri' -Size 15 {
        "This is some text that's preformatted with Emoji 🤷 ‍️"
        "Adding more text, notice ths should be on next line"
        ""
        "Empty line above will cause a blank space. If you want to continue writting like you would do in normal email please use here strings as seen below."
        @"
                This is tricky but it works like one ❤
                big line... even thou we've split this over few lines
                already this will be one continues line. Get it right? 😎
"@
        ""
    } -LineHeight 1.5
    # Another way to do it
    EmailText -FontFamily 'Calibri' -Size 15 -Text @(
        "This is some text that's preformatted with Emoji 🤷 ‍️"
        "Adding more text, notice ths should be on next line"
        ""
        "Empty line above will cause a blank space. If you want to continue writting like you would do in normal email please use here strings as seen below."
        @"
                This is tricky but it works like one ❤
                big line... even thou we've split this over few lines
                already this will be one continues line. Get it right? 😎
"@
        ""
    ) -LineHeight 1.0

    EmailText -FontFamily 'Calibri' -Size 15 -Text @(
        "This is some text that's preformatted with Emoji 🤷 ‍️"
        "Adding more text, notice ths should be on next line"
        ""
        "Empty line above will cause a blank space. If you want to continue writting like you would do in normal email please use here strings as seen below."
        @"
                This is tricky but it works like one ❤
                big line... even thou we've split this over few lines
                already this will be one continues line. Get it right? 😎
"@
        ""
    ) -LineHeight 1.0, 2.5, 2.0, 0.5

    New-HTMLHeading -Heading h3 -HeadingText 'Another way' -Color Red

    EmailText -FontFamily 'Calibri' -Size 15 -Text "This is some text that's preformatted with Emoji 🤷 ‍️" -LineHeight 0.5
    EmailText -FontFamily 'Calibri' -Size 15 -Text "Adding more text, notice ths should be on next line" -LineHeight 0.5
    EmailText -FontFamily 'Calibri' -Size 15 -Text "" -LineHeight 1.0
    EmailText -FontFamily 'Calibri' -Size 15 -Text "Empty line above will cause a blank space. If you want to continue writting like you would do in normal email please use here strings as seen below." -LineHeight 1.75
    EmailText -FontFamily 'Calibri' -Size 15 -Text '' -LineHeight 0.5
    EmailText -FontFamily 'Calibri' -Size 15 -Text "    This is tricky but it works like one ❤" -LineHeight 0.5
    EmailText -FontFamily 'Calibri' -Size 15 -Text "      big line... even thou we've split this over few lines" -LineHeight 0.5
    EmailText -FontFamily 'Calibri' -Size 15 -Text "      already this will be one continues line. Get it right? 😎" -LineHeight 0.5

} -Online



#Save-HTML -FilePath $PSScriptRoot\Output\TestBody.html -ShowHTML -HTML $Output