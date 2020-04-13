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
                    New-HTMLStatusItem -ServiceName 'Active Directory' -ServiceStatus 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -ServiceName 'Github' -ServiceStatus 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -ServiceName 'Hyper-V' -ServiceStatus 'Non-functional' -Icon Dead -Percentage '0%'
                    New-HTMLStatusItem -ServiceName 'Active Directory' -ServiceStatus 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -ServiceName 'Azure' -ServiceStatus 'Working on it' -Icon Bad -Percentage '70%'
                    New-HTMLStatusItem -ServiceName 'Twitter' -ServiceStatus 'Who knows?!' -Icon Bad -Percentage '30%'
                }
            }

            New-HTMLHeading -Heading h1 -HeadingText 'Current Status Providers'

            New-HTMLPanel -Invisible {
                New-HTMLStatus {
                    New-HTMLStatusItem -ServiceName 'Active Directory' -ServiceStatus 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -ServiceName 'Github' -ServiceStatus 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -ServiceName 'Hyper-V' -ServiceStatus 'Non-functional' -Icon Dead -Percentage '0%'
                    New-HTMLStatusItem -ServiceName 'Active Directory' -ServiceStatus 'Operational' -Icon Good -Percentage '100%'
                    New-HTMLStatusItem -ServiceName 'Azure' -ServiceStatus 'Working on it' -Icon Bad -Percentage '70%'
                    New-HTMLStatusItem -ServiceName 'Twitter' -ServiceStatus 'Who knows?!' -Icon Bad -Percentage '30%'
                }
            }

            New-HTMLHeading -Heading h1 -HeadingText 'Scheduled Maintenance'

            New-HTMLPanel -Invisible {
                New-HTMLToast -TextHeader 'Maintenance' -Text "We've planned maintenance on 24th of January 2020. It will last 30 hours." -BarColorLeft OrangeRed -IconSolid info-circle -IconColor OrangeRed
            }


            New-HTMLHeading -Heading h1 -HeadingText 'Incidents per day'

            New-HTMLPanel -Invisible {


                $Data = foreach ($Element in 30..0) {
                    Get-Random -Minimum 0 -Maximum 5
                }
                $DataName = "Incidents"
                $DataCategories = foreach ($Element in 30..0) {
                    (Get-Date).AddDays(-$Element).ToShortDateString()
                }
                New-HTMLChart -Title 'Incidents per day' -TitleAlignment left {
                    New-ChartCategory -Name $DataCategories
                    New-ChartLine -Name $DataName -Value $Data
                }
            }

            New-HTMLHeading -Heading h1 -HeadingText 'Past Incidents'

            New-HTMLPanel -Invisible {
                New-HTMLTimeline {
                    New-HTMLTimelineItem -HeadingText 'Azure AD is down' -Text "We have huge problems" -Date (Get-Date).AddDays(-1)
                    New-HTMLTimelineItem -HeadingText 'Azure AD ...' -Text "We have huge problems" -Date (Get-Date).AddDays(-2)
                    New-HTMLTimelineItem -HeadingText 'AD just died' -Text "We have huge problems" -Date (Get-Date).AddDays(-3)
                    New-HTMLTimelineItem -HeadingText 'Twitter' -Text "We're very soorrry! It just won't work!" -Date (Get-Date).AddDays(-4)
                    New-HTMLTimelineItem -HeadingText 'Twitter' -Text "We're very soorrry! It just won't work!" -Date (Get-Date).AddDays(-4)
                    New-HTMLTimelineItem -HeadingText 'Twitter' -Text "We're very soorrry! It just won't work!" -Date (Get-Date).AddDays(-4)
                    New-HTMLTimelineItem -HeadingText 'Twitter' -Text "We're very soorrry! It just won't work!" -Date (Get-Date).AddDays(-5)
                    New-HTMLTimelineItem -HeadingText 'Twitter' -Text "We're very soorrry! It just won't work!" -Date (Get-Date).AddDays(-6)
                    New-HTMLTimelineItem -HeadingText 'Twitter' -Text "We're very soorrry! It just won't work!" -Date (Get-Date).AddDays(-7)
                }
            }
        }
    }
} -FilePath $PSScriptRoot\StatusPage05.html -ShowHTML