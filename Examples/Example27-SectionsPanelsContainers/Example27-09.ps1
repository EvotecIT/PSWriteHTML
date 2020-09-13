Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

#$Test1 = Get-Process | Select-Object -First 2 -Property Name, Id, PriorityClass

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example27-09.html -Show {
    $SectionStyle1 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -Rotate 180deg -RequestConfiguration
    #$SectionStyle2 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -TextOrientation upright -RequestConfiguration -AlignContent flex-end -Align flex-end
    #$SectionStyle3 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -RequestConfiguration -BackgroundColorContent Yellow
    #$SectionStyleHidden = New-HTMLSectionStyle -DirectionContent row -WrapContent wrap -RequestConfiguration -BorderRadius 0px
    New-HTMLSection -HeaderText 'Default Section Style' {
        New-HTMLText -Color Red -Text 'test' -Alignment center
    } -Collapsed -CanCollapse
    New-HTMLSection -Invisible {
        New-HTMLSection -Title 'Section Style 1' {
            New-HTMLText -Color Red -Text 'Left based section collapsed' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle1 -HeaderTextColor Black -Collapsed -CanCollapse
        New-HTMLSection -Title 'Section Style 2' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle2
        New-HTMLSection -Title 'Section Style 3' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3 -CanCollapse -Collapsed
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -Title 'Section Style 1-1' {
            New-HTMLText -Color Red -Text 'Test 1' -Alignment center
        } -HeaderTextColor Black -Collapsed -CanCollapse
        New-HTMLSection -Title 'Section Style 1-2' {
            New-HTMLText -Color Red -Text 'test 2' -Alignment center
        } -Collapsed -CanCollapse
        New-HTMLSection -Title 'Section Style 1-3' {
            New-HTMLText -Color Red -Text 'test 3' -Alignment center
        } -Collapsed -CanCollapse
    }

    New-HTMLSection -HeaderText 'Test 2' {
        New-HTMLSection -Title 'Section Style 4' -CanCollapse {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3
        New-HTMLSection -Title 'Section Style 5' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3
        New-HTMLSection -Title 'Section Style 5' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3 -CanCollapse
        New-HTMLSection -Title 'Section Style 5' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3 -CanCollapse
        New-HTMLSection -Title 'Section Style 5' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3 -CanCollapse
        New-HTMLSection -Title 'Section Style 5' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3
    } -StyleSheetsConfiguration $SectionStyleHidden -CanCollapse

    New-HTMLSection -HeaderText 'Test 3' {
        New-HTMLSection -Title 'Section Style 4' -CanCollapse {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3
        New-HTMLSection -Title 'Section Style 5' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3 -CanCollapse
        New-HTMLSection -Title 'Section Style 5' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3 -CanCollapse
        New-HTMLSection -Title 'Section Style 5' -CanCollapse -Collapsed {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3
        New-HTMLSection -Title 'Section Style 5' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3 -CanCollapse

    } -StyleSheetsConfiguration $SectionStyleHidden

    New-HTMLSection -Invisible {
        New-HTMLSection -Title 'Section Style 1' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle1 -HeaderTextColor Black -Collapsed -CanCollapse
        New-HTMLSection -Title 'Section Style 2' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle2
        New-HTMLSection -Title 'Section Style 3' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3 -CanCollapse -Collapsed
        New-HTMLSection -Title 'Section Style 3' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3 -CanCollapse
        New-HTMLSection -Title 'Section Style 3' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3 -CanCollapse -Collapsed
    }

    New-HTMLSection -HeaderText 'Testing Row 4th' {
        New-HTMLSection -HeaderText 'Test1' {
            New-HTMLText -Color Red -Text 'Hidden section' -Alignment center
        } -IsHidden
        New-HTMLSection -HeaderText 'Test2' {
            New-HTMLText -Color Red -Text 'Normal section' -Alignment center
        }
        New-HTMLSection -HeaderText 'Test1' {
            New-HTMLText -Color Red -Text 'Invisible section' -Alignment center
        } -Invisible
    }
}