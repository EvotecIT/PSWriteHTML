function New-InternalNavLink {
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