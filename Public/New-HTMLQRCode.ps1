function New-HTMLQRCode {
    <#
    .SYNOPSIS
    Creates an HTML QR code with specified parameters.

    .DESCRIPTION
    This function generates an HTML QR code based on the provided parameters. It allows customization of the QR code appearance and content.

    .PARAMETER Link
    The link or content to be encoded in the QR code.

    .PARAMETER Width
    The width of the QR code.

    .PARAMETER Height
    The height of the QR code.

    .PARAMETER Title
    The title or alt text for the QR code.

    .PARAMETER TitleColor
    The color of the title text.

    .PARAMETER Logo
    The path to the logo image to be embedded in the QR code.

    .PARAMETER LogoWidth
    The width of the logo image.

    .PARAMETER LogoHeight
    The height of the logo image.

    .PARAMETER LogoInline
    Indicates whether the logo should be embedded inline in the QR code.

    .EXAMPLE
    New-HTMLQRCode -Link "https://example.com" -Width 200 -Height 200 -Title "Example QR Code" -TitleColor "black" -Logo "C:\logo.png" -LogoWidth 50 -LogoHeight 50 -LogoInline
    Creates a QR code with a specified link, dimensions, title, color, and logo embedded inline.

    .EXAMPLE
    New-HTMLQRCode -Link "tel:1234567890" -Width 150 -Height 150 -Title "Contact Number" -TitleColor "blue" -Logo "C:\company_logo.png" -LogoWidth 30 -LogoHeight 30
    Generates a QR code for a phone number with custom dimensions, title, color, and logo.

    #>
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