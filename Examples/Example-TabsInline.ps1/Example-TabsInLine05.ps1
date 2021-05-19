Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSectionOption -RemoveShadow -BorderRadius 0px
    New-HTMLSection -Invisible -Wrap wrap {
        New-HTMLSection -Invisible {
            New-HTMLSection -HeaderText 'Lets see 1' {
                New-HTMLTable -DataTable 'test 6'
            }
            New-HTMLSection -HeaderText 'Lets see 2' {
                New-HTMLTable -DataTable 'test 7'
            }
        }
        New-HTMLTabPanel {
            New-HTMLTab -Name 'New Tabs 1' -IconRegular address-book -IconColor Pink {
                New-HTMLTable -DataTable 'test 1'
            }
            New-HTMLTab -Name 'New Tabs 2' -IconSolid bell -IconColor Green {
                New-HTMLTable -DataTable 'This content is different. It shows tabs have different tables'
            }
        }

        New-HTMLSection -HeaderText 'Lets see middle' {
            New-HTMLTable -DataTable 'test 5'
        }

        New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"

        New-HTMLSection -Invisible {
            New-HTMLTabPanel {
                New-HTMLTab -Name 'This Tab Is Almost At The End 1' -IconBrands cc-amazon-pay {
                    New-HTMLTable -DataTable 'Last Table Under Tab 1'
                }
                New-HTMLTab -Name 'This Tab Is Almost At The End 2' -IconBrands 500px {
                    New-HTMLTable -DataTable 'test 4'
                }
            }
        }
        New-HTMLTabPanel {
            New-HTMLTab -Name 'This Tab Is Almost At The End 1' -IconBrands cc-amazon-pay {
                New-HTMLTable -DataTable 'Last Table Under Tab 1'
            }
            New-HTMLTab -Name 'This Tab Is Almost At The End 2' -IconBrands 500px {
                New-HTMLTable -DataTable 'test 4'
            }
        }
    }
} -Online -ShowHTML -FilePath $PSScriptRoot\Example-TabsInLine05.html