function New-HTMLHeader {
    <#
    .SYNOPSIS
    Building block for use within New-HTML. Provides ability to define header.

    .DESCRIPTION
    Building block for use within New-HTML. Provides ability to define header. This allows to putting HTML elements above standard tabs such as images or texts.

    .PARAMETER HTMLContent
    Define one or more HTML elements

    .EXAMPLE
    New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example34_01.html" {
        New-HTMLHeader {
            New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
        }
        New-HTMLMain {
            New-HTMLTab -TabName 'Test' {
                New-HTMLSection -HeaderText '0 section' {
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                    }
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                    }
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter -Simplify
                    }
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                    }
                }
            }
            New-HTMLTab -TabName 'Test5' {
                New-HTMLSection -HeaderText '1 section' {
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                    }
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                        # New-HTMLTable -DataTable $Processes -HideFooter
                    }
                    New-HTMLPanel {
                        New-HTMLTable -DataTable $Processes -HideFooter
                    }
                }
            }
        }
        New-HTMLFooter {
            New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
        }
    } -Online -ShowHTML

    .NOTES
    General notes
    #>
    [alias('Header')]
    [CmdletBinding()]
    param(
        [scriptblock] $HTMLContent
    )

    if ($HTMLContent) {
        [PSCustomObject] @{
            Type   = 'Header'
            Output = & $HTMLContent
        }
    }
}