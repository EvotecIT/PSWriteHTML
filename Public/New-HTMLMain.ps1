function New-HTMLMain {
    <#
    .SYNOPSIS
    Defines the body HTML content. By default this is not required, but can be useful when header and footer are used to explicitly define the main content.

    .DESCRIPTION
    Defines the body HTML content. By default this is not required, but can be useful when header and footer are used to explicitly define the main content.

    .PARAMETER HTMLContent
    Provides ability to specify one or more elements within HTML. Using New-HTMLMain without it, makes no larger sense, as the content will be empty.

    .PARAMETER BackgroundColor
    Define a background color of the body element. You can choose from 800 defined colors or provide your own hex color

    .PARAMETER Color
    Choose a color of the body element. You can choose from 800 defined colors or provide your own hex color

    .PARAMETER FontFamily
    Choose a FontFamily for the body content

    .PARAMETER FontSize
    Choose a FontSize for the body content

    .EXAMPLE
    New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example40-Body.html -Show {
        New-HTMLMain {
            New-HTMLTabStyle -SlimTabs `
                -BorderBottomStyleActive solid -BorderBottomColorActive LightSkyBlue -BackgroundColorActive none `
                -TextColorActive Black -Align left -BorderRadius 0px -RemoveShadow -TextColor Grey -TextTransform capitalize #-FontSize 10pt

            New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor Grey
            New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {
                New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
                    New-HTMLSection -HeaderText 'Default Section Style' {
                        New-HTMLTableStyle -Type Header -TextAlign right -TextColor Blue
                        New-HTMLTableStyle -Type Row -TextAlign left -TextColor Grey
                        New-HTMLTable -DataTable $Test1 {
                            New-HTMLTableHeader -Names 'ID', 'HandleCount'
                        } -Filtering #-HideFooter -FilteringLocation Both
                    } -CanCollapse
                }
            }
            New-HTMLTab -Name 'Next' {

            }
        } -BackgroundColor Yellow -Color Red -FontSize 12px #-FontFamily 'Arial'
    }
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
    [alias('Main')]
    [CmdletBinding()]
    param(
        [scriptblock] $HTMLContent,
        [string] $BackgroundColor,
        [string] $Color,
        [string] $FontFamily,
        [object] $FontSize
    )
    # gets current configuration for Main.CSS
    $CssConfiguration = Get-ConfigurationCss -Feature 'Main' -Type 'HeaderAlways'

    # Sets body style to new values
    $BodyStyle = @{
        'background-color' = ConvertFrom-Color -Color $BackgroundColor
        'color'            = ConvertFrom-Color -Color $Color
        'font-family'      = $FontFamily
        'font-size'        = ConvertFrom-Size -TextSize $FontSize
    }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name 'body' -Inject $BodyStyle
    # We set the same size for input as for body to keep them in sync.
    # You can still overwrite this values on tables or inputs if required
    $InputStyle = @{
        'font-size' = ConvertFrom-Size -TextSize $FontSize
    }
    Add-ConfigurationCSS -CSS $CssConfiguration -Name 'input' -Inject $InputStyle

    #$TableStyle = @{
    #'font-size' = ConvertFrom-Size -TextSize $FontSize
    #}
    #Add-ConfigurationCSS -CSS $CssConfiguration -Name 'table' -Inject $TableStyle

    # if HTML Content is given send it further down
    if ($HTMLContent) {
        # push this to New-HTML
        [PSCustomObject] @{
            Type   = 'Main'
            Output = & $HTMLContent
        }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLMain -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLMain -ParameterName Color -ScriptBlock $Script:ScriptBlockColors