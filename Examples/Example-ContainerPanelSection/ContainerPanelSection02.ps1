Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'Title' -Online -FilePath $PSScriptRoot\ContainerPanelSection02.html {
    New-HTMLSection -Invisible {
        New-HTMLPanel -Invisible {
            New-HTMLToast -TextHeader 'Maintenance' -Text "We've planned maintenance on 24th of January 2020. It will last 30 hours." -IconRegular address-card
        }
        New-HTMLPanel -Invisible {
            New-HTMLToast -TextHeader 'Maintenance' -Text "We've planned maintenance on 24th of January 2020. It will last 30 hours." -IconColor DarkGrey -BarColorLeft ForestGreen -TextColor Gainsboro -IconBrands 500px
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLTable -DataTable $Processes -HideFooter
    }
    New-HTMLSection -Invisible {
        New-HTMLPanel -Invisible
        New-HTMLPanel -Invisible {
            New-HTMLText -TextBlock {
                "Following table shows list of all group policies and their status in AD and SYSVOL. Due to different reasons it's "
                "possible that "
            } -FontSize 10pt
            New-HTMLList -Type Unordered {
                New-HTMLListItem -Text 'Group Policies on SYSVOL, but no details in AD: ', $NotAvailableInAD.Count -FontWeight normal, bold
                New-HTMLListItem -Text 'Group Policies in AD, but no content on SYSVOL: ', $NotAvailableOnSysvol.Count -FontWeight normal, bold
                New-HTMLListItem -Text "Group Policies which couldn't be assed due to permissions issue: ", $NotAvailablePermissionIssue.Count -FontWeight normal, bold
            } -FontSize 10pt
            New-HTMLText -Text "Follow the steps below table to get Active Directory Group Policies in healthy state." -FontSize 10pt
        }
        New-HTMLPanel -Invisible
    }
    New-HTMLSection -Invisible {
        New-HTMLPanel -Invisible
        New-HTMLPanel -Invisible {
            New-HTMLToast -TextHeader 'Maintenance' -Text "We've planned maintenance on 24th of January 2020. It will last 30 hours." -IconRegular address-card
        }
        New-HTMLPanel -Invisible {
            New-HTMLToast -TextHeader 'Maintenance' -Text "We've planned maintenance on 24th of January 2020. It will last 30 hours." -IconColor DarkGrey -BarColorLeft ForestGreen -TextColor Gainsboro -IconBrands 500px
        }
        New-HTMLPanel -Invisible
    }
    New-HTMLSection -Invisible {
        New-HTMLPanel -Invisible
        New-HTMLPanel -Invisible
        New-HTMLPanel -Invisible {
            New-HTMLToast -TextHeader 'Maintenance' -Text "We've planned maintenance on 24th of January 2020. It will last 30 hours." -IconColor DarkGrey -BarColorLeft ForestGreen -TextColor Gainsboro -IconBrands 500px
        }
        New-HTMLPanel -Invisible
    }
} -ShowHTML