$DataTable = @(
    [PSCustomObject] @{ Name = 'Service Desk 1'; Incidents = 1; Resolved = 0; Year = 2001 }
    [PSCustomObject] @{ Name = 'Service Desk 2'; Incidents = 20; Resolved = 15; Year = 2002 }
    [PSCustomObject] @{ Name = 'Service Desk 3'; Incidents = 40; Resolved = 19; Year = 2003 }
    [PSCustomObject] @{ Name = 'Service Desk 4'; Incidents = 15; Resolved = 25; Year = 2004 }
    [PSCustomObject] @{ Name = 'Service Desk 5'; Incidents = 10; Resolved = 19; Year = 2005 }
    [PSCustomObject] @{ Name = 'Service Desk 6'; Incidents = 45; Resolved = 45; Year = 2006 }
    [PSCustomObject] @{ Name = 'Service Desk 7'; Incidents = 18; Resolved = 15; Year = 2007 }
    [PSCustomObject] @{ Name = 'Service Desk 8'; Incidents = 60; Resolved = 50; Year = 2008 }
    [PSCustomObject] @{ Name = 'Service Desk 9'; Incidents = 18; Resolved = 5; Year = 2009 }
    [PSCustomObject] @{ Name = 'Service Desk 0'; Incidents = 9; Resolved = 2; Year = 2010 }
)

New-HTML {
    $SectionStyle1 = New-HTMLSectionStyle -RequestConfiguration
    Add-HTMLStyle -Placement Header -Css @{
        "$($SectionStyle1.SectionHead)" = @{
            'background-color' = 'yellow'
            'font-size'        = '50px'
        }
        "$($SectionStyle1.Section)"     = @{
            'margin' = '10px'
            'width'  = 'calc(100% - 20px)'
        }
    } -SkipTags
    New-HTMLSection -HeaderText 'Test' {
        for ($i = 0; $i -le 5; $i++) {
            New-HTMLTable -DataTable $DataTable -HideFooter
        }
    } -Direction column -StyleSheetsConfiguration $SectionStyle1
} -ShowHTML -Online -FilePath $PSScriptRoot\Example-SectionCustomStyle.html