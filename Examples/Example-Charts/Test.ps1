

Dashboard -Name "Test report" -FilePath ".\testreport.html" {
    Section -Name "Tests" {
        Chart {
            ChartToolbar
            ChartBarOptions -Vertical
            ChartBar -Name "Passed" -Value 1 -Color Green
            ChartBar -Name "Failed" -Value 5 -Color Red
            ChartBar -Name "Awaiting" -Value 2 -Color Blue
        }
    }
    Section -Name "Tests2" {
        Chart {
            ChartBar -Name "Status" -Value 1, 5, 2
            ChartLegend -Name 'Passed', 'Failing', 'Awaiting' -Color Green, Red, Blue
        }
    }
    Section -Name "Tests2" {
        Chart {
            ChartBar -Name "C# Tests" -Value 1, 5, 2
            ChartBar -Name "PowerShell Tests" -Value 1, 5, 2
            ChartBar -Name "F# Tests" -Value 1, 15, 2
            ChartLegend -Name 'Passed', 'Failing', 'Awaiting' -Color Green, Red, Blue
        }
    }
    Section -Name "Tests2" {
        Chart {
            ChartBarOptions -Vertical
            ChartBar -Name "C# Tests" -Value 1, 5, 2
            ChartBar -Name "PowerShell Tests" -Value 1, 5, 2
            ChartBar -Name "F# Tests" -Value 1, 15, 2
            ChartLegend -Name 'Passed', 'Failing', 'Awaiting' -Color Green, Red, Blue
        }
    }
} #-ShowHTML