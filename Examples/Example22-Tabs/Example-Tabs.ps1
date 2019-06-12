Import-Module .\PSWriteHTML.psd1 -Force

$Test = Get-Process | Select-Object -First 5

#$Test | Out-HtmlView

New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example-Tabs00.html -Show {
    New-HTMLTabOptions -SlimTabs -Transition -LinearGradient -SelectorColor Gold -SelectorColorTarget AliceBlue
    New-HTMLTab -Name 'Test 1' -IconBrands acquisitions-incorporated {

    }
    New-HTMLTab -Name 'Test 2' -IconRegular check-circle -IconColor LightSkyBlue {

    }
    New-HTMLTab -Name 'Test 3' -IconSolid code-branch -IconColor LimeGreen {

    }
    New-HTMLTab {

    }
    New-HTMLTab {

    }
    New-HTMLTab {

    }
    New-HTMLTab {

    }
}