Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Services Status' -Online {

    New-HTMLSection -Invisible {
        New-HTMLContainer -Width '900px' -Margin 'auto' {
            New-HTMLPanel -Invisible {
                New-HTMLToast -TextHeader 'Information' -Text 'Everything is running smoothly!' -BarColorLeft Blue -IconSolid info-circle -IconColor Blue
            }

            New-HTMLHeading -Heading h1 -HeadingText 'Current Status Systems'

            New-HTMLPanel -Invisible {
                New-HTMLStatus {
                    New-HTMLStatusItem -Name 'Active Directory' -Status 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -Name 'Github' -Status 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -Name 'Hyper-V' -Status 'Non-functional' -Icon Dead -Percentage '0%'
                    New-HTMLStatusItem -Name 'Active Directory' -Status 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -Name 'Azure' -Status 'Working on it' -Icon Bad -Percentage '70%'
                    New-HTMLStatusItem -Name 'Twitter' -Status 'Who knows?!' -Icon Bad -Percentage '30%'
                    New-HTMLStatusItem -Name 'Active Directory' -Status 'operational' -IconRegular address-book
                }
            }

            New-HTMLHeading -Heading h1 -HeadingText 'Current Status Providers'

            New-HTMLPanel -Invisible {
                New-HTMLStatus {
                    New-HTMLStatusItem -Name 'Active Directory' -Status 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -Name 'Github' -Status 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -Name 'Hyper-V' -Status 'Non-functional' -Icon Dead -Percentage '0%'
                    New-HTMLStatusItem -Name 'Active Directory' -Status 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -Name 'Azure' -Status 'Working on it' -Icon Bad -Percentage '70%'
                    New-HTMLStatusItem -Name 'Twitter' -Status 'Who knows?!' -Icon Bad -Percentage '30%'
                }
            }
        }
    }
} -FilePath $PSScriptRoot\StatusPage07.html -ShowHTML