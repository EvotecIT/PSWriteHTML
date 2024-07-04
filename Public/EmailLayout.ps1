function EmailLayout {
    <#
    .SYNOPSIS
    Defines the layout structure for an email content.

    .DESCRIPTION
    This function defines the layout structure for an email content using a ScriptBlock. It generates an HTML table layout for the email content.

    .PARAMETER Layout
    Specifies the ScriptBlock containing the layout structure for the email content.

    .EXAMPLE
    $EmailLayout = {
        'Content goes here'
    }
    EmailLayout -Layout $EmailLayout
    Generates an HTML table layout for the email content with the specified content.

    #>
    [cmdletBinding()]
    param(
        [ScriptBlock] $Layout
    )

    Enable-HTMLFeature -Feature EmailLayout

    if ($Layout) {
        $Output = & $Layout

        if ($Output) {
            New-HTMLTag -Tag 'table' -Attributes @{class = 'layoutTable'; width = '100%' } {
                New-HTMLTag -Tag 'tbody' -Attributes @{ class = 'layoutTableBody' } {
                    New-HTMLTag -Tag 'tr' -Attributes @{ class = 'layoutTableRow' } {
                        $Output
                    }
                }
            }
        }
    }
}