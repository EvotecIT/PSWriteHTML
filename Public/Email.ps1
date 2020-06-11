function Email {
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $Email,
        [string[]] $To,
        [string[]] $CC,
        [string[]] $BCC,
        [string] $ReplyTo,
        [string] $From,
        [string] $Subject,
        [alias('SelfAttach')][switch] $AttachSelf,
        [string] $AttachSelfName,
        [string] $Server,
        [string] $Username,
        [int] $Port = 587,
        [string] $Password,
        [switch] $PasswordFromFile,
        [switch] $PasswordAsSecure,
        [switch] $SSL,
        [ValidateSet('Low', 'Normal', 'High')] [string] $Priority = 'Normal',
        [ValidateSet('None', 'OnSuccess', 'OnFailure', 'Delay', 'Never')] $DeliveryNotifications = 'None',
        [string] $Encoding = 'Unicode',
        [string] $FilePath,
        [alias('Supress')][bool] $Suppress = $true,
        [switch] $Online,
        [switch] $OutputHTML,
        [switch] $WhatIf
    )
    if ($Online) {
        $Script:EmailOnline = $true
    } else {
        $Script:EmailOnline = $false
    }
    $StartTime = [System.Diagnostics.Stopwatch]::StartNew()
    $ServerParameters = [ordered] @{
        From                  = $From
        To                    = $To
        CC                    = $CC
        BCC                   = $BCC
        ReplyTo               = $ReplyTo
        Server                = $Server
        Login                 = $Username
        Password              = $Password
        PasswordAsSecure      = $PasswordAsSecure
        PasswordFromFile      = $PasswordFromFile
        Port                  = $Port

        EnableSSL             = $SSL
        Encoding              = $Encoding
        Subject               = $Subject
        Priority              = $Priority
        DeliveryNotifications = $DeliveryNotifications
    }
    $Attachments = [System.Collections.Generic.List[string]]::new()

    [Array] $EmailParameters = Invoke-Command -ScriptBlock $Email

    foreach ($Parameter in $EmailParameters) {
        switch ( $Parameter.Type ) {
            HeaderTo {
                $ServerParameters.To = $Parameter.Addresses
            }
            HeaderCC {
                $ServerParameters.CC = $Parameter.Addresses
            }
            HeaderBCC {
                $ServerParameters.BCC = $Parameter.Addresses
            }
            HeaderFrom {
                $ServerParameters.From = $Parameter.Address
            }
            HeaderReplyTo {
                $ServerParameters.ReplyTo = $Parameter.Address
            }
            HeaderSubject {
                $ServerParameters.Subject = $Parameter.Subject
            }
            HeaderServer {
                $ServerParameters.Server = $Parameter.Server
                $ServerParameters.Port = $Parameter.Port
                $ServerParameters.Login = $Parameter.UserName
                $ServerParameters.Password = $Parameter.Password
                $ServerParameters.PasswordFromFile = $Parameter.PasswordFromFile
                $ServerParameters.PasswordAsSecure = $Parameter.PasswordAsSecure
                $ServerParameters.EnableSSL = $Parameter.SSL
            }
            HeaderAttachment {
                foreach ($Attachment in  $Parameter.FilePath) {
                    $Attachments.Add($Attachment)
                }
            }
            HeaderOptions {
                $ServerParameters.DeliveryNotifications = $Parameter.DeliveryNotifications
                $ServerParameters.Encoding = $Parameter.Encoding
                $ServerParameters.Priority = $Parameter.Priority
            }
            Default {
                $Body = $Parameter
            }
        }
    }
    if ($FilePath) {
        # Saving HTML to file
        $SavedPath = Save-HTML -FilePath $FilePath -HTML $Body -Suppress $false
    }
    if ($OutputHTML) {
        # If outputhtml is set it allows to return Body of HTML for using it in different scenarios
        $Body
    }
    if ($AttachSelf) {
        if ($AttachSelfName) {
            $TempFilePath = "$(Get-TemporaryDirectory)\$($AttachSelfName).html"
        } else {
            $TempFilePath = ''
        }
        if ($FilePath -and -not $AttachSelfName) {
            # we don't want to save body again if we already saved it above
            $Saved = $SavedPath
        } else {
            # we save it to temp file or attachselfname
            $Saved = Save-HTML -FilePath $TempFilePath -HTML $Body -Suppress $false
        }
        if ($Saved) {
            $Attachments.Add($Saved)
        }
    }

    #$MailSentTo = "To: $($ServerParameters.To -join ', '); CC: $($ServerParameters.CC -join ', '); BCC: $($ServerParameters.BCC -join ', ')".Trim()
    $EmailOutput = Send-Email -EmailParameters $ServerParameters -Body ($Body -join '') -Attachment $Attachments -WhatIf:$WhatIf
    if (-not $Suppress) {
        $EmailOutput
    }

    $EndTime = Stop-TimeLog -Time $StartTime -Option OneLiner
    Write-Verbose "Email - Time to send: $EndTime"
    $Script:EmailOnline = $false
}