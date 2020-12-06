Import-Module .\PSWriteHTML.psd1 -Force


New-HTML -TitleText 'Services Status' -Online:$false -FilePath $PSScriptRoot\StatusPage01.html {
    New-HTMLSection -Invisible {
        New-HTMLPanel -Invisible {
            New-HTMLToast -TextHeader 'Information' -Text 'Everything is running smoothly!' -BarColorLeft Blue -IconSolid info-circle -IconColor Blue
            New-HTMLToast -TextHeader 'Information' -Text 'Everything is running smoothly!' -BarColorLeft Orange -IconSolid tablet  -IconColor Orange
            New-HTMLToast -TextHeader 'Information' -Text 'Everything is running smoothly!' -BarColorLeft Blue -IconSolid info-circle -IconColor Blue
        }
        New-HTMLPanel -Invisible {
            New-HTMLTimeline {
                New-HTMLTimelineItem -HeadingText 'Azure AD is down' -Text "We have huge problems" -Date (Get-Date).AddDays(-1)
                New-HTMLTimelineItem -HeadingText 'Azure AD ...' -Text "We have huge problems" -Date (Get-Date).AddDays(-2)
                New-HTMLTimelineItem -HeadingText 'AD just died' -Text "We have huge problems" -Date (Get-Date).AddDays(-3) -Color Red
            }
        }
    }
} -ShowHTML