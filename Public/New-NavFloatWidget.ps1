function New-NavFloatWidget {
    <#
    .SYNOPSIS
    Creates a new navigation float widget with customizable options for different types of widgets.

    .DESCRIPTION
    The New-NavFloatWidget function creates a new navigation float widget with various customizable options such as Dots, SelectBox, List, Toggle, and Text. Each type of widget has specific styling and functionality.

    .PARAMETER Items
    Specifies the script block defining the items to be included in the widget.

    .PARAMETER Type
    Specifies the type of the widget. Valid values are: Dots, SelectBox, List, Toggle, Text.

    .PARAMETER Title
    Specifies the title of the widget.

    .EXAMPLE
    New-NavFloatWidget -Items { New-NavFloatWidgetItem -Name "Home" -Href "/home" -IconBrands "fab fa-home" -IconColor "blue" } -Type "Dots"
    Creates a new navigation float widget with Dots type, displaying a single item named "Home" with a home icon in blue color.

    .EXAMPLE
    New-NavFloatWidget -Items { New-NavFloatWidgetItem -Name "About" -Href "/about" -IconRegular "far fa-address-card" -IconColor "green" } -Type "List" -Title "About Us"
    Creates a new navigation float widget with List type, displaying a single item named "About" with an address card icon in green color and a title "About Us".

    .EXAMPLE
    New-NavFloatWidget -Items { New-NavFloatWidgetItem -Name "Toggle 1" -Href "/toggle1" } -Type "Toggle" -Title "Toggle Items"
    Creates a new navigation float widget with Toggle type, displaying a single item named "Toggle 1" linking to "/toggle1" and a title "Toggle Items".
    #>
    [cmdletBinding()]
    param(
        [scriptblock] $Items,
        [ValidateSet('Dots', 'SelectBox', 'List', 'Toggle', 'Text')][string] $Type,
        [string] $Title
    )
    if ($Items) {
        if ($Type -eq 'Dots') {
            $Script:GlobalSchema['NavFloatWidget'] = 'Dots'
            New-HTMLTag -Tag 'menu' -Attributes @{ class = 'top-links' } {
                & $Items
            }
            $Script:GlobalSchema['NavFloatWidget'] = $null
        } elseif ($Type -eq 'SelectBox') {
            $Script:GlobalSchema['NavFloatWidget'] = 'SelectBox'
            if ($Title) { New-HTMLTag -Tag 'h3' { $Title } }
            New-HTMLTag -Tag 'select' -Attributes @{ class = 'penal-select' } {
                & $Items
            }
            $Script:GlobalSchema['NavFloatWidget'] = $null
        } elseif ($Type -eq 'List') {
            $Script:GlobalSchema['NavFloatWidget'] = 'list'
            #New-HTMLTag -Tag 'div' -Attributes @{ class = "penal-widget" } {
            if ($Title) { New-HTMLTag -Tag 'h3' { $Title } }
            New-HTMLTag -Tag 'ul' -Attributes @{ class = "penal-list" } {
                & $Items
            }
            #}
            $Script:GlobalSchema['NavFloatWidget'] = $null
        } elseif ($Type -eq 'Toggle') {
            $Script:GlobalSchema['NavFloatWidget'] = 'toggle'
            if ($Title) { New-HTMLTag -Tag 'h3' { $Title } }
            New-HTMLTag -Tag 'div' -Attributes @{ class = "toggle-switch" } {
                New-HTMLTag -Tag 'ul' -Attributes @{ class = "toggle-buttons" } {
                    & $Items
                }
            }
            $Script:GlobalSchema['NavFloatWidget'] = $null
        } elseif ($Type -eq 'Text') {
            $Script:GlobalSchema['NavFloatWidget'] = 'about'
            if ($Title) { New-HTMLTag -Tag 'h3' { $Title } }
            New-HTMLTag -Tag 'div' -Attributes @{ class = "penal-widget about" } {
                #if ($Title) { New-HTMLTag -Tag 'h3' { $Title } }
                & $Items
            }
            $Script:GlobalSchema['NavFloatWidget'] = $null
        }
    }
}