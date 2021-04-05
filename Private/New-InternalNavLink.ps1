function New-InternalNavLink {
    [cmdletBinding()]
    param(
        [string] $Name,
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
        [switch] $Nested
    )

    if ($Nested) {
        $NavLink = New-HTMLTag -Tag 'span' -Attributes @{ class = 'its-parent' } {
            New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
            $Name
        }
    } else {
        $NavLink = New-HTMLTag -Tag 'li' {
            New-HTMLTag -Tag 'a' -Attributes @{ href = $Href } {
                New-InternalNavIcon -IconBrands $IconBrands -IconRegular $IconRegular -IconSolid $IconSolid -IconMaterial $IconMaterial -Spinning:$Spinning.IsPresent -SpinningReverse:$SpinningReverse.IsPresent -IconColor $IconColor -Bordered:$Bordered.IsPresent -BorderedCircle:$BorderedCircle.IsPresent -PullLeft:$PullLeft.IsPresent -PullRight:$PullRight.IsPresent -Rotate $Rotate -FlipVertical:$FlipVertical.IsPresent -FlipHorizontal:$FlipHorizontal.IsPresent
                $Name
            }
        }
    }
    $NavLink
}