function New-InternalNavLink {
    <#
    .SYNOPSIS
    Creates a new internal navigation link with customizable properties.

    .DESCRIPTION
    This function creates a new internal navigation link with the specified properties. It allows customization of the link name, color, href, icon color, icon style, spinning, border, positioning, rotation, flipping, and more.

    .PARAMETER Name
    Specifies the name of the navigation link.

    .PARAMETER NameColor
    Specifies the color of the navigation link name.

    .PARAMETER Href
    Specifies the URL to navigate to when the link is clicked.

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

    .PARAMETER Nested
    Indicates whether the link is nested within another element.

    .PARAMETER MenuItems
    Indicates whether the link is part of a menu.

    .PARAMETER FloatItem
    Indicates whether the link should float.

    .PARAMETER ListItem1
    Indicates whether the link is a list item with specific styling.

    .PARAMETER ListItem
    Indicates whether the link is a list item.

    .EXAMPLE
    New-InternalNavLink -Name 'Home' -NameColor 'blue' -Href '/home' -IconBrands 'fab fa-home' -Spinning -IconColor 'red' -Bordered -PullLeft -Rotate '90' -FlipVertical
    Creates a new internal navigation link with the name 'Home', blue name color, link to '/home', spinning home icon in red color with border, pulled to the left, rotated 90 degrees, and flipped vertically.

    .EXAMPLE
    New-InternalNavLink -Name 'About' -Href '/about' -IconRegular 'far fa-address-card' -IconColor 'green' -BorderedCircle -PullRight -FlipHorizontal
    Creates a new internal navigation link with the name 'About', link to '/about', regular address card icon in green color with circular border, pulled to the right, and flipped horizontally.
    #>
    [cmdletBinding()]
    param(
        [string] $Name,
        [string] $NameColor,
        [string] $Href,
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
        [switch] $Nested,
        [switch] $MenuItems,
        [switch] $FloatItem,
        [switch] $ListItem
    )
    if ($MenuItems) {
        if ($Nested) {
            $NavLink = New-HTMLTag -Tag 'span' -Attributes @{ class = 'parent' } {
                New-HTMLTag -Tag 'span' -Attributes @{ style = @{ "padding-right" = "5px" } } {
                    New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                }
                if ($NameColor) {
                    New-HTMLSpanStyle -Color $NameColor {
                        $Name
                    }
                } else {
                    $Name
                }
            }
        } else {
            $NavLink = New-HTMLTag -Tag 'li' {
                New-HTMLTag -Tag 'a' -Attributes @{ href = $Href } {
                    New-HTMLTag -Tag 'span' -Attributes @{ style = @{ "padding-right" = "5px" } } {
                        New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                    }
                    if ($NameColor) {
                        New-HTMLSpanStyle -Color $NameColor {
                            $Name
                        }
                    } else {
                        $Name
                    }
                }
            }
        }
        $NavLink
    } elseif ($FloatItem) {
        $NavLink = New-HTMLTag -Tag 'a' -Attributes @{ href = $Href } {
            New-HTMLTag -Tag 'span' -Attributes @{ style = @{ "padding-right" = "5px" } } {
                New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
            }
            if ($NameColor) {
                New-HTMLSpanStyle -Color $NameColor {
                    $Name
                }
            } else {
                $Name
            }
        }
        $NavLink
    } elseif ($ListItem1) {
        $NavLink = New-HTMLTag -Tag 'a' -Attributes @{ href = $Href } {
            New-HTMLTag -Tag 'span' -Attributes @{ style = @{ "padding-right" = "5px"; 'margin-left' = '-10px' } } {
                New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
            }
            if ($NameColor) {
                New-HTMLSpanStyle -Color $NameColor {
                    $Name
                }
            } else {
                $Name
            }
        }
        $NavLink
    } elseif ($ListItem) {
        $NavLink = New-HTMLTag -Tag 'li' {
            New-HTMLTag -Tag 'a' -Attributes @{ href = $Href } {
                #New-HTMLTag -Tag 'span' -Attributes @{ style = @{ "padding-right" = "5px"; 'margin-left' = '-10px' } } {
                New-InternalNavIcon -ClassIcon 'side-penal-list-icon' -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                #}
                if ($NameColor) {
                    New-HTMLSpanStyle -Color $NameColor {
                        $Name
                    }
                } else {
                    $Name
                }
            }
        }
        $NavLink
    } else {
        if ($Nested) {
            $NavLink = New-HTMLTag -Tag 'span' -Attributes @{ class = 'its-parent' } {
                New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                if ($NameColor) {
                    New-HTMLSpanStyle -Color $NameColor {
                        $Name
                    }
                } else {
                    $Name
                }
            }
        } else {
            $NavLink = New-HTMLTag -Tag 'li' {
                New-HTMLTag -Tag 'a' -Attributes @{ href = $Href } {
                    New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                    if ($NameColor) {
                        New-HTMLSpanStyle -Color $NameColor {
                            $Name
                        }
                    } else {
                        $Name
                    }
                }
            }
        }
        $NavLink
    }
}