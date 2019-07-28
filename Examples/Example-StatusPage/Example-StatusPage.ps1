Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Services Status' -UseCssLinks:$true -UseJavaScriptLinks:$true {
    New-HTMLPanel -Invisible {
        New-HTMLToast -Icon Information -Color Blue -TextHeader 'Information' -Text 'Everything is running smoothly!'
    }

    New-HTMLHeading -Heading h1 -HeadingText 'Current Status' -Type 'central'

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

    New-HTMLHeading -Heading h1 -HeadingText 'Scheduled Maintenance' -Type 'central'

    New-HTMLPanel -Invisible {
        New-HTMLToast -Icon Information -Color Orange -TextHeader 'Maintenance' -Text "We've planned maintenance on 24th of January 2020. It will last 30 hours."
    }


    New-HTMLHeading -Heading h1 -HeadingText 'Incidents per day' -Type 'central'

    New-HTMLPanel -Invisible {
        $Data = foreach ($Element in 30..0) {
            Get-Random -Minimum 0 -Maximum 5
        }
        $DataCategories = foreach ($Element in 30..0) {
            (Get-Date).AddDays(-$Element).ToShortDateString()
        }

        New-HTMLChart -Title 'Incidents per day' -TitleAlignment left -Positioning central {
            New-ChartCategory -Name $DataCategories
            New-ChartLine -Name 'Incidents' -Value $Data
        }
    }


    New-HTMLHeading -Heading h1 -HeadingText 'Past Incidents' -Type 'central'

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
} -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example-StatusPage\Example-StatusPage.html' -Show