Import-Module .\PSWriteHTML.psd1 -Force

$Processes = Get-Process | Select-Object -First 1 | Sort-Object workingset
New-HTML -Online -FilePath $PSScriptRoot\Example-DiagramsChartsTable1.html -Show {
    New-HTMLTable -DataTable $Processes
    New-HTMLChart {
        foreach ($Process in $Processes) {
            New-ChartBar -Name $Process.name -Value $Process.Workingset
        }
    }
    New-HTMLDiagram {
        New-DiagramNode -Label '1' -To '2'
        New-DiagramNode -Label '2' -To '3'
        New-DiagramNode -Label '3' -To '4'
        New-DiagramNode -Label '4'
    }
}

$Processes = Get-Process | Select-Object -First 1 | Sort-Object workingset
New-HTML -Online -FilePath $PSScriptRoot\Example-DiagramsChartsTable2.html -Show {
    New-HTMLDiagram {
        New-DiagramNode -Label '1' -To '2'
        New-DiagramNode -Label '2' -To '3'
        New-DiagramNode -Label '3' -To '4'
        New-DiagramNode -Label '4'
    }
    New-HTMLTable -DataTable $Processes
    New-HTMLChart {
        foreach ($Process in $Processes) {
            New-ChartBar -Name $Process.name -Value $Process.Workingset
        }
    }
}