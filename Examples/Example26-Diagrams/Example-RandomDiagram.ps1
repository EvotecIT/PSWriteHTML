Import-Module .\PSWriteHTML.psd1 -Force

$Nodes = 1..31

$Links = @(
    @{ from = 1; to = 2 }
    @{ from = 1; to = 3 }
    @{ from = 2; to = 4 }
    @{ from = 2; to = 5 }
    @{ from = 3; to = 6 }
    @{ from = 3; to = 7 }
    @{ from = 4; to = 8 }
    @{ from = 4; to = 9 }
    @{ from = 5; to = 10 }
    @{ from = 5; to = 11 }
    @{ from = 6; to = 12 }
    @{ from = 6; to = 13 }
    @{ from = 7; to = 14 }
    @{ from = 7; to = 15 }
    @{ from = 8; to = 16 }
    @{ from = 8; to = 17 }
    @{ from = 9; to = 18 }
    @{ from = 9; to = 19 }
    @{ from = 10; to = 20 }
    @{ from = 10; to = 21 }
    @{ from = 11; to = 22 }
    @{ from = 11; to = 23 }
    @{ from = 12; to = 24 }
    @{ from = 12; to = 25 }
    @{ from = 13; to = 26 }
    @{ from = 13; to = 27 }
    @{ from = 14; to = 28 }
    @{ from = 14; to = 29 }
    @{ from = 15; to = 30 }
    @{ from = 15; to = 31 }
)


New-HTML -TitleText 'My diagram' -FilePath $PSScriptRoot\Example-RandomDiagram.html {
    New-HTMLDiagram -Height '1000px' {
        New-DiagramOptionsLinks -ArrowsToEnabled $true -ArrowsToType arrow
        foreach ($_ in $Nodes) {
            New-DiagramNode -Label $_ -Level $_
        }
        foreach ($_ in $Links) {
            New-DiagramLink -From $_.From -To $_.To
        }

    }
} -ShowHTML -Online