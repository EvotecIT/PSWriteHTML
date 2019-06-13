Import-Module .\PSWriteHTML.psd1 -Force

$Test = Get-Process | Select-Object -First 5

#$Test | Out-HtmlView

New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example22.html -Show {
    #New-HTMLTabOptions -SlimTabs -Transition -LinearGradient -SelectorColor Gold -SelectorColorTarget AliceBlue
    New-HTMLTab -IconBrands aws -Name 'Test 1' -IconColor DarkGoldenrod {
        New-HTMLTable -DataTable $Test -PagingOptions @(50, 100, 150, 200) {
            New-HTMLTableButtonPDF -PageSize TABLOID -Orientation portrait
            New-HTMLTableButtonExcel
            New-HTMLTableCondition -Name 'HandleCount' -Type number -Operator gt -Value 300 -BackgroundColor Yellow
            New-HTMLTableCondition -Name 'ID' -Type number -Operator gt -Value 16000 -BackgroundColor Green
            New-HTMLTableCondition -Name 'Name' -Type string -Operator eq -Value 'browser_broker' -BackgroundColor Gold -Row
        }
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