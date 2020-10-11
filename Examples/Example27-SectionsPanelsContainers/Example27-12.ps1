Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force
New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example27-12.html -Show {
    $SectionStyle1 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -Rotate 180deg -RequestConfiguration
    #$SectionStyle2 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -TextOrientation upright -RequestConfiguration -AlignContent flex-end -Align flex-end
    #$SectionStyle3 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -RequestConfiguration -BackgroundColorContent Yellow
    #$SectionStyleHidden = New-HTMLSectionStyle -DirectionContent row -WrapContent wrap -RequestConfiguration -BorderRadius 0px
    New-HTMLSection -HeaderText '<h4>Default Section Style</h4>' {
        New-HTMLText -Color Red -Text 'test' -Alignment center
    } -CanCollapse
    New-HTMLSection {
        New-HTMLSection -Title 'Section Style 1' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle1 -HeaderTextColor Black -CanCollapse
        New-HTMLSection -Title 'Section Style 2' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle2
        New-HTMLSection -Title 'Section Style 3' {
            New-HTMLText -Color Red -Text 'test' -Alignment center
        } -StyleSheetsConfiguration $SectionStyle3 -CanCollapse
    }
}
