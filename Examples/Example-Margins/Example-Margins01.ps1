Import-Module .\PSWriteHTML.psd1 -Force

$DataTable1 = @(
    [PSCustomObject] @{
        'Test'  = 1
        'Test2' = 2
    }
    [PSCustomObject] @{
        'Test'  = 1
        'Test2' = 2
    }
    [PSCustomObject] @{
        'Test'  = 1
        'Test2' = 2
    }
)
$DataTable2 = Get-Process | Select-Object -First 2

New-HTML {
    New-HTMLSection -Invisible {
        New-HTMLSection {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 # Title will be used for filename when using export
        }
        New-HTMLSection {
            New-HTMLTable -DataTable $DataTable2 -Title 'Test2' -PagingLength 3 # Title will be used for filename when using export
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 -Filtering # Title will be used for filename when using export
        }
        New-HTMLSection {
            New-HTMLTable -DataTable $DataTable2 -Title 'Test2' -PagingLength 3 -Filtering # Title will be used for filename when using export
        }
    }
    New-HTMLSection -Invisible {
        New-HTMLSection {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 -HideFooter # Title will be used for filename when using export
        }
        New-HTMLSection {
            New-HTMLTable -DataTable $DataTable2 -Title 'Test2' -PagingLength 3 -Filtering -FilteringLocation Both # Title will be used for filename when using export
        }
    }
    New-HTMLSection {
        New-HTMLPanel {
            New-HTMLText -Text "This is my text inside panel and inside section 1"
        }
        New-HTMLPanel {
            New-HTMLText -Text "This is my text inside panel and inside section 2"
        }
    }
    New-HTMLSection {
        New-HTMLText -Text "This is my text inside section directly"
    }
    New-HTMLSection -HeaderText 'Theme Arrows' {
        New-HTMLWizard -Theme arrows {
            New-HTMLWizardStep -Name 'Step 1' {
                New-HTMLHeading -Heading h5 -HeadingText 'Step 1'
                New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            }
            New-HTMLWizardStep -Name 'Step 2' {
                New-HTMLHeading -Heading h5 -HeadingText 'Step 2'
                New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            }
            New-HTMLWizardStep -Name 'Step 3' {
                New-HTMLHeading -Heading h5 -HeadingText 'Step 3'
                New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            }
            New-HTMLWizardStep -Name 'Step 4' {
                New-HTMLHeading -Heading h5 -HeadingText 'Step 4'
                New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            }
            New-HTMLWizardStep -Name 'Step 5' {
                New-HTMLHeading -Heading h5 -HeadingText 'Step 5'
                New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
            }
        } -RemoveDoneStepOnNavigateBack
    }
    New-HTMLWizard -Theme arrows {
        New-HTMLWizardStep -Name 'Step 1' {
            New-HTMLHeading -Heading h5 -HeadingText 'Step 1'
            New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        }
        New-HTMLWizardStep -Name 'Step 2' {
            New-HTMLHeading -Heading h5 -HeadingText 'Step 2'
            New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        }
        New-HTMLWizardStep -Name 'Step 3' {
            New-HTMLHeading -Heading h5 -HeadingText 'Step 3'
            New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        }
        New-HTMLWizardStep -Name 'Step 4' {
            New-HTMLHeading -Heading h5 -HeadingText 'Step 4'
            New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        }
        New-HTMLWizardStep -Name 'Step 5' {
            New-HTMLHeading -Heading h5 -HeadingText 'Step 5'
            New-HTMLText -Text "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        }
    } -RemoveDoneStepOnNavigateBack

    New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 # Title will be used for filename when using export


    New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 -Simplify # Title will be used for filename when using export
    New-HTMLSection {
        New-HTMLPanel {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 -Simplify # Title will be used for filename when using export
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 -Simplify -Filtering # Title will be used for filename when using export
        }
        New-HTMLPanel {
            New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 -Simplify -HideFooter # Title will be used for filename when using export
        }
    }

    New-HTMLSection {
        New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 -Simplify # Title will be used for filename when using export
    }
    New-HTMLSection {
        New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 -Simplify # Title will be used for filename when using export
        New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 -Simplify # Title will be used for filename when using export
    }
    New-HTMLSection -Invisible {
        New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 -Simplify # Title will be used for filename when using export
        New-HTMLTable -DataTable $DataTable1 -Title 'Test1' -PagingLength 3 -Simplify # Title will be used for filename when using export
    }
    New-HTMLSection -Invisible {
        New-HTMLText -Text "This is my text inside panel and inside section 1"
        New-HTMLText -Text "This is my text inside panel and inside section 1"
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-Margins01.html -Online