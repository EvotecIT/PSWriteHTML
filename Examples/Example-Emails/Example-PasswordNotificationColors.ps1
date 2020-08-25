Import-Module PSWriteHTML -Force

$UserNotify = 'Przemysław Kłys'
$PasswordExpiryDays = 5

Email -WhatIf {
    EmailHeader {
        EmailFrom -Address 'reminder@domain.pl'
        EmailTo -Addresses "przemyslaw.klys@domain.pl"
        EmailServer -Server 'mail.evotec.com' -Username 'UserName' -Password 'C:\Support\Important\Password-Evotec-Reminder.txt' -PasswordAsSecure -PasswordFromFile
        EmailOptions -Priority High -DeliveryNotifications Never
        EmailSubject -Subject 'This is a test email'
    }
    EmailBody -FontFamily 'Calibri' -Size 15 {
        EmailText -Text "Hello ", $UserNotify, "," -Color None, Blue, None -Verbose -LineBreak
        EmailText -Text "Your password is due to expire in ", $PasswordExpiryDays, "days." -Color None, Green, None
        EmailText -LineBreak
        EmailText -Text 'To change your password: '
        EmailText -Text '- press ', 'CTRL+ALT+DEL', ' -> ', 'Change a password...' -Color None, BlueViolet, None, Red
        EmailText -LineBreak
        EmailTextBox {
            'If you have forgotten your password and need to reset it, you can do this by clicking here. '
            "In case of problems please contact the HelpDesk by visiting [Evotec Website](https://evotec.xyz) or by sending an email to Help Desk."
        }
        EmailText -LineBreak
        EmailText -Text 'Alternatively you can always call ', 'Help Desk', ' at ', '+48 22 00 00 00' `
            -Color None, LightSkyBlue, None, LightSkyBlue -TextDecoration none, underline, none, underline -FontWeight normal, bold, normal, bold
        EmailText -LineBreak
        EmailTextBox {
            'Kind regards,'
            'Evotec IT'
        }
    }
}