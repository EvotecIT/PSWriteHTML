
Import-Module PSWriteHTML -Force


$Time = Start-TimeLog

$ReportTitle = 'Test'


#$ReportSavePath = "$($Env:TEMP)\test.html"

#Dashboard Report
#$FinalReport = New-Object 'System.Collections.Generic.List[System.Object]'
#$FinalReport.Add($(Get-HTMLOpenPage -TitleText $ReportTitle -LeftLogoString $CompanyLogo -RightLogoString $RightLogo))
#$FinalReport.Add($(Get-HTMLTabHeader -TabNames $tabarray))
#$FinalReport.Add($(Get-HTMLTabContentopen -TabName $tabarray[0] -TabHeading ("Report: " + (Get-Date -Format MM-dd-yyyy))))
#$FinalReport.Add($(Get-HTMLContentOpen -HeaderText "Company Information"))
#$FinalReport.Add($(Get-HTMLContentTable $CompanyInfoTable))
#$FinalReport.Add($(Get-HTMLContentClose))

#$Day = (Get-Date).Day
#$Month = (Get-Date).Month
#$Year = (Get-Date).Year
#$ReportName = ("$Day - $Month - $Year - AD Report")

$Report = New-GenericList

$TabNames = 'Dashboard', 'Something'

$Value = Get-HTMLOpenPage -TitleText $ReportTitle -LeftLogoString $CompanyLogo -RightLogoString $RightLogo -Verbose

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName

$Report.Add($Value)
$Report.Add($(Get-HTMLContentOpen -HeaderText "Groups"))
$Report.Add($(Get-HTMLColumn1of2))
$Report.Add($(Get-HTMLContentOpen -BackgroundShade 1 -HeaderText 'Domain Administrators' -CanCollapse ))
$Report.Add($(Get-HTMLContentDataTable $DomainAdminTable -HideFooter))
$Report.Add($(Get-HTMLContentClose))
$Report.Add($(Get-HTMLColumnClose))
$Report.Add($(Get-HTMLColumn2of2))
$Report.Add($(Get-HTMLContentOpen -HeaderText 'Enterprise Administrators') )
$Report.Add($(Get-HTMLContentDataTable $EnterpriseAdminTable -HideFooter))
$Report.Add($(Get-HTMLContentClose))
$Report.Add($(Get-HTMLColumnClose))
$Report.Add($(Get-HTMLContentClose))

Save-HTMLReport -ReportContent $Report -ShowReport -ReportName $ReportName -ReportPath $ReportSavePath


Stop-TimeLog -Time $Time -Option OneLiner