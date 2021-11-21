Import-Module .\PSWriteHTML.psd1 -Force

if ($null -eq $Table) {
    $Table = (Get-Process | Select-Object -First 2 -Property Name, BasePriority, Company, CompanyName)
}

$Output = EmailBody -FontSize 12px -FontFamily 'Tahoma' {
    EmailLayout {
        EmailLayoutRow {
            EmailLayoutColumn -Width 600 {
                EmailImage -Source https://picsum.photos/600/100?image=14 -Width 600
            }
        }
        EmailLayoutRow {
            EmailLayoutColumn -Width 300 {
                EmailText -Text 'This should be font 8pt, table should also be font 8pt'
            }
            EmailLayoutColumn -Width 300 {
                EmailText -Text 'This should be font 8pt, table should also be font 8pt'
            }
        }
        EmailLayoutRow {
            EmailLayoutColumn -Width 300 {
                New-HTMLText -Text "Test " -Size 15pt

                New-HTMLTable -DataTable $Table -HideFooter
            }
            EmailLayoutColumn -Width 300 {
                New-HTMLText -Text "Test " -Size 15pt
            }
        }
        EmailLayoutRow {
            EmailLayoutColumn -Width 300 {
                EmailImage -Source https://picsum.photos/300/100?image=15 -AlternativeText 'picsumarry1' -Width 300
            }
            EmailLayoutColumn -Width 300 {
                EmailImage -Source https://picsum.photos/300/100?image=10 -AlternativeText 'picsumarry2' -Width 300
            }
        }
        EmailLayoutRow {
            EmailLayoutColumn -Width 50% {

            }
            EmailLayoutColumn -Width 50% {
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
            }
        }
        EmailLayoutRow {
            EmailLayoutColumn -Alignment center {
                EmailText -FontFamily 'Calibri' -Size 15 -Text "This is some text that's preformatted with Emoji 🤷 ‍️" -LineHeight 0.5
                EmailText -FontFamily 'Calibri' -Size 15 -Text "Adding more text, notice ths should be on next line" -LineHeight 0.5
                EmailText -FontFamily 'Calibri' -Size 15 -Text "" -LineHeight 1.0
                EmailText -FontFamily 'Calibri' -Size 15 -Text "E line... even thou we've split this over few lines" -LineHeight 0.5
                EmailText -FontFamily 'Calibri' -Size 15 -Text "      already this will be one continues line. Get it right? 😎" -LineHeight 0.5
            }
        }
    }
} -Online
Save-HTML -FilePath $PSScriptRoot\Output\TestBody1.html -ShowHTML -HTML $Output