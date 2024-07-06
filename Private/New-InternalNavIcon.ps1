function New-InternalNavIcon {
    <#
    .SYNOPSIS
    Creates a new internal navigation icon with customizable properties.

    .DESCRIPTION
    This function creates a new internal navigation icon with the specified properties. It allows customization of the icon color, style, rotation, flipping, spinning, and positioning.

    .PARAMETER IconColor
    Specifies the color of the icon.

    .PARAMETER IconBrands
    Specifies the brand icon style.

    .PARAMETER IconRegular
    Specifies the regular icon style.

    .PARAMETER IconSolid
    Specifies the solid icon style.

    .PARAMETER IconMaterial
    Specifies the material icon style.

    .PARAMETER Spinning
    Indicates whether the icon should spin.

    .PARAMETER SpinningReverse
    Indicates whether the spinning direction should be reversed.

    .PARAMETER Bordered
    Indicates whether the icon should have a border.

    .PARAMETER BorderedCircle
    Indicates whether the icon should have a circular border.

    .PARAMETER PullLeft
    Indicates whether the icon should be pulled to the left.

    .PARAMETER PullRight
    Indicates whether the icon should be pulled to the right.

    .PARAMETER Rotate
    Specifies the rotation angle of the icon.

    .PARAMETER FlipVertical
    Indicates whether the icon should be flipped vertically.

    .PARAMETER FlipHorizontal
    Indicates whether the icon should be flipped horizontally.

    .PARAMETER ClassIcon
    Specifies the CSS class for the icon. Default value is 'icon'.

    .EXAMPLE
    New-InternalNavIcon -IconColor 'blue' -IconSolid 'check-circle' -Rotate '90'

    Creates a new internal navigation icon with a blue color, solid style 'check-circle', and rotated 90 degrees.

    .EXAMPLE
    New-InternalNavIcon -IconBrands 'facebook' -Spinning -FlipHorizontal

    Creates a new internal navigation icon with the Facebook brand icon, spinning animation, and horizontal flipping.

    #>
    [cmdletBinding()]
    param(
        [string] $IconColor,
        [string] $IconBrands,
        [string] $IconRegular,
        [string] $IconSolid,
        [string] $IconMaterial,
        [switch] $Spinning,
        [switch] $SpinningReverse,
        [switch] $Bordered,
        [switch] $BorderedCircle,
        [switch] $PullLeft,
        [switch] $PullRight,
        [string] $Rotate,
        [switch] $FlipVertical,
        [switch] $FlipHorizontal,
        [string] $ClassIcon = 'icon'
    )
    if ($IconRegular -or $IconBrands -or $IconSolid -or $IconMaterial) {
        New-HTMLTag -Tag 'span' -Attributes @{ class = $ClassIcon } {
            $newHTMLFontIconSplat = @{
                IconColor    = $IconColor
                IconBrands   = $IconBrands
                IconRegular  = $IconRegular
                IconSolid    = $IconSolid
                IconMaterial = $IconMaterial
                FixedWidth   = $true
            }
            if ($Spinning) {
                $newHTMLFontIconSplat['Spinning'] = $Spinning
            }
            if ($SpinningReverse) {
                $newHTMLFontIconSplat['SpinningReverse'] = $SpinningReverse
            }
            if ($Bordered) {
                $newHTMLFontIconSplat['Bordered'] = $Bordered
            }
            if ($BorderedCircle) {
                $newHTMLFontIconSplat['BorderedCircle'] = $BorderedCircle
            }
            if ($PullLeft) {
                $newHTMLFontIconSplat['PullLeft'] = $PullLeft
            }
            if ($PullRight) {
                $newHTMLFontIconSplat['PullRight'] = $PullRight
            }
            if ($Rotate) {
                $newHTMLFontIconSplat['Rotate'] = $Rotate
            }
            if ($FlipVertical) {
                $newHTMLFontIconSplat['FlipVertical'] = $FlipVertical
            }
            if ($FlipHorizontal) {
                $newHTMLFontIconSplat['FlipHorizontal'] = $FlipHorizontal
            }
            Remove-EmptyValue -Hashtable $newHTMLFontIconSplat -Recursive
            New-HTMLFontIcon @newHTMLFontIconSplat
        }
    }
}