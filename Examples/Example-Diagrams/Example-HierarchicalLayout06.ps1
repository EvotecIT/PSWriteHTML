Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My Ubiquiti Network' -Online -FilePath "$PSScriptRoot\Example-HierarchicalLayout06.html" {
    New-HTMLSection -HeaderText 'Diagram - My Network' -CanCollapse {
        New-HTMLDiagram -Height '1000px' {
            New-DiagramOptionsLayout -RandomSeed 500 -HierarchicalEnabled $true -HierarchicalDirection FromUpToDown
            New-DiagramOptionsLinks -FontSize 12 -WidthConstraint 90 -Length 200
            New-DiagramOptionsNodes -WidthConstraintMaximum 200 -Margin 10 -Shape box
            New-DiagramNode -ID 1 -Label "Trump" -Level 1 -Image 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Donald_Trump_official_portrait_%28cropped%29.jpg/220px-Donald_Trump_official_portrait_%28cropped%29.jpg'
            New-DiagramNode -ID 3 -Label "This is my very long title that I want to use on Level 2" -Level 2 -To 1 -Image 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Frank-Walter_Steinmeier_-_2018_%28cropped%29.jpg/220px-Frank-Walter_Steinmeier_-_2018_%28cropped%29.jpg'
            New-DiagramNode -ID 4 -Label "This is my very long title that I want to use on Level 2" -Level 2 -To 1 -Image 'https://www.jagranjosh.com/imported/images/E/Articles/Ram-Nath-Kovind-President-of-India.jpg'
            New-DiagramNode -ID 5 -Label "This is my very long title that I want to use on Level 3" -Level 3 -To 3 -Image 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Emmanuel_Macron_in_2019.jpg/220px-Emmanuel_Macron_in_2019.jpg'
            New-DiagramNode -ID 6 -Label "This is my very long title that I want to use on Level 3" -Level 3 -To 3 -Image 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Xi_Jinping_2019.jpg/220px-Xi_Jinping_2019.jpg'
            New-DiagramNode -ID 7 -Label "Andrzej Duda" -Level 4 -To 6 -Image 'https://news.wttw.com/sites/default/files/styles/full/public/article/image-non-gallery/PolishPresident.jpg?itok=j4EoF9xD'
        }
    }
} -ShowHTML