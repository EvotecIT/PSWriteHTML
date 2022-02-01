Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLSummary -Title 'Office 365 Compliance Testing' {
                New-HTMLSummaryItem -Text 'Office 365' -IconColor '#0078D7' -IconSolid check-double

                New-HTMLSummaryItem -Text 'Exchange Online Testing' {
                    New-HTMLSummaryItem -Text 'Test 1' -IconRegular check-circle -IconColor DarkPastelGreen {
                        New-HTMLSummaryItemData -Text "status" -Value "Passed ✅"
                        New-HTMLSummaryItemData -Text "info" -Value "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                        New-HTMLSummaryItemData -Text "extended" -Value "More information"
                        New-HTMLSummaryItemData -Text "extended more" -Value "More information"
                    }
                    New-HTMLSummaryItem -Text 'Test 2' -IconRegular check-circle -IconColor DarkPastelGreen
                } -IconRegular check-circle -IconColor DarkPastelGreen
                New-HTMLSummaryItem -Text 'Azure AD Testing' {
                    New-HTMLSummaryItem -Text 'Test 1' -IconRegular check-circle -IconColor GreenYellow
                    New-HTMLSummaryItem -Text 'Test 2' -IconSolid exclamation-circle -IconColor Orange {
                        New-HTMLSummaryItemData -Text "status" -Value "Failed"
                        New-HTMLSummaryItemData -Text "info" -Value "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                    }
                } -IconSolid exclamation-circle -IconColor Orange -Open
                New-HTMLSummaryItem -Text 'Microsoft Teams' {
                    New-HTMLSummaryItem -Text 'Test 1' -IconRegular check-circle -IconColor GreenYellow
                    New-HTMLSummaryItem -Text 'Test 2' -IconSolid exclamation-circle -IconColor Orange
                } -IconSolid window-close -IconColor Red
            } -TitleRight "$(Get-Date)"
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example43-Summary01.html -Online #-Format