function New-HTMLQRCode {
    [cmdletBinding()]
    param(
        [string] $Link,
        [int] $Width,
        [int] $Height,
        [string] $Title,
        [string] $TitleColor
    )
    $Script:HTMLSchema.Features.QR = $true

    if (-not $AnchorName) {
        $AnchorName = "QrCode$(Get-RandomStringName -Size 8)"
    }

    New-HTMLTag -Tag 'div' -Attributes @{ Id = $AnchorName; class = 'qrcode flexElement' }

    $Options = @{
        text       = $Link
        width      = $Width
        height     = $Height
        title      = $Title
        titleColor = ConvertFrom-Color -Color $TitleColor
    }
    Remove-EmptyValue -Hashtable $Options -Recursive
    $OptionsJson = $Options | ConvertTo-Json

    # Since we want to allow use of QR code in tables or other places we push it to footer instead of inline
    $ScriptBottom = New-HTMLTag -Tag 'script' -Value {
        "var options = $OptionsJson;"
        "new QRCode(document.getElementById(`"$AnchorName`"), options);"
    }
    Add-HTMLScript -Placement Footer -Content $ScriptBottom -SkipTags
}

Register-ArgumentCompleter -CommandName New-HTMLQRCode -ParameterName TitleColor -ScriptBlock $Script:ScriptBlockColors