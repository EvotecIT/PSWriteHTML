Import-Module ..\PSWriteHTML -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'
$ReportPath = "$PSScriptRoot\Example3.html"

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *

$Report = New-GenericList

$TabNames = 'Dashboard', 'Something'

$ImageLink = 'https://evotec.xyz/wp-content/uploads/2015/05/Logo-evotec-012.png'

#$Report.Add($(New-HTML -Open -TitleText $ReportTitle -AddAuthor -HideDate -UseCssLinks -UseStyleLinks -RightLogoString $ImageLink -Verbose))
$Report.Add($(New-HTML -Open -TitleText $ReportTitle -AddAuthor -HideDate -RightLogoString $ImageLink -Verbose))
$Report.Add($(Get-HTMLTabHeader -TabNames $TabNames))
$Report.Add($(Get-HTMLTab -Open -TabName 'Dashboard'))
$Report.Add($(Get-HTMLContent -Open -HeaderText "Groups"))
$Report.Add($(Add-HTMLHorizontalLine))
$Report.Add($(Get-HTMLContent -Open -BackgroundShade 1 -HeaderText 'Domain Administrators' -CanCollapse ))
$Report.Add($(Get-HTMLContentDataTable -Object $DomainAdminTable -HideFooter))
$Report.Add($(Get-HTMLContent -Close))
$Report.Add($(Get-HTMLContent -Close))
$Report.Add($(Get-HTMLTab -Close))
$Report.Add($(New-HTML -Close))

Save-HTML -HTML $Report -FilePath $ReportPath -ShowHTML

Stop-TimeLog -Time $Time -Option OneLiner