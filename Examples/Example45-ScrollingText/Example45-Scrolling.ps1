Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSectionScrolling {
        New-HTMLSectionScrollingItem -SectionTitle 'Test 1' {
            "<p>Test 1 Text</p>"
        }
        New-HTMLSectionScrollingItem -SectionTitle 'Test 2' {

        }
        New-HTMLSectionScrollingItem -SectionTitle 'Test 3' {
            New-HTMLTable -DataTable 'Test'
        }
        New-HTMLSectionScrollingItem -SectionTitle 'Test 4' {

        }
        New-HTMLSectionScrollingItem -SectionTitle 'Test 5' {
            "<p>Test 5 Text</p>"

            New-HTMLSectionScrollingItem -SectionTitle 'Test 5.1' {
                "<p>Test 5.1 Text</p>"
            }

            New-HTMLSectionScrollingItem -SectionTitle 'Test 5.2' {
                "<p>Test 5.2 Text</p>"
            }
        }
        New-HTMLSectionScrollingItem -SectionTitle 'Test 6' {

        }
        New-HTMLSectionScrollingItem -SectionTitle 'Test 7' {
            New-HTMLSectionScrollingItem -SectionTitle 'Test 7.1' {
                "<p>Test 7.1 Text</p>"
            }
            New-HTMLSectionScrollingItem -SectionTitle 'Test 7.2' {
                "<p>Test 7.2 Text</p>"
            }
            New-HTMLSectionScrollingItem -SectionTitle 'Test 7.3' {
                "<p>Test 7.3 Text</p>"
            }
        }
    }

} -FilePath $PSScriptRoot\Example45-ScrolingText.html -Online -Format # -ShowHTML