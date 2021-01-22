

New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example27-15.html -Show {

    New-HTMLSection -HeaderText 'Test 1' {
        New-HTMLContainer {
            New-HTMLSection -HeaderText 'Test2' {

            }
            New-HTMLSection -HeaderText 'Test2' {

            }
        }
        New-HTMLContainer {

        }
        New-HTMLPanel {

        }
    }
    New-HTMLSection -HeaderText 'Test 2' {

    }
    New-HTMLSection -HeaderText 'Test 3' {

    }
    New-HTMLSection -HeaderText 'Test 4'  {
        New-HTMLContainer {
            New-HTMLSection -HeaderText 'Test2' {

            }
            New-HTMLSection -HeaderText 'Test2' {

            }
        }
        New-HTMLContainer {

        }
        New-HTMLPanel {

        }
    }
}