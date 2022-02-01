Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My Accordion' -Online -FilePath $PSScriptRoot\Example-Accordion01.html {
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Accordion - On left' -CanCollapse {
            New-HTMLAccordion {
                New-AccordionItem -HeaderText 'Test1' -PanelText 'Test2'
                New-AccordionItem -HeaderText 'Test2' -PanelText 'Test2'
                New-AccordionItem -HeaderText 'Test3' -PanelText 'Test2'
            } -CollapseOnClick
            New-HTMLAccordion -Duration 1 {
                New-AccordionItem -HeaderText 'Test1' -PanelText 'Test2'
                New-AccordionItem -HeaderText 'Test2' -PanelText 'Test2'
                New-AccordionItem -HeaderText 'Test3' -PanelText 'Test2'
            }
        }
        New-HTMLSection -HeaderText 'Accordion - On right' -CanCollapse {
            New-HTMLAccordion {
                New-AccordionItem -HeaderText 'Test1' -PanelText 'Test2'
                New-AccordionItem -HeaderText 'Test2' -PanelText 'Test2'
                New-AccordionItem -HeaderText 'Test3' -PanelText 'Test2'
            }
            New-HTMLAccordion -Duration 1 {
                New-AccordionItem -HeaderText 'Test1' -PanelText 'Test2'
                New-AccordionItem -HeaderText 'Test2' -PanelText 'Test2'
                New-AccordionItem -HeaderText 'Lorem ipsum dolor sit amet.' -PanelText 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
            }
        }
    }
} -ShowHTML