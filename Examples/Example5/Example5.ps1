Import-Module "..\PSWriteHTML\PSWriteHTML.psd1" -Force

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *

$HTMLPath = "$PSScriptRoot\Example5.html"



$CodeBlock = @'

$HTML = New-HtmlPage -Name 'Test' -UseCssLinks -UseStyleLinks {
    New-HTMLTabHeader -TabNames 'Dashboard', 'Other'
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent -HeaderText 'Content' {
            New-HTMLColumn -ColumnNumber 1 -ColumnCount 2 {
                New-HTMLContent -HeaderText 'My text' -CanCollapse {
                    Get-HTMLContentTable -ArrayOfObjects $DomainAdminTable
                }
            }
            New-HTMLColumn -ColumnNumber 2 -ColumnCount 2 {
                New-HTMLContent -HeaderText 'My text' -CanCollapse {
                    Get-HTMLContentTable -ArrayOfObjects $DomainAdminTable
                }
            }
            New-HTMLContent -HeaderText 'My text 2' -CanCollapse {
                Get-HTMLContentDataTable -ArrayOfObjects $EnterpriseAdminTable
            }
        }
        New-HTMLContent -HeaderText 'This shows PowerShell Language' {
            Get-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell'
        }
    }
    New-HTMLTab -TabName 'Other' -TabHeading 'Test 2' {
        New-HTMLContent -HeaderText 'My other text' {
            Get-HTMLContentTable -ArrayOfObjects $EnterpriseAdminTable
        }
    }
}
Save-HTML -FilePath $HTMLPath -ShowHTML -HTML $HTML

'@

$CodeBlockJS = @'
//refresh page on browser resize
$(window).bind("resize", function(e) {
    if (window.RT) clearTimeout(window.RT);
    window.RT = setTimeout(function() {
        this.location.reload(false); /* false to get page from cache */
    }, 200);
});
'@

$HTML = New-HtmlPage -Name 'Test' -UseCssLinks -UseStyleLinks {
    New-HTMLTabHeader -TabNames 'Dashboard', 'Other'
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLContent -HeaderText 'Content' {
            New-HTMLColumn -ColumnNumber 1 -ColumnCount 2 {
                New-HTMLContent -HeaderText 'My text' -CanCollapse {
                    Get-HTMLContentTable -DataTable $DomainAdminTable
                }
            }
            New-HTMLColumn -ColumnNumber 2 -ColumnCount 2 {
                New-HTMLContent -HeaderText 'My text' -CanCollapse {
                    Get-HTMLContentTable -DataTable $DomainAdminTable
                }
            }
            New-HTMLContent -HeaderText 'My text 2' -CanCollapse {
                Get-HTMLContentDataTable -DataTable $EnterpriseAdminTable
            }
        }
        New-HTMLContent -HeaderText 'This shows PowerShell Language' {
            New-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell'
        }
        New-HTMLContent -HeaderText 'This shows PowerShell Language' {
            New-HTMLCodeBlock -Code $CodeBlockJS -Style 'JavaScript'
        }
    }
    New-HTMLTab -TabName 'Other' -TabHeading 'Test 2' {
        New-HTMLContent -HeaderText 'My other text' {
            Get-HTMLContentTable -DataTable $EnterpriseAdminTable
        }
    }
}
Save-HTML -FilePath $HTMLPath -ShowHTML -HTML $HTML