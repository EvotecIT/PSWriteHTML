Import-Module PSWriteHTML -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'
$ReportPath = "$PSScriptRoot\Example3.html"

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *

$Report = New-GenericList

$TabNames = 'Dashboard', 'Something'

$Report.Add($(Get-HTMLPage -Open -TitleText $ReportTitle -HideLogos -AddAuthor -HideDate -UseCssLinks -UseStyleLinks -Verbose))
$Report.Add($(Get-HTMLTabHeader -TabNames $TabNames))
$Report.Add($(Get-HTMLTab -Open -TabName 'Dashboard'))
$Report.Add($(Get-HTMLContent -Open -HeaderText "Groups"))
$Report.Add($(Get-HTMLContent -Open -BackgroundShade 1 -HeaderText 'Domain Administrators' -CanCollapse ))
$Report.Add($(Get-HTMLContentDataTable -Object $DomainAdminTable -HideFooter))
$Report.Add($(Get-HTMLContent -Close))
$Report.Add($(Get-HTMLContent -Close))
$Report.Add($(Get-HTMLTab -Close))
$Report.Add($(Get-HTMLPage -Close))

Save-HTML -HTML $Report -ReportPath $ReportPath -ShowHTML

Stop-TimeLog -Time $Time -Option OneLiner