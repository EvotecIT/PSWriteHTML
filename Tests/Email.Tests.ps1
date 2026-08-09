Describe 'Email content and transport contracts' {
    BeforeAll {
        . "$PSScriptRoot\..\Private\Invoke-PSWriteHTMLMailozaurr.ps1"
        . "$PSScriptRoot\..\Public\Email.ps1"
        . "$PSScriptRoot\..\Public\EmailServer.ps1"

        function Stop-TimeLog {
            '0 ms'
        }

        function Test-MailozaurrSender {
            [CmdletBinding(SupportsShouldProcess, DefaultParameterSetName = 'Smtp')]
            param(
                [object] $From,
                [object[]] $To,
                [object[]] $Cc,
                [object[]] $Bcc,
                [string] $ReplyTo,
                [Parameter(ParameterSetName = 'Smtp')][string] $Server,
                [Parameter(ParameterSetName = 'Smtp')][string] $Username,
                [Parameter(ParameterSetName = 'Smtp')][string] $Password,
                [Parameter(ParameterSetName = 'Smtp')][int] $Port,
                [string] $Subject,
                [string] $Priority,
                [string[]] $HTML,
                [object[]] $Attachment,
                [Parameter(ParameterSetName = 'Smtp')][switch] $UseSsl,
                [Parameter(ParameterSetName = 'Smtp')][switch] $AsSecureString,
                [Parameter(ParameterSetName = 'Smtp')][switch] $UseDefaultCredentials,
                [Parameter(Mandatory, ParameterSetName = 'Graph')][switch] $Graph,
                [pscredential] $Credential,
                [string] $ProviderMarker
            )

            [pscustomobject] @{
                ParameterSet   = $PSCmdlet.ParameterSetName
                From           = $From
                To             = $To
                HTML           = $HTML -join ''
                Attachment     = $Attachment
                UseSsl         = $UseSsl.IsPresent
                UseDefaultCredentials = $UseDefaultCredentials.IsPresent
                ProviderMarker = $ProviderMarker
                BoundParameters = @($PSBoundParameters.Keys)
            }
        }

        $script:TestMailozaurrSenderCommand = Get-Command Test-MailozaurrSender
    }

    BeforeEach {
        $script:LegacySendCount = 0
        function Send-Email {
            $script:LegacySendCount++
            throw 'The legacy sender must not be invoked by this test.'
        }
    }

    It 'returns content and preserves the legacy send when OutputHTML is selected' {
        Mock Send-Email {
            $script:LegacySendCount++
            'sent'
        }

        $result = Email -OutputHTML -Suppress:$false {
            '<html><body>Rendered and sent</body></html>'
        }

        $result | Should -HaveCount 2
        $result[0] | Should -Be '<html><body>Rendered and sent</body></html>'
        $result[1] | Should -Be 'sent'
        $script:LegacySendCount | Should -Be 1
    }

    It 'maps the generated body and legacy headers to the optional Mailozaurr command' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -Server 'smtp.example.test' -SSL -MailozaurrParameters @{ ProviderMarker = 'runtime-adapter' } {
            '<html><body>Mailozaurr body</body></html>'
        }

        $result.From | Should -Be 'sender@example.test'
        $result.To | Should -Contain 'recipient@example.test'
        $result.HTML | Should -Be '<html><body>Mailozaurr body</body></html>'
        $result.UseSsl | Should -BeTrue
        $result.ProviderMarker | Should -Be 'runtime-adapter'
        $script:LegacySendCount | Should -Be 0
    }

    It 'does not leak SMTP-only defaults into a Graph Mailozaurr parameter set' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }
        $credential = [pscredential]::new('graph-user@example.test', (ConvertTo-SecureString 'not-a-secret' -AsPlainText -Force))

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{ Graph = $true; Credential = $credential } {
            '<html><body>Graph body</body></html>'
        }

        $result.ParameterSet | Should -Be 'Graph'
        $result.HTML | Should -Be '<html><body>Graph body</body></html>'
        $script:LegacySendCount | Should -Be 0
    }

    It 'omits disabled provider selectors from the Mailozaurr splat' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -Server 'smtp.example.test' -MailozaurrParameters @{ Graph = $false } {
            '<html><body>SMTP body</body></html>'
        }

        $result.ParameterSet | Should -Be 'Smtp'
        $result.BoundParameters | Should -Not -Contain 'Graph'
    }

    It 'ignores legacy PasswordFromFile when a non-SMTP provider is selected' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }
        $credential = [pscredential]::new('graph-user@example.test', (ConvertTo-SecureString 'not-a-secret' -AsPlainText -Force))

        $result = Email -UseMailozaurr -PasswordFromFile -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{ Graph = $true; Credential = $credential } {
            '<html><body>Graph body</body></html>'
        }

        $result.ParameterSet | Should -Be 'Graph'
    }

    It 'allows explicit SMTP authentication to replace legacy PasswordFromFile' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }
        $credential = [pscredential]::new('smtp-user@example.test', (ConvertTo-SecureString 'not-a-secret' -AsPlainText -Force))

        $result = Email -UseMailozaurr -Username 'legacy-user@example.test' -Password 'C:\secrets\smtp-password.txt' -PasswordFromFile -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -Server 'smtp.example.test' -MailozaurrParameters @{ Credential = $credential } {
            '<html><body>SMTP body</body></html>'
        }

        $result.ParameterSet | Should -Be 'Smtp'
        $result.BoundParameters | Should -Contain 'Credential'
        $result.BoundParameters | Should -Not -Contain 'Username'
        $result.BoundParameters | Should -Not -Contain 'Password'
    }

    It 'rejects Username alone as a replacement for legacy PasswordFromFile' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        { Email -UseMailozaurr -Password 'C:\secrets\smtp-password.txt' -PasswordFromFile -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -Server 'smtp.example.test' -MailozaurrParameters @{ Username = 'smtp-user@example.test' } {
            '<html><body>SMTP body</body></html>'
        } } | Should -Throw '*does not map the legacy -PasswordFromFile behavior*'
    }

    It 'rejects OAuth2 without the credential that supplies its token' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        { Email -UseMailozaurr -Password 'C:\secrets\smtp-password.txt' -PasswordFromFile -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -Server 'smtp.example.test' -MailozaurrParameters @{ OAuth2 = $true } {
            '<html><body>SMTP body</body></html>'
        } } | Should -Throw '*does not map the legacy -PasswordFromFile behavior*'
    }

    It 'finds explicit SMTP authentication in a case-sensitive dictionary by its actual key' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }
        $credential = [pscredential]::new('smtp-user@example.test', (ConvertTo-SecureString 'not-a-secret' -AsPlainText -Force))
        $parameters = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $parameters.Add('credential', $credential)

        $result = Email -UseMailozaurr -PasswordFromFile -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -Server 'smtp.example.test' -MailozaurrParameters $parameters {
            '<html><body>SMTP body</body></html>'
        }

        $result.ParameterSet | Should -Be 'Smtp'
        $result.BoundParameters | Should -Contain 'credential'
    }

    It 'rejects an unrelated global Send-EmailMessage command' {
        Mock Get-Command {
            param($Name)
            if ($Name -eq 'Mailozaurr\Send-EmailMessage') {
                return $null
            }
            $script:TestMailozaurrSenderCommand
        }

        { Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' { 'body' } } |
            Should -Throw '*requires the Mailozaurr module*'
    }

    It 'preserves legacy default-credential SMTP behavior' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' {
            EmailServer -Server 'smtp.example.test' -UseDefaultCredential
            '<html><body>Default credentials</body></html>'
        }

        $result.ParameterSet | Should -Be 'Smtp'
        $result.UseDefaultCredentials | Should -BeTrue
        $script:LegacySendCount | Should -Be 0
    }

    It 'lets an explicit credential replace legacy default authentication' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }
        $credential = [pscredential]::new('smtp-user@example.test', (ConvertTo-SecureString 'not-a-secret' -AsPlainText -Force))

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{ Credential = $credential } {
            EmailServer -Server 'smtp.example.test' -UserName 'legacy-user@example.test' -Password 'legacy-password' -PasswordAsSecure -UseDefaultCredential
            '<html><body>Explicit credentials</body></html>'
        }

        $result.BoundParameters | Should -Contain 'Credential'
        $result.BoundParameters | Should -Not -Contain 'UseDefaultCredentials'
        $result.BoundParameters | Should -Not -Contain 'Username'
        $result.BoundParameters | Should -Not -Contain 'Password'
        $result.BoundParameters | Should -Not -Contain 'AsSecureString'
    }

    It 'lets explicit username and password replace legacy default authentication' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{ Username = 'smtp-user@example.test'; Password = 'explicit-password' } {
            EmailServer -Server 'smtp.example.test' -UseDefaultCredential
            '<html><body>Explicit password</body></html>'
        }

        $result.BoundParameters | Should -Contain 'Username'
        $result.BoundParameters | Should -Contain 'Password'
        $result.BoundParameters | Should -Not -Contain 'UseDefaultCredentials'
    }

    It 'omits a disabled default-credential selector and suppresses the legacy value' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{ UseDefaultCredentials = $false } {
            EmailServer -Server 'smtp.example.test' -UseDefaultCredential
            '<html><body>Anonymous SMTP</body></html>'
        }

        $result.BoundParameters | Should -Not -Contain 'UseDefaultCredentials'
    }

    It 'omits an inactive null credential without replacing legacy authentication' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{ Credential = $null } {
            EmailServer -Server 'smtp.example.test' -UserName 'legacy-user@example.test' -Password 'legacy-password'
            '<html><body>Legacy credentials</body></html>'
        }

        $result.BoundParameters | Should -Not -Contain 'Credential'
        $result.BoundParameters | Should -Contain 'Username'
        $result.BoundParameters | Should -Contain 'Password'
    }

    It 'omits inactive authentication values from a case-sensitive parameter dictionary' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }
        $parameters = [System.Collections.Generic.Dictionary[string, object]]::new([System.StringComparer]::Ordinal)
        $parameters['credential'] = $null
        $parameters['username'] = '   '
        $parameters['password'] = ''

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters $parameters {
            EmailServer -Server 'smtp.example.test'
            '<html><body>Anonymous SMTP</body></html>'
        }

        $result.BoundParameters | Should -Not -Contain 'credential'
        $result.BoundParameters | Should -Not -Contain 'username'
        $result.BoundParameters | Should -Not -Contain 'password'
    }

    It 'does not apply the legacy secure-string flag to a plaintext password override' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{ Password = 'replacement-password' } {
            EmailServer -Server 'smtp.example.test' -UserName 'legacy-user@example.test' -Password 'legacy-password' -PasswordAsSecure
            '<html><body>Plaintext replacement</body></html>'
        }

        $result.BoundParameters | Should -Contain 'Password'
        $result.BoundParameters | Should -Not -Contain 'AsSecureString'
    }

    It 'honors an explicit secure-string flag with a replacement password' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{ Password = 'replacement-password'; AsSecureString = $true } {
            EmailServer -Server 'smtp.example.test' -UserName 'legacy-user@example.test' -Password 'legacy-password'
            '<html><body>Secure replacement</body></html>'
        }

        $result.BoundParameters | Should -Contain 'Password'
        $result.BoundParameters | Should -Contain 'AsSecureString'
    }

    It 'omits a disabled secure-string switch from non-SMTP providers' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{ Graph = $true; AsSecureString = $false } {
            '<html><body>Graph body</body></html>'
        }

        $result.ParameterSet | Should -Be 'Graph'
        $result.BoundParameters | Should -Not -Contain 'AsSecureString'
    }

    It 'treats a null secure-string switch as unspecified legacy authentication' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{ AsSecureString = $null } {
            EmailServer -Server 'smtp.example.test' -UserName 'legacy-user@example.test' -Password 'legacy-password' -PasswordAsSecure
            '<html><body>Legacy secure password</body></html>'
        }

        $result.ParameterSet | Should -Be 'Smtp'
        $result.BoundParameters | Should -Contain 'AsSecureString'
    }

    It 'omits SMTP-only authentication values from non-SMTP providers while retaining shared credentials' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }
        $credential = [pscredential]::new('graph-user@example.test', (ConvertTo-SecureString 'not-a-secret' -AsPlainText -Force))

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{
            Graph = $true
            Credential = $credential
            Username = 'stale-smtp-user'
            Password = 'stale-smtp-password'
            UseDefaultCredentials = $true
            OAuth2 = $true
            AsSecureString = $true
        } {
            '<html><body>Graph authentication</body></html>'
        }

        $result.ParameterSet | Should -Be 'Graph'
        $result.BoundParameters | Should -Contain 'Credential'
        foreach ($parameter in 'Username', 'Password', 'UseDefaultCredentials', 'OAuth2', 'AsSecureString') {
            $result.BoundParameters | Should -Not -Contain $parameter
        }
    }

    It 'omits the complete SMTP transport surface from non-SMTP providers' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }
        $credential = [pscredential]::new('graph-user@example.test', (ConvertTo-SecureString 'not-a-secret' -AsPlainText -Force))
        $smtpOnly = @{
            Server = 'smtp.example.test'
            Port = 465
            Encoding = 'UTF8'
            DeliveryNotificationOption = 'OnFailure'
            DeliveryStatusNotificationType = 'Full'
            AuthenticationMechanism = 'Plain'
            SecureSocketOptions = 'SslOnConnect'
            UseSsl = $true
            SkipCertificateRevocation = $true
            SkipCertificateValidation = $true
            Timeout = 45000
            MimeMessagePath = 'message.eml'
            LocalDomain = 'example.test'
            SignOrEncrypt = 'Sign'
            CertificatePath = 'certificate.pfx'
            CertificatePassword = 'not-a-secret'
            CertificatePasswordAsSecureString = $true
            CertificateThumbprint = '00'
            Certificate = [pscustomobject]@{ Subject = 'CN=Test' }
            PublicKeyPath = 'public.asc'
            PrivateKeyPath = 'private.asc'
            PrivateKeyPassword = 'not-a-secret'
            PrivateKeyPasswordAsSecureString = $true
        }
        $parameters = @{ Graph = $true; Credential = $credential }
        foreach ($entry in $smtpOnly.GetEnumerator()) {
            $parameters[$entry.Key] = $entry.Value
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters $parameters {
            '<html><body>Graph transport filtering</body></html>'
        }

        $result.ParameterSet | Should -Be 'Graph'
        $result.BoundParameters | Should -Contain 'Credential'
        foreach ($parameter in $smtpOnly.Keys) {
            $result.BoundParameters | Should -Not -Contain $parameter
        }
    }

    It 'omits the SMTP OAuth alias from non-SMTP providers' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }
        $credential = [pscredential]::new('graph-user@example.test', (ConvertTo-SecureString 'not-a-secret' -AsPlainText -Force))

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{
            Graph = $true
            Credential = $credential
            oAuth = $true
        } {
            '<html><body>Graph OAuth alias filtering</body></html>'
        }

        $result.ParameterSet | Should -Be 'Graph'
        $result.BoundParameters | Should -Contain 'Credential'
        $result.BoundParameters | Should -Not -Contain 'oAuth'
    }

    It 'treats a null default-credential switch as unspecified legacy authentication' {
        Mock Get-Command {
            $script:TestMailozaurrSenderCommand
        }

        $result = Email -UseMailozaurr -Suppress:$false -From 'sender@example.test' -To 'recipient@example.test' -MailozaurrParameters @{ UseDefaultCredentials = $null } {
            EmailServer -Server 'smtp.example.test' -UseDefaultCredential
            '<html><body>Legacy default credentials</body></html>'
        }

        $result.ParameterSet | Should -Be 'Smtp'
        $result.BoundParameters | Should -Contain 'UseDefaultCredentials'
    }
}
