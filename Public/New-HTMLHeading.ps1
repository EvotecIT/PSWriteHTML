Function New-HTMLHeading {
    [CmdletBinding()]
    Param (
        [validateset('h1', 'h2', 'h3', 'h4', 'h5', 'h6')][string] $Heading,
        [string] $HeadingText,
        [switch] $Underline,
        [string] $Color
    )
    $Script:HTMLSchema.Features.DefaultHeadings = $true
    if ($null -ne $Color) {
        $RGBcolor = ConvertFrom-Color -Color $Color
        $Attributes = @{
            style = @{ color = $RGBcolor }
        }
    } else {
        $Attributes = @{ }
    }
    if ($Underline) {
        $Attributes.Class = "$($Attributes.Class) underline"
    }
    New-HTMLTag -Tag $Heading -Attributes $Attributes {
        $HeadingText
    }
}
Register-ArgumentCompleter -CommandName New-HTMLHeading -ParameterName Color -ScriptBlock $Script:ScriptBlockColors