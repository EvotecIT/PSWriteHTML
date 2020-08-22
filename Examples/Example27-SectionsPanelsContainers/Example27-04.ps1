Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

$Test1 = Get-Process | Select-Object -First 2 -Property Name, Id, PriorityClass

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example27-04.html -Show {
    $SectionStyle1 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -Rotate 180deg -RequestConfiguration
    #$SectionStyle2 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -TextOrientation upright -RequestConfiguration -AlignContent flex-end -Align flex-end
    #$SectionStyle3 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -RequestConfiguration -BackgroundColorContent Yellow
    #$SectionStyle4 = New-HTMLSectionStyle -DirectionContent row -WrapContent wrap -RequestConfiguration -BorderRadius 0px
    New-HTMLSection -HeaderText 'Default Section Style' {
        New-HTMLTable -DataTable $Test1 -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount'
        }
    } -StyleSheetsConfiguration $SectionStyle1

    # This sets new panel options globally
    New-HTMLPanelStyle -BorderRadius 0px
    New-HTMLPanel {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Test1 -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Test1 -HideFooter
        }
    }

    # this overwrittes panel options for 1 or more panels (in this case just 1)
    $StylePanel1 = New-HTMLPanelStyle -RequestConfiguration -BorderRadius 0px -RemoveShadow
    New-HTMLPanel {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Test1 -HideFooter
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $Test1 -HideFooter
        }
    } -StyleSheetsConfiguration $StylePanel1

    # But you ccan use this style anywhere
    New-HTMLPanel {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Test1 -HideFooter
        } -StyleSheetsConfiguration $StylePanel1
        New-HTMLPanel {
            New-HTMLTable -DataTable $Test1 -HideFooter
        }
    }
}