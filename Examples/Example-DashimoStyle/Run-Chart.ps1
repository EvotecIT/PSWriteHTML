
$Bounces = @(
    [PSCustomObject] @{ BounceTypeName = 'Area1'; Total = 5 }
    [PSCustomObject] @{ BounceTypeName = 'Area2'; Total = 13 }
    [PSCustomObject] @{ BounceTypeName = 'Area3'; Total = 18 }
    [PSCustomObject] @{ BounceTypeName = 'Area4'; Total = 1 }
)

Dashboard -Name 'Bounce Chart' -FilePath C:\Scripts\DashboardChartsBar00.html {
    TabOptions -slimtabs
    Tab -Name 'Bounce Chart by Type' {
        Panel {
            Chart {
                ChartTheme -Palette palette6
                ChartLegend  -FontSize 14 -FontFamily 'Arial'
                foreach ($Bounce in $Bounces) {
                    ChartPie -Name $Bounce.BounceTypeName -Value $Bounce.Total
                }
            }
        }
        Section -Invisible {
            Table -DataTable $Bounces -HideFooter {
                Table -title 'Email Address'
                TableHeader -names 'EmailAddress' -alignment Left
                TableHeader -names 'Bounce Type','Date' -alignment Center
                TableContent -ColumnIndex 2,3 -alignment center
            }
        }
    }
} -Show