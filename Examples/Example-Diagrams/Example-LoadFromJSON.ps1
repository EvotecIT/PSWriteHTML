Import-Module .\PSWriteHTML.psd1 -Force

$JSON = Get-Content "$PSScriptRoot\Example-LoadFromJSON.json" | ConvertFrom-Json

New-HTML -TitleText 'My diagram' -FilePath $PSScriptRoot\Example-LoadFromJSON.html {
    New-HTMLDiagram -Height '1000px' {
        foreach ($Node in $JSON.nodes) {
            New-DiagramNode -Level $Node.Level -Label $Node.Label
        }
        foreach ($Link in $JSON.edges) {
            New-DiagramLink -From $Link.From -To $Link.To
        }

    }
} -ShowHTML -Online