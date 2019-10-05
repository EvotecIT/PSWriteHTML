Import-Module .\PSWriteHTML.psd1 -Force

$Test = Get-Process | Select-Object -First 2 -Property Name, Id,PriorityClass, HandleCount, WorkingSet

#$Test | Out-HtmlView

New-HTML -TitleText 'My title' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example-Tabs00.html -Show {
    New-HTMLTabOptions -SlimTabs -Transition -LinearGradient -SelectorColor Gold -SelectorColorTarget AliceBlue
    New-HTMLTab -Name 'Test 1' -IconBrands acquisitions-incorporated {
        New-HTMLTable -DataTable $Test

        #New-HTMLTable -DataTable $Test
    }
    New-HTMLTab -Name 'Test 2' -IconRegular check-circle -IconColor LightSkyBlue {

    }
    New-HTMLTab -Name 'Test 3' -IconSolid code-branch -IconColor LimeGreen {

    }
    New-HTMLTab -IconSolid bezier-curve {

    }
    New-HTMLTab -IconSolid copy {

    }
    New-HTMLTab -IconBrands asymmetrik {

    }
    New-HTMLTab -IconRegular kiss-beam {

    }
}