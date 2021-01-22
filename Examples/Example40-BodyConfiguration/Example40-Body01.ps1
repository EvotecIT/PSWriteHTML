Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

$Test1 = Get-Process | Select-Object -First 2 -Property Id, HandleCount, Name, FileVersion, Path

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