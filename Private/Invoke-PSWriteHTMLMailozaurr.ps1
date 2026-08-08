function Invoke-PSWriteHTMLMailozaurr {
    <#
    .SYNOPSIS
    Maps the legacy PSWriteHTML email contract to Mailozaurr without requiring the module.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][System.Collections.IDictionary] $EmailParameters,
        [Parameter(Mandatory)][AllowEmptyString()][string] $Body,
        [System.Collections.Generic.List[string]] $Attachment,
        [System.Collections.IDictionary] $AdditionalParameters,
        [switch] $WhatIf
    )

    $Command = Get-Command -Name 'Mailozaurr\Send-EmailMessage' -ErrorAction SilentlyContinue
    if (-not $Command) {
        $Command = Get-Command -Name 'Send-EmailMessage' -ErrorAction SilentlyContinue
    }
    if (-not $Command) {
        throw "Email -UseMailozaurr requires the Mailozaurr module and its Send-EmailMessage command to be available."
    }

    if ($EmailParameters.PasswordFromFile) {
        throw "Email -UseMailozaurr does not map the legacy -PasswordFromFile behavior. Pass Credential or provider authentication through -MailozaurrParameters."
    }

    $Parameters = [ordered] @{}
    $CommonMappings = [ordered] @{
        From     = 'From'
        To       = 'To'
        CC       = 'Cc'
        BCC      = 'Bcc'
        ReplyTo  = 'ReplyTo'
        Subject  = 'Subject'
        Priority = 'Priority'
    }
    foreach ($SourceName in $CommonMappings.Keys) {
        $Value = $EmailParameters[$SourceName]
        if ($null -ne $Value -and -not ($Value -is [string] -and [string]::IsNullOrWhiteSpace($Value))) {
            $Parameters[$CommonMappings[$SourceName]] = $Value
        }
    }

    $UseSmtpTransport = $true
    $NonSmtpSelectors = @('Graph', 'MgGraphRequest', 'SendGrid', 'EmailProvider')
    if ($AdditionalParameters) {
        foreach ($Key in $AdditionalParameters.Keys) {
            $SelectorName = [string] $Key
            if ($NonSmtpSelectors -notcontains $SelectorName) {
                continue
            }

            $SelectorValue = $AdditionalParameters[$Key]
            $SelectorEnabled = if ($SelectorValue -is [System.Management.Automation.SwitchParameter]) {
                $SelectorValue.IsPresent
            } elseif ($SelectorValue -is [bool]) {
                $SelectorValue
            } else {
                $null -ne $SelectorValue
            }
            if ($SelectorEnabled) {
                $UseSmtpTransport = $false
                break
            }
        }
    }

    if ($UseSmtpTransport) {
        $SmtpMappings = [ordered] @{
            Server   = 'Server'
            Login    = 'Username'
            Password = 'Password'
            Port     = 'Port'
        }
        foreach ($SourceName in $SmtpMappings.Keys) {
            $Value = $EmailParameters[$SourceName]
            if ($null -ne $Value -and -not ($Value -is [string] -and [string]::IsNullOrWhiteSpace($Value))) {
                $Parameters[$SmtpMappings[$SourceName]] = $Value
            }
        }
        if ($EmailParameters.UseDefaultCredentials) {
            $Parameters['UseDefaultCredentials'] = $true
        }
        if ($EmailParameters.EnableSSL) {
            $Parameters['UseSsl'] = $true
        }
        if ($EmailParameters.PasswordAsSecure) {
            $Parameters['AsSecureString'] = $true
        }
        if ($EmailParameters.DeliveryNotifications -and $EmailParameters.DeliveryNotifications -ne 'None') {
            $Parameters['DeliveryNotificationOption'] = @($EmailParameters.DeliveryNotifications)
        }
    }

    $Parameters['HTML'] = $Body
    if ($Attachment -and $Attachment.Count -gt 0) {
        $Parameters['Attachment'] = $Attachment.ToArray()
    }
    if ($AdditionalParameters) {
        foreach ($Key in $AdditionalParameters.Keys) {
            $Parameters[$Key] = $AdditionalParameters[$Key]
        }
    }
    if ($WhatIf) {
        $Parameters['WhatIf'] = $true
    }

    & $Command @Parameters
}
