function EmailLayout {
    <#
    .SYNOPSIS
    Defines the layout structure for an email content.

    .DESCRIPTION
    Generates an email table layout containing the supplied columns. The layout uses the available width by default. An explicit Width is written as inline CSS and, for pixels or percentages, a matching HTML width attribute.

    .PARAMETER Layout
    Specifies the ScriptBlock containing the layout structure for the email content.

    .PARAMETER Width
    Sets the outer layout width. Numbers and pixel strings such as 800 or '800px' use pixels; percentages such as '75%' remain relative. Other CSS lengths are emitted only as CSS. Omit Width to retain the full-width layout. Email-client CSS support varies.

    .EXAMPLE
    $EmailLayout = {
        'Content goes here'
    }
    EmailLayout -Layout $EmailLayout
    Generates an HTML table layout for the email content with the specified content.

    .EXAMPLE
    EmailBody {
        EmailLayout -Width 800 {
            EmailLayoutColumn -Width 200 { EmailText -Text 'Summary' }
            EmailLayoutColumn -Width 600 { EmailText -Text 'Details' }
        }
    }
    Generates an 800-pixel email layout with two preferred column widths.

    .OUTPUTS
    String containing the layout table and supplied content.

    #>
    [cmdletBinding()]
    param(
        [Parameter(Position = 0)][ScriptBlock] $Layout,
        [string] $Width
    )

    Enable-HTMLFeature -Feature EmailLayout

    if ($Layout) {
        $Output = & $Layout

        if ($Output) {
            $Attributes = @{ class = 'layoutTable'; width = '100%' }
            if ($Width) {
                $LayoutWidth = ConvertTo-EmailLayoutWidth -Width $Width
                $Attributes.width = $LayoutWidth.Html
                $Attributes.style = @{
                    width       = $LayoutWidth.Css
                    'max-width' = '100%'
                }
            }
            New-HTMLTag -Tag 'table' -Attributes $Attributes {
                New-HTMLTag -Tag 'tbody' -Attributes @{ class = 'layoutTableBody' } {
                    New-HTMLTag -Tag 'tr' -Attributes @{ class = 'layoutTableRow' } {
                        $Output
                    }
                }
            }
        }
    }
}
