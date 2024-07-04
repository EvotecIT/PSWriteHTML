function ConvertTo-CascadingStyleSheets {
    <#
    .SYNOPSIS
    Converts a hashtable of CSS properties into Cascading Style Sheets (CSS) format.

    .DESCRIPTION
    The ConvertTo-CascadingStyleSheets function takes a hashtable of CSS properties and converts them into a CSS stylesheet format. It organizes the properties into selectors and declarations, ready to be used in styling HTML elements.

    .PARAMETER Css
    Specifies the hashtable of CSS properties to be converted.

    .PARAMETER Name
    Specifies the name of the CSS selector to be used in the stylesheet.

    .PARAMETER Comment
    Specifies an optional comment to be included in the CSS stylesheet.

    .PARAMETER WithTags
    Indicates whether to include CSS style tags around the generated CSS content. Default is false.

    .EXAMPLE
    $CssProperties = @{
        'color' = 'blue'
        'font-size' = '16px'
        'font-family' = 'Arial'
    }

    ConvertTo-CascadingStyleSheets -Css $CssProperties -Name '.myClass' -Comment 'Custom styles for myClass'

    Converts the hashtable of CSS properties into a CSS stylesheet with the selector '.myClass' and a custom comment.

    .EXAMPLE
    $CssProperties = @{
        'background-color' = 'lightblue'
        'border' = @{
            'style' = 'solid'
            'width' = '1px'
            'color' = 'black'
        }
    }

    ConvertTo-CascadingStyleSheets -Css $CssProperties -Name '#myDiv' -WithTags

    Converts the CSS properties into a CSS stylesheet with the selector '#myDiv' and includes CSS style tags.

    #>
    [alias('ConvertTo-CSS')]
    [cmdletBinding()]
    param(
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)][System.Collections.IDictionary] $Css,
        [string] $Name,
        [string] $Comment,
        [switch] $WithTags
    )
    Process {
        if ($Css) {
            Remove-EmptyValue -Hashtable $Css -Recursive
        }
        if ($Css.Count -eq 0) {
            # Means empty value after we removed all empty values
            return
        }

        $Output = foreach ($Key in $Css.Keys) {

            if ($Css[$Key] -is [System.Collections.IDictionary]) {
                "$Key {"
                foreach ($_ in $Css[$Key].Keys) {
                    if ($null -ne $Css[$Key][$_]) {
                        # we remove empty chars because sometimes there can be multiple lines similar to each other

                        if ($Css[$Key][$_] -is [System.Collections.IDictionary]) {
                            "$_ {"
                            $Deep = ConvertTo-CascadingStyleSheets -Css $Css[$Key][$_]
                            $Deep
                            "}"
                        } else {
                            $Property = $_.Replace(' ', '')
                            "    $Property`: $($Css[$Key][$_]);"
                        }
                    } else {
                        Write-Verbose ""
                    }
                }
                "}"
                ''
            } else {
                $Property = $Key.Replace(' ', '')
                "    $Property`: $($Css[$Key]);"
            }

        }
        if ($WithTags) {
            New-HTMLTag -Tag 'style' -Attributes @{ type = 'text/css'; comment = $Comment } {
                if ($Name) {
                    "$Name {"
                    if ($Comment) { "/* $($Comment)-start */" }
                    $Output
                    if ($Comment) { "/* $($Comment)-end */" }
                    "}"
                } else {
                    if ($Comment) { "/* $($Comment)-start */" }
                    $Output
                    if ($Comment) { "/* $($Comment)-end */" }
                }
            }
        } else {
            if ($Name) {
                "$Name {"
                if ($Comment) { "/* $($Comment)-start */" }
                $Output
                if ($Comment) { "/* $($Comment)-end */" }
                "}"
            } else {
                if ($Comment) { "/* $($Comment)-start */" }
                $Output
                if ($Comment) { "/* $($Comment)-end */" }
            }
        }
    }
}
<#

$Test = @{
    '@media all and (-ms-high-contrast:active)' = @{
        '.defaultSection' = @{
            'display'        = 'flex'
            'flex-direction' = 'column'
        }
    }
}

$Test2 = @{
    '.defaultSection'                           = [ordered] @{
        #'display'        = 'flex';
        #'flex-direction' = 'column'
        #'display'        = 'flex' # added to allow diagram to resize properly
        #'flex-direction' = 'default' # added to allow diagram to resize properly
        'border'         = '1px solid #bbbbbb'
        'padding-bottom' = '0px'
        'margin'         = '5px'
        'width'          = 'calc(100% - 10px)'
        'box-shadow'     = '0 4px 8px 0 rgba(0, 0, 0, 0.2)'
        'transition'     = '0.3s'
        'border-radius'  = '5px'
    }
}

ConvertTo-CascadingStyleSheets -Css $Test
#>