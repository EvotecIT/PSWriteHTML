function EmailServer {
    <#
    .SYNOPSIS
    Defines the email server configuration for sending emails.

    .DESCRIPTION
    This function sets up the email server configuration including server address, port, authentication credentials, and SSL settings.

    .PARAMETER Server
    Specifies the address of the email server.

    .PARAMETER Port
    Specifies the port number of the email server. Default is 587.

    .PARAMETER UserName
    Specifies the username for authentication with the email server.

    .PARAMETER Password
    Specifies the password for authentication with the email server.

    .PARAMETER PasswordAsSecure
    Indicates that the password should be treated as a secure string.

    .PARAMETER PasswordFromFile
    Indicates that the password should be read from a file.

    .PARAMETER SSL
    Indicates whether SSL should be used for the connection.

    .PARAMETER UseDefaultCredential
    Specifies whether to use default credentials for authentication.

    .EXAMPLE
    EmailServer -Server "mail.example.com" -Port 587 -UserName "user@example.com" -Password "P@ssw0rd" -SSL
    Configures the email server with the specified server address, port, username, password, and SSL enabled.

    #>
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port = 587,
        [string] $UserName,
        [string] $Password,
        [switch] $PasswordAsSecure,
        [switch] $PasswordFromFile,
        [switch] $SSL,
        [alias('UseDefaultCredentials')][switch] $UseDefaultCredential
    )

    [PsCustomObject] @{
        Type                  = 'HeaderServer'
        Server                = $Server
        Port                  = $Port
        UserName              = $UserName
        Password              = $Password
        PasswordAsSecure      = $PasswordAsSecure
        PasswordFromFile      = $PasswordFromFile
        SSL                   = $SSL
        UseDefaultCredentials = $UseDefaultCredential
    }
}