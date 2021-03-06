function New-HTMLContainer {
    [alias('Container')]
    [CmdletBinding()]
    param(
        [alias('Content')][Parameter(Mandatory = $false, Position = 0)][ScriptBlock] $HTML,
        [object] $Width = '100%',
        [string] $Margin,
        [string] $AnchorName
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    if (-not $AnchorName) {
        $AnchorName = "anchor-$(Get-RandomStringName -Size 7)"
    }
    if ($Width -or $Margin) {
        [string] $ClassName = "flexElement$(Get-RandomStringName -Size 8 -LettersOnly)"
        $Attributes = @{
            'flex-basis' = ConvertFrom-Size -Size $Width
            'margin'     = if ($Margin) { $Margin }
        }
        $Css = ConvertTo-LimitedCSS -ClassName $ClassName -Attributes $Attributes

        # $Script:HTMLSchema.CustomHeaderCSS.Add($Css)
        $Script:HTMLSchema.CustomHeaderCSS[$AnchorName] = $Css
        [string] $Class = "$ClassName overflowHidden"
    } else {
        [string] $Class = 'flexElement overflowHidden'
    }
    New-HTMLTag -Tag 'div' -Attributes @{ class = $Class } {
        if ($HTML) {
            Invoke-Command -ScriptBlock $HTML
        }
    }
}