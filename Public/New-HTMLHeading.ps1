Function New-HTMLHeading {
    [CmdletBinding()]
    Param (
        [validateset('h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'h7')][string]$Heading,
        [string]$HeadingText,
        # [validateset('default', 'central')][string] $Type = 'default',
        [switch] $Underline,
        [string]$Color
    )
    if ($null -ne $Color) {
        $RGBcolor = ConvertFrom-Color -Color $Color
        $Attributes = @{
            style = "color: $RGBcolor;"
        }
    } else {
        $Attributes = @{ }
    }
    # if ($Type -eq 'central') {
    #        $Attributes.Class = 'central'
    #   }
    if ($Underline) {
        $Attributes.Class = "$($Attributes.Class) underline"
    }

    New-HTMLTag -Tag $Heading -Attributes $Attributes {
        $HeadingText
    }
}