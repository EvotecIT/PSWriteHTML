function New-HTMLQRCode {
    [cmdletBinding()]
    param(
        [string] $Link,
        [object] $Width,
        [object] $Height,
        [string] $Title,
        [string] $TitleColor,
        [string] $Logo,
        [object] $LogoWidth,
        [object] $LogoHeight,
        [switch] $LogoInline
    )
    $Script:HTMLSchema.Features.QR = $true

    if (-not $AnchorName) {
        $AnchorName = "QrCode$(Get-RandomStringName -Size 8)"
    }
    if ($LogoInline) {
        # Cache makes sure that file is downloaded once and can be reused over and over until cache is reset
        # Resetting of cache is done automatically on module reload
        # This can be very useful when sending 3000 emails with same logo
        $LogoImage = Convert-Image -Image $Logo -Cache:(-not $DisableCache)
    } else {
        $LogoImage = $Logo
    }

    New-HTMLTag -Tag 'div' -Attributes @{ Id = $AnchorName; class = 'qrcode flexElement' }

    $Options = @{
        text       = $Link
        width      = ConvertTo-Size -Size $Width
        height     = ConvertTo-Size -Size $Height
        title      = $Title
        logo       = $LogoImage
        logoWidth  = ConvertTo-Size -Size $LogoWidth
        logoHeight = ConvertTo-Size -Size $LogoHeight
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