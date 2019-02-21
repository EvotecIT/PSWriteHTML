Import-Module .\PSWriteHTML.psd1 -Force
$Processes = Get-Process | Select -First 1

$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -HideLogos:(-not $ReportOptions.AsDynamicHTML.Branding.Logo.Show) `
    -RightLogoString $ReportOptions.AsDynamicHTML.Branding.Logo.RightLogo.ImageLink `
    -UseCssLinks:$true `
    -UseStyleLinks:$true {

    New-HTMLTabHeader -TabNames 'Test', 'Test 5555', 'Test2', 'Test3', 'Test4', 'Test5','Test2'
    New-HtmlTab {
        New-HTMLContent -HeaderText '0 section' {
            New-HTMLColumn -ColumnCount 3 {
                New-HTMLTable -ArrayOfObjects $Processes -HideFooter
            }
            New-HTMLColumn -ColumnCount 3 {
                New-HTMLTable -DataTable $Processes -HideFooter
            }
            New-HTMLColumn -ColumnCount 3 {
                #New-HTMLTable -DataTable $Processes -HideFooter -Simplify
            }
        }
    }
    New-HTMLTab {
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
    
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML `
    -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example10\Example10.html'