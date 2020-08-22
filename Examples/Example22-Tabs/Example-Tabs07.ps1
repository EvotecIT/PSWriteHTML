Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-Tabs07.html -Show {
    #New-HTMLTabStyle -SlimTabs         -BorderBottomStyleActive solid -BorderBottomColorActive LightSkyBlue -BackgroundColorActive none         -TextColorActive Black -Align left -BorderRadius 0px -RemoveShadow -TextColor Grey -TextTransform capitalize
    #New-HTMLTabStyle -Wrap wrap-reverse -Direction row-reverse
    New-HTMLTabStyle -RowElements 4
    New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            New-HTMLSection {

            }
            #New-HTMLTable -DataTable $Test1 -HideFooter {
            #    New-HTMLTableHeader -Names 'ID', 'HandleCount'
            #}
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/2' {
            #New-HTMLTable -DataTable $Test1 -HideFooter {
            #    New-HTMLTableHeader -Names 'ID', 'HandleCount' -Title 'Test'
            #}
            New-HTMLSection {

            }
        }
    }
    New-HTMLTab -Name 'First Level Tab - Test 4' -IconSolid bezier-curve {

    }
    New-HTMLTab -Name 'First Level Tab - Test 4' -IconSolid bezier-curve {

    }
    New-HTMLTab {

    }
    New-HTMLTab {

    }
    New-HTMLTab {

    }
    New-HTMLTab {

    }
    New-HTMLTab {

    }
    New-HTMLTab {

    }
    New-HTMLTab {

    }
    New-HTMLTab {

    }
    New-HTMLTab -Name 'ThisIsVeryLongTitleButWithoutSpacesWhichMayBeProblematic' {

    }
    New-HTMLTab -Name 'ThisIsVeryLongTitleButWithoutSpacesWhichMayBeProblematic' {

    }
    New-HTMLTab -Name 'ThisIsVeryLongTitleButWithoutSpacesWhichMayBeProblematic' {

    }
    New-HTMLTab -Name 'ThisIsVeryLongTitleButWithoutSpacesWhichMayBeProblematic' {

    }
    New-HTMLTab -Name 'ThisIsVeryLongTitleButWithoutSpacesWhichMayBeProblematic' {

    }
    New-HTMLTab -Name 'ThisIsVeryLongTitleButWithoutSpacesWhichMayBeProblematic' {

    }
    New-HTMLTab -Name 'ThisIsVeryLongTitleButWithoutSpacesWhichMayBeProblematic' {

    }
    New-HTMLTab -Name 'ThisIsVeryLongTitleButWithoutSpacesWhichMayBeProblematic' {

    }
}