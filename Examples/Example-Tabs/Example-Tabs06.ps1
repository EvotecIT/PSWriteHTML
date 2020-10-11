Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

$Test1 = Get-Process | Select-Object -First 2

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example-Tabs06.html -Show {
    New-HTMLTabStyle -SlimTabs `
        -BorderBottomStyleActive solid -BorderBottomColorActive LightSkyBlue -BackgroundColorActive none `
        -TextColorActive Black -Align left -BorderRadius 0px -RemoveShadow -TextColor Grey -TextTransform capitalize -Wrap nowrap

    New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {
        New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
            New-HTMLTable -DataTable $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount'
            }
        }
        New-HTMLTab -Name '2nd Level Tab - Test 4/2' {
            New-HTMLTable -DataTable $Test1 -HideFooter {
                New-HTMLTableHeader -Names 'ID', 'HandleCount' -Title 'Test'
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
    New-HTMLTab -Name 'Long title - actually very very long' {

    }
    New-HTMLTab -Name 'Long title - actually very very long' {

    }
    New-HTMLTab -Name 'Long title - actually very very long' {

    }
    New-HTMLTab -Name 'Long title - actually very very long' {

    }
    New-HTMLTab -Name 'Long title - actually very very long' {

    }
    New-HTMLTab -Name 'Long title - actually very very long' {

    }
    New-HTMLTab -Name 'Long title - actually very very long' {

    }
    New-HTMLTab -Name 'Long title - actually very very long' {

    }
}