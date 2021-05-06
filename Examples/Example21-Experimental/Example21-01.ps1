Import-Module .\PSWriteHTML.psd1 -Force

$Test = Get-Process | Select-Object -First 5

#$Test | Out-HtmlView

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example21-01.html -Show {
    New-HTMLTabStyle -SlimTabs -Transition -LinearGradient -SelectorColor Gold -SelectorColorTarget AliceBlue -BorderRadius 0px
    New-HTMLTab -IconBrands aws -Name 'Test 1' -IconColor DarkGoldenrod {
        New-HTMLTable -DataTable $Test -PagingOptions @(50, 100, 150, 200) {
            New-HTMLTableButtonPDF -PageSize TABLOID -Orientation portrait
            New-HTMLTableButtonExcel -Title 'Custom'
        } -Title 'Test'
    }
    New-HTMLTab -Name 'Test 2' -IconSolid address-card {

    }
    New-HTMLTab -Name 'Test 3' -IconSolid camera {

    }
    New-HTMLTab -Name 'Test 4' -IconBrands microsoft {

    }
    New-HTMLTab -Name 'Test 5' -IconRegular calendar {

    }
    New-HTMLTab -Name 'Test 6' -IconSolid yin-yang {

    }
    New-HTMLTab {

    }
}