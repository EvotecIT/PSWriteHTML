function New-InternalNavIcon {
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