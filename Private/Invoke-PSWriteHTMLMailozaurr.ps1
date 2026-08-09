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
        $Candidate = Get-Command -Name 'Send-EmailMessage' -ErrorAction SilentlyContinue
        if ($Candidate -and ($Candidate.ModuleName -eq 'Mailozaurr' -or $Candidate.Source -eq 'Mailozaurr')) {
            $Command = $Candidate
        }
    }
    if (-not $Command) {
        throw "Email -UseMailozaurr requires the Mailozaurr module and its Send-EmailMessage command to be available."
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
    $SmtpAuthenticationParameters = @('Credential', 'Username', 'Password', 'UseDefaultCredentials', 'OAuth2', 'AsSecureString')
    $SmtpOnlyParameters = @(
        'Server', 'SmtpServer', 'Port', 'Encoding',
        'DeliveryNotificationOption', 'DeliveryStatusNotificationType',
        'Username', 'Password', 'AuthenticationMechanism', 'SecureSocketOptions', 'UseSsl',
        'SkipCertificateRevocation', 'SkipCertificateValidation', 'SkipCertificateValidatation',
        'Timeout', 'MimeMessagePath', 'LocalDomain', 'UseDefaultCredentials',
        'SignOrEncrypt', 'CertificatePath', 'CertificatePassword',
        'CertificatePasswordAsSecureString', 'CertificateThumbprint', 'Certificate',
        'PublicKeyPath', 'PrivateKeyPath', 'PrivateKeyPassword',
        'PrivateKeyPasswordAsSecureString', 'OAuth2', 'oAuth', 'AsSecureString'
    )
    $IsParameterEnabled = {
        param($Value)

        if ($Value -is [System.Management.Automation.SwitchParameter]) {
            return $Value.IsPresent
        }
        if ($Value -is [bool]) {
            return $Value
        }
        if ($Value -is [string]) {
            return -not [string]::IsNullOrWhiteSpace($Value)
        }
        return $null -ne $Value
    }
    if ($AdditionalParameters) {
        foreach ($Key in $AdditionalParameters.Keys) {
            $SelectorName = [string] $Key
            if ($NonSmtpSelectors -notcontains $SelectorName) {
                continue
            }
            $SelectorValue = $AdditionalParameters[$Key]
            if (& $IsParameterEnabled $SelectorValue) {
                $UseSmtpTransport = $false
                break
            }
        }
    }

    if ($UseSmtpTransport) {
        $ExplicitSmtpAuthenticationParameter = $null
        $AdditionalUseDefaultCredentialsSpecified = $false
        $AdditionalAsSecureStringSpecified = $false
        if ($AdditionalParameters) {
            foreach ($Key in $AdditionalParameters.Keys) {
                if ([string]::Equals([string] $Key, 'AsSecureString', [System.StringComparison]::OrdinalIgnoreCase)) {
                    $Value = $AdditionalParameters[$Key]
                    if ($Value -is [bool] -or $Value -is [System.Management.Automation.SwitchParameter]) {
                        $AdditionalAsSecureStringSpecified = $true
                        break
                    }
                }
            }
            foreach ($AuthenticationParameter in @('Credential', 'Password', 'UseDefaultCredentials')) {
                foreach ($Key in $AdditionalParameters.Keys) {
                    if ([string]::Equals([string] $Key, $AuthenticationParameter, [System.StringComparison]::OrdinalIgnoreCase)) {
                        if ($AuthenticationParameter -eq 'UseDefaultCredentials') {
                            $Value = $AdditionalParameters[$Key]
                            if ($Value -is [bool] -or $Value -is [System.Management.Automation.SwitchParameter]) {
                                $AdditionalUseDefaultCredentialsSpecified = $true
                            }
                        }
                        if (& $IsParameterEnabled $AdditionalParameters[$Key]) {
                            $ExplicitSmtpAuthenticationParameter = $AuthenticationParameter
                            break
                        }
                    }
                }
                if ($ExplicitSmtpAuthenticationParameter) {
                    break
                }
            }
        }
        $LegacyDefaultCredentialsEffective = ([bool] $EmailParameters.UseDefaultCredentials) -and
            -not $AdditionalUseDefaultCredentialsSpecified -and
            -not $ExplicitSmtpAuthenticationParameter
        $SmtpPasswordReplacementParameter = if ($ExplicitSmtpAuthenticationParameter) {
            $ExplicitSmtpAuthenticationParameter
        } elseif ($LegacyDefaultCredentialsEffective) {
            'UseDefaultCredentials'
        } else {
            $null
        }
        if ($EmailParameters.PasswordFromFile -and -not $SmtpPasswordReplacementParameter) {
            throw "Email -UseMailozaurr does not map the legacy -PasswordFromFile behavior for SMTP. Pass Credential or provider authentication through -MailozaurrParameters."
        }

        $SmtpMappings = [ordered] @{
            Server   = 'Server'
            Login    = 'Username'
            Password = 'Password'
            Port     = 'Port'
        }
        foreach ($SourceName in $SmtpMappings.Keys) {
            if (($SourceName -eq 'Password' -and ($EmailParameters.PasswordFromFile -or $SmtpPasswordReplacementParameter)) -or
                ($SourceName -eq 'Login' -and $SmtpPasswordReplacementParameter -in @('Credential', 'UseDefaultCredentials'))) {
                continue
            }
            $Value = $EmailParameters[$SourceName]
            if ($null -ne $Value -and -not ($Value -is [string] -and [string]::IsNullOrWhiteSpace($Value))) {
                $Parameters[$SmtpMappings[$SourceName]] = $Value
            }
        }
        if ($LegacyDefaultCredentialsEffective) {
            $Parameters['UseDefaultCredentials'] = $true
        }
        if ($EmailParameters.EnableSSL) {
            $Parameters['UseSsl'] = $true
        }
        if ($EmailParameters.PasswordAsSecure -and
            -not $AdditionalAsSecureStringSpecified -and
            $SmtpPasswordReplacementParameter -notin @('Credential', 'Password', 'UseDefaultCredentials')) {
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
            if ($SmtpOnlyParameters -contains [string] $Key -and -not $UseSmtpTransport) {
                continue
            }
            if ([string]::Equals([string] $Key, 'AsSecureString', [System.StringComparison]::OrdinalIgnoreCase)) {
                $Value = $AdditionalParameters[$Key]
                $IsBooleanSwitchValue = $Value -is [bool] -or $Value -is [System.Management.Automation.SwitchParameter]
                if (-not $IsBooleanSwitchValue -or -not (& $IsParameterEnabled $Value)) {
                    continue
                }
            }
            if ($NonSmtpSelectors -contains [string] $Key -and -not (& $IsParameterEnabled $AdditionalParameters[$Key])) {
                continue
            }
            if ($SmtpAuthenticationParameters -contains [string] $Key -and -not (& $IsParameterEnabled $AdditionalParameters[$Key])) {
                continue
            }
            $Parameters[$Key] = $AdditionalParameters[$Key]
        }
    }
    if ($WhatIf) {
        $Parameters['WhatIf'] = $true
    }

    & $Command @Parameters
}
