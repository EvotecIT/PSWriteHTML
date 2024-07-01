$DataTable = @(
    [PSCustomObject] @{ Name = 'Service Desk 1'; Incidents = 1; Resolved = 0; Year = 2001 }
    [PSCustomObject] @{ Name = 'Service Desk 2'; Incidents = 20; Resolved = 15; Year = 2002 }
)

New-HTML {
    Add-HTMLStyle -Placement Header -Css @{
        "@font-face" = @{
            "font-family" = 'Open Sans'
            "font-style"  = "normal italic"
            "src"         = 'url(data:application/octet-stream;base64,d09GMgA...............)'
        }
    }
    Add-HTMLStyle -Placement Header -Css @{
        'body' = @{
            'background-color' = '#34ebeb'
            'font-family'      = '"Raleway", sans-serif'
            'font-size'        = '16px'
        }
    }
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
    }
    New-HTMLSection -HeaderText 'Test' {
        for ($i = 0; $i -le 1; $i++) {
            New-HTMLTable -DataTable $DataTable -HideFooter
        }
    } -Direction column -StyleSheetsConfiguration $SectionStyle1
} -ShowHTML -Online -FilePath $PSScriptRoot\Example-StyleChange.html