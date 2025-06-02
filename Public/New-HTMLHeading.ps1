function New-HTMLHeading {
    <#
    .SYNOPSIS
    Creates a new HTML heading with customizable options.

    .DESCRIPTION
    This function generates an HTML heading based on the provided parameters such as heading level, text content, underline option, and color.

    .PARAMETER Heading
    Specifies the level of the heading. Valid values are 'h1', 'h2', 'h3', 'h4', 'h5', 'h6'.

    .PARAMETER HeadingText
    The text content to display within the heading.

    .PARAMETER Underline
    Indicates whether the heading should be underlined.

    .PARAMETER Color
    The color of the heading text.

    .EXAMPLE
    New-HTMLHeading -Heading 'h1' -HeadingText 'Main Title' -Underline -Color 'blue'
    Generates an HTML heading of level h1 with the text 'Main Title', underlined, and in blue color.

    .EXAMPLE
    New-HTMLHeading -Heading 'h3' -HeadingText 'Sub Title' -Color 'green'
    Generates an HTML heading of level h3 with the text 'Sub Title' in green color.
    #>
    [CmdletBinding()]
    param (
        [validateset('h1', 'h2', 'h3', 'h4', 'h5', 'h6')][string] $Heading,
        [Alias('Text')][string] $HeadingText,
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