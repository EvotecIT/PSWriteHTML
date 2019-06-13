$Company = 'Evotec'

$Text = @"
This email is from Evotec. It may contain confidential information. It is intended for the addressee only and may not be copied or disclosed to any third party without our permission. If you are not the intended recipient please contact the sender as soon as possible and delete the material from any computer. If this email has been sent as a personal message to the addressee, the sender is not acting in his/her capacity as an employee or officer of $Company Limited and no liability is accepted for the content of any such email. Outgoing email may be monitored for the purpose of ensuring compliance with our email policy and relevant laws
"@

$HTML = New-HTMLText -FontSize 10 -FontFamily 'Source Sans Pro' -Text $Text
Save-HTML -FilePath $PSScriptRoot\Disclaimer.html -HTML $HTML -ShowHTML