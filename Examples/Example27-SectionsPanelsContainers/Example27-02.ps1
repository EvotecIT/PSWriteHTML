Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

$Test1 = Get-Process | Select-Object -First 2 -Property Name, Id, PriorityClass

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example27-02.html -Show {
    $SectionStyle1 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -Rotate 180deg -RequestConfiguration
    $SectionStyle2 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -TextOrientation upright -RequestConfiguration -AlignContent flex-end -Align flex-end
    $SectionStyle3 = New-HTMLSectionStyle -RemoveShadow -BorderRadius 0px -Direction row -WritingMode vertical-lr -RequestConfiguration -BackgroundColorContent Yellow
    $SectionStyleHidden = New-HTMLSectionStyle -DirectionContent row -WrapContent wrap -RequestConfiguration -BorderRadius 0px
    New-HTMLSection -HeaderText 'Default Section Style' {
        New-HTMLTable -DataTable $Test1 -HideFooter {
            New-HTMLTableHeader -Names 'ID', 'HandleCount'
        }
    } -Collapsed -CanCollapse
    New-HTMLSection -Invisible {
        New-HTMLSection -Title 'Section Style 1' {
            New-HTMLTable -DataTable $Test1 -HideFooter
        } -StyleSheetsConfiguration $SectionStyle1 -HeaderTextColor Black -Collapsed -CanCollapse
        New-HTMLSection -Title 'Section Style 2' {
            New-HTMLTable -DataTable $Test1 -HideFooter
        } -StyleSheetsConfiguration $SectionStyle2
        New-HTMLSection -Title 'Section Style 3' {
            New-HTMLTable -DataTable $Test1 -HideFooter
        } -StyleSheetsConfiguration $SectionStyle3
    }

    New-HTMLSection -HeaderText 'Test' {
        New-HTMLSection -Title 'Section Style 4' {
            New-HTMLTable -DataTable $Test1 -HideFooter
        } -StyleSheetsConfiguration $SectionStyle3
        New-HTMLSection -Title 'Section Style 5' {
            New-HTMLTable -DataTable $Test1 -HideFooter
        } -StyleSheetsConfiguration $SectionStyle3
    } -StyleSheetsConfiguration $SectionStyleHidden
} -Format