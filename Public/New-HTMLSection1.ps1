function New-HTMLSection1 {
    param(
        [ScriptBlock] $Content,
        [string] $TextHeader
    )

    $ID = "AS-$(Get-RandomStringName -Size 8 -LettersOnly)"

    New-HTMLTag -Tag 'div' -Attributes @{ id = 'aspect-content' } {
        New-HTMlTag -Tag 'div' -Attributes @{ class = 'aspect-tab' } {
            # Section content


            New-HTMLTag -Tag 'input' -Attributes @{ id = $ID; type = "checkbox"; class = "aspect-input"; name = "aspect" } -SelfClosing
            New-HTMLTag -Tag 'label' -Attributes @{ for = $ID; class = "aspect-label" }
            New-HTMLTag -Tag 'div' -Attributes @{  class = "aspect-content" } {
                New-HTMLTag -Tag 'div' -Attributes @{  class = "aspect-info" } {
                    New-HTMLTag -Tag 'div' -Attributes @{ class = 'aspect-name' } { $TextHeader }
                }
                New-HTMLTag -Tag 'div' -Attributes @{  class = "aspect-stat" } {
                    New-HTMLSectionHeader -Text '14' -Type positive-count
                    New-HTMLSectionHeader -Text '12' -Type neutral-count
                }
            }
            # Under the section content
            New-HTMLTag -Tag 'div' -Attributes @{ class = "aspect-tab-content" } {
                New-HTMLTag -Tag 'div' -Attributes @{ class = "sentiment-wrapper" } {
                    if ($null -ne $Content) {
                        & $Content
                    }

                }
            }
        }
    }
}

function New-HTMLSubSection {
    param(
        [ScriptBlock] $Content,
        [string] $Text,
        [string[]] $TextHeader,
        [ValidateSet('positive', 'negative', 'neutral')][string] $Type = 'positive'
    )

    New-HTMLTag -Tag 'div' -Attributes @{ class = 'defaultPanel defaultCar' } {
        New-HTMLTag -Tag 'div' {
            New-HTMLTag -Tag 'div' -Attributes @{ class = "$Type-count opinion-header" } {
                New-HTMLText -Text $TextHeader
            }
            New-HTMLTag -Tag 'div' {
                if ($null -ne $Content) {
                    & $Content
                }
                #New-HTMLText -Text $Text
            }
        }
    }
}


function New-HTMLSectionHeader {
    param(
        [ValidateSet('all-opinions', 'positive-count', 'neutral-count', 'negative-count')][string] $Type,
        [string] $Text
    )
    New-HTMLTag -Tag 'span' -Attributes @{ class = $Type } {
        $Text
    }

}