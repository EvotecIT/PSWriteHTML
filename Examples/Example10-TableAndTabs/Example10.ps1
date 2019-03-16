Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select -First 5

$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -UseCssLinks:$false `
    -UseJavaScriptLinks:$false {

    New-HTMLLogo

    New-HtmlTab -TabName 'Test' {
        New-HTMLContent -HeaderText '0 section' {
            New-HTMLColumn -ColumnCount 3 {
                New-HTMLTable -ArrayOfObjects $Processes -HideFooter
            }
            New-HTMLColumn -ColumnCount 3 {
                New-HTMLTable -DataTable $Processes -HideFooter
            }
            New-HTMLColumn -ColumnCount 3 {
                New-HTMLTable -DataTable $Processes -HideFooter -Simplify
            }
            New-HTMLColumn -ColumnCount 12 {
                New-HTMLTable -DataTable $Processes -HideFooter
            }
        }
    }
    New-HTMLTab -TabName 'Test5' {
        New-HTMLContent -HeaderText '1 section' {
            New-HTMLColumn -ColumnCount 3 {
                New-HTMLTable -ArrayOfObjects $Processes -HideFooter
            }
            New-HTMLColumn -ColumnCount 3 {
                New-HTMLTable -ArrayOfObjects $Processes -HideFooter
                # New-HTMLTable -DataTable $Processes -HideFooter
            }
            New-HTMLColumn -ColumnCount 3 {
                New-HTMLTable -DataTable $Processes -HideFooter
            }
        }
    }
    <#
    
    New-HTMLTab {
        New-HTMLColumn {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLColumn -Columns 2 {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
    }
    New-HTMLTab {
        New-HTMLColumn {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
        New-HTMLColumn -Columns 3 {
            New-HTMLTable -DataTable $Processes -HideFooter
        }
    }
    New-HTMLTab {
        New-HTMLColumn {
            New-HTMLTable -DataTable $Processes -HideFooter
        }        
        New-HTMLColumn -Columns 4 {
            New-HTMLTable -DataTable $Processes -HideFooter
        }   
    }
    New-HTMLTab {
        New-HTMLColumn {
            New-HTMLTable -DataTable $Processes -HideFooter
        }        
        New-HTMLColumn -Columns 4 {
            New-HTMLTable -DataTable $Processes -HideFooter
        }   
        New-HTMLContent -HeaderText '1 section' {
            New-HTMLColumn -ColumnCount 3 {
                New-HTMLTable -ArrayOfObjects $Processes -HideFooter
            }
            New-HTMLColumn -ColumnCount 3 {
                New-HTMLTable -ArrayOfObjects $Processes -HideFooter
                # New-HTMLTable -DataTable $Processes -HideFooter
            }
            New-HTMLColumn -ColumnCount 3 {
                #   New-HTMLTable -DataTable $Processes -HideFooter -Simplify
            }
        }
    }
    #>
    
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML -FilePath $PSScriptRoot\Example10.html