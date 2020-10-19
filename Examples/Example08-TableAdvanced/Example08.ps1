Import-Module .\PSWriteHTML.psd1 -Force


$Properties = @(
    'Name'
    'Id'
    'PriorityClass'
    'FileVersion'
    'HandleCount'
    'WorkingSet'
    'PagedMemorySize'
    'PrivateMemorySize'
    'VirtualMemorySize'
    'TotalProcessorTime'
    <#
    'SI'
    'Handles'
    'VM'
    'WS'
    'PM'
    'NPM'
    #>
)
$ProcessesAll = Get-Process | Select-Object -First 30
$Processes = $ProcessesAll | Select-Object -First 30 -Property $Properties

New-HTML -TitleText 'Title' -Online -FilePath $PSScriptRoot\Example08.html -ShowHTML {
    New-HTMLSection -HeaderText '0 section' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -HideFooter -ScrollCollapse {
                New-HTMLTableHeader -Names 'Name', 'ID' -Title 'Process Information' -Color Red -FontWeight lighter -Alignment left -BackGroundColor LightBlue
                New-HTMLTableHeader -Names 'PagedMemorySize', 'PrivateMemorySize', 'VirtualMemorySize' -Title 'Memory' -Color White -BackGroundColor Blue
                New-HTMLTableHeader -Names 'Name' -BackGroundColor Red -Color WhiteSmoke
                New-HTMLTableHeader -Names 'Id' -BackGroundColor Blue -Color White
                New-HTMLTableHeader -Names 'PriorityClass', 'FileVersion', 'HandleCount' -BackGroundColor Gold -Color White
                New-HTMLTableHeader -BackGroundColor Green -Color White  -Title 'Full Title'
                New-HTMLTableCondition -Name 'HandleCount' -ComparisonType number -Operator gt 500 -BackgroundColor Gray -Color White -Row
            } -Filtering
        }
    }

    New-HTMLSection -HeaderText '1 section' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes {
                New-HTMLTableHeader -Names 'Name', 'ID' -Title 'Process Information'
                New-HTMLTableHeader -Names 'PriorityClass', 'FileVersion', 'HandleCount' -BackGroundColor Gold -Color White
                New-HTMLTableHeader -Names 'PriorityClass', 'FileVersion', 'HandleCount', 'WorkingSet' -Title 'Merge' -BackGroundColor Orchid
                New-HTMLTableHeader -Names 'PagedMemorySize', 'PrivateMemorySize', 'VirtualMemorySize' -Title 'Memory'
                New-HTMLTableHeader -BackGroundColor Green -Color White  -Title 'Half Title' -ColumnCount 3
                New-HTMLTableHeader -BackGroundColor Red -Color White  -Title 'Other Half Title'
            } -Filtering
        }
    }
    New-HTMLSection -HeaderText '2 section' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $ProcessesAll -HideFooter -DisableResponsiveTable {
                New-HTMLTableHeader -Names 'Name', 'ID' -Title 'Process Information'
                New-HTMLTableHeader -Names 'PagedMemorySize', 'PrivateMemorySize', 'VirtualMemorySize' -Title 'Memory'
            }
        }
    }

    New-HTMLSection -HeaderText '3 section' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes  {
                New-HTMLTableHeader -Names 'PriorityClass', 'FileVersion', 'HandleCount' -BackGroundColor Gold -Color White
                New-HTMLTableHeader -BackGroundColor Red -Color White  -Title '1 Half Title' -ColumnCount 3
                New-HTMLTableHeader -BackGroundColor Yellow -Color Black  -Title '2 Half Title' -ColumnCount 3
                New-HTMLTableHeader -BackGroundColor Green -Color White  -Title '3 Half Title'
            } -HideFooter
        }
    }
    New-HTMLSection -HeaderText '4 section' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $ProcessesAll -DisableResponsiveTable
        }
    }
    New-HTMLSection -HeaderText 'Demo for ScrollX - disables responsive table automatically' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $ProcessesAll -HideFooter -ScrollX
        }
    }
    New-HTMLSection -HeaderText 'Demo for ScrollX - disables responsive table automatically' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $ProcessesAll -HideFooter -ScrollX -FreezeColumnsRight 2 -FreezeColumnsLeft 2
        }
    }
    New-HTMLSection -HeaderText 'Demo for ScrollY' {
        New-HTMLPanel {
            New-HTMLTable -DataTable $ProcessesAll -HideFooter -ScrollY -DisablePaging
        }
    }

}

