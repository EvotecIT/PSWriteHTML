Import-Module (Join-Path $PSScriptRoot '../../PSWriteHTML.psd1') -Force

$Start = [datetime]::SpecifyKind([datetime]'2026-01-15T08:00:00', [DateTimeKind]::Utc)
$End = $Start.AddHours(8)
New-HTML -TitleText 'Maintenance windows' -FilePath (Join-Path $PSScriptRoot 'Example-TimelineWindows.html') {
    New-HTMLChart -Title 'Scheduled windows' {
        New-ChartAxisX -Type datetime -MinValue $Start -MaxValue $End
        New-ChartToolTip -TitleText 'Maintenance' -XAxisFormatPattern 'HH:mm:ss'
        New-ChartTimeLine -Name 'Database' -DateFrom $Start.AddHours(1) -DateTo $Start.AddHours(2) -TimeZoneOffset '+00:00'
        New-ChartTimeLine -Name 'Database' -DateFrom $Start.AddHours(4) -DateTo $Start.AddHours(5) -TimeZoneOffset '+00:00'
        New-ChartTimeLine -Name 'Web' -DateFrom $Start.AddHours(2) -DateTo $Start.AddHours(3) -TimeZoneOffset '+00:00'
    }
}
