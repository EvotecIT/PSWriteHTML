Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {

    New-HTMLSectionScrolling {
        New-HTMLSectionScrollingItem {
            New-HTMLPanel {

            }
        } -SectionTitle 'Test 1'
        New-HTMLSectionScrollingItem {

        } -SectionTitle 'Test 2'
        New-HTMLSectionScrollingItem {
            New-HTMLTable -DataTable 'Test'
        } -SectionTitle 'Test 3'
        New-HTMLSectionScrollingItem {

        } -SectionTitle 'Test 4'
        New-HTMLSectionScrollingItem {

        } -SectionTitle 'Test 5'
        New-HTMLSectionScrollingItem {

        } -SectionTitle 'Test 6'
        New-HTMLSectionScrollingItem {
            New-HTMLSection {

            }

        } -SectionTitle 'Test 7'
    }

} -ShowHTML -FilePath $PSScriptRoot\Example45-ScrolingText.html -Online #-Format