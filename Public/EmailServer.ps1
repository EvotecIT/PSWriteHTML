function EmailServer {
    [CmdletBinding()]
    param(
        [string] $Server,
        [int] $Port = 587,
        [string] $UserName,
        [string] $Password,
        [switch] $PasswordAsSecure,
        [switch] $PasswordFromFile,
        [switch] $SSL
    )

    [PsCustomObject] @{
        Type             = 'HeaderServer'
        Server           = $Server
        Port             = $Port
        UserName         = $UserName
        Password         = $Password
        PasswordAsSecure = $PasswordAsSecure
        PasswordFromFile = $PasswordFromFile
        SSL              = $SSL
    }
}