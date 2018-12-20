Import-Module PSWriteHTML -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'

$ReportName = 'Example3'
$ReportPath = $PSScriptRoot

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *

$Report = New-GenericList

$TabNames = 'Dashboard', 'Something'

$Report.Add($(Get-HTMLOpenPage -TitleText $ReportTitle -HideLogos -Verbose -AddAuthor -HideDate -CSSName 'Sample' -UseCssLinks -UseStyleLinks))
$Report.Add($(Get-HTMLTabHeader -TabNames $TabNames))
$Report.Add($(Get-HTMLTabContentOpen -TabName 'Dashboard'))
$Report.Add($(Get-HTMLContentOpen -HeaderText "Groups"))
$Report.Add($(Get-HTMLContentOpen -BackgroundShade 1 -HeaderText 'Domain Administrators' -CanCollapse ))
$Report.Add($(Get-HTMLContentDataTable $DomainAdminTable -HideFooter))
$Report.Add($(Get-HTMLContentClose))
$Report.Add($(Get-HTMLColumnClose))
$Report.Add($(Get-HTMLTabContentClose))

Save-HTMLReport -ReportContent $Report -ReportName $ReportName -ReportPath $ReportPath #-ShowReport


Stop-TimeLog -Time $Time -Option OneLiner