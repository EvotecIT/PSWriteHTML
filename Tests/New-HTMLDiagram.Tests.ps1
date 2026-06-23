Import-Module "$PSScriptRoot\..\PSWriteHTML.psd1" -Force

Describe 'New-HTMLDiagram edge options' {
    It 'Serializes per-link width and global edge smooth options' {
        $FilePath = "$PSScriptRoot\TemporaryDiagram.html"

        New-HTML -TitleText 'Diagram API Test' -FilePath $FilePath -Online {
            New-HTMLDiagram -Height 400 {
                New-DiagramOptionsLinks -Width 2 -HoverWidth 4 -SelectionWidth 5 -SmoothType curvedCW -SmoothRoundness 0.35
                New-DiagramNode -Id 'A' -Label 'A'
                New-DiagramNode -Id 'B' -Label 'B'
                New-DiagramLink -From 'A' -To 'B' -Label 'weighted' -Width 6 -HoverWidth 8 -SelectionWidth 10 -Value 3 -ArrowsToEnabled -ArrowsToScaleFactor 2
            }
        }

        $Content = Get-Content -Path $FilePath -Raw
        $Content | Should -Match '"width"\s*:\s*6'
        $Content | Should -Match '"hoverWidth"\s*:\s*8'
        $Content | Should -Match '"selectionWidth"\s*:\s*10'
        $Content | Should -Match '"value"\s*:\s*3'
        $Content | Should -Match '"scaleFactor"\s*:\s*2'
        $Content | Should -Match '"smooth"\s*:\s*\{'
        $Content | Should -Match '"type"\s*:\s*"curvedCW"'
        $Content | Should -Match '"roundness"\s*:\s*0.35'

        if (Test-Path $FilePath) {
            Remove-Item -LiteralPath $FilePath
        }
    }
}
