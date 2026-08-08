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
}
