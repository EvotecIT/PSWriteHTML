Import-Module PSWriteHTML -Force

if ($null -eq $Table) {
    $Table = (Get-Process | Select-Object -First 5 -Property Name, BasePriority, Company, CompanyName)
}
if ($null -eq $Table1) {
    $Table1 = (Get-ChildItem | Select-Object -First 5 -Property Name, BasePriority, Company, CompanyName)
}

Email -AttachSelf -AttachSelfName 'My report' {
    EmailHeader {
        EmailFrom -Address 'reminder@domain.pl'
        EmailTo -Addresses "przemyslaw.klys@domain.pl"
        EmailCC -Addresses "przemyslaw.klys@domain.pl"
        EmailBCC -Addresses "kontakt@domain.pl"
        EmailServer -Server 'mail.domain.pl' -UserName 'UserName' -Password 'C:\Support\Important\Password-Evotec-Reminder.txt' -PasswordAsSecure -PasswordFromFile
        EmailOptions -Priority Low
        EmailSubject -Subject 'This is a test email'
    }
    EmailBody -FontSize 8px -FontFamily 'Tahoma' {
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
        EmailTable -Table $Table
        EmailTextBox -FontSize 15 -Color DarkCyan -FontStyle italic {
            ""
            @"
                This is tricky 😁 but it works like one
                big line... even thou we've split this over few lines
                already this will be one continues line. Get it right?
                Notice how I gave it color and made it font size 15.
"@
            ""
        }
        EmailList -FontSize 15 {
            EmailListItem -Text 'First item' -Color Red
            EmailListItem -Text '2nd item' -Color Green
            EmailList {
                EmailListItem -Text '3rd item' -FontStyle italic
                EmailListItem -Text '4th item' -TextDecoration line-through
            }
        }

        EmailTable -Table $Table1
        EmailText -LineBreak
        EmailText -FontSize 15 -Text 'This is my', 'text' -Color Red, Green -TextDecoration underline -FontFamily 'Calibri'
        EmailText -LineBreak
        EmailText -FontSize 15 -Text 'This is my', 'text', ' but ', ' with different formatting.' -Color Blue, Red, Green -TextDecoration underline, none, 'line-through' -FontFamily 'Calibri'

        EmailText -LineBreak
    }
} -FilePath "$PSScriptRoot\Output\Example-DifferentFeaturesInAction.html" -WhatIf -Online