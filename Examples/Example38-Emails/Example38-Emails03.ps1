Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

$OutputHTML = EmailBody -FontFamily 'Calibri' -Size 15 {
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
} -Online

# this allows us to see the content of HTML and use it for other purposes instead of sending emails
# We skip using Email and use use EmailBody instead which should be a bit faster if that's all we care about
$OutputHTML