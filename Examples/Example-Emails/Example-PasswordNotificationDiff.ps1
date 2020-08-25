Import-Module .\PSWriteHTML.psd1 -Force

### Prepare your data:

$UserNotify = 'Przemysław Kłys'
$PasswordExpiryDays = 5

Email -WhatIf -To 'przemyslaw.klys@domain.pl' -Server 'mail.domain.com' -From 'reminder@domain.pl' -Subject 'Tis is a test email' -Username 'UserName' -Password 'C:\Support\Important\Password-Evotec-Reminder.txt' -PasswordAsSecure -PasswordFromFile -Priority High -DeliveryNotifications Never {
    EmailBody -FontFamily 'Calibri' -Size 15 {
        EmailTextBox {
            "Hello $UserNotify,"
            ""
            "Your password is due to expire in $PasswordExpiryDays days."
            ""
            'To change your password: '
            '- press CTRL+ALT+DEL -> Change a password...'
            ''
            'If you have forgotten your password and need to reset it, you can do this by clicking here. '
            "In case of problems please contact the HelpDesk by visiting [Evotec Website](https://evotec.xyz) or by sending an email to Help Desk."
            ''
            'Alternatively you can always call Help Desk at +48 22 00 00 00'
            ''
            'Kind regards,'
            'Evotec IT'
        }
        EmailText -LineBreak
    }
} -AttachSelf -Verbose