
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


$ReportName = 'MyReport'
$ReportPath = $PSScriptRoot

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *

$Report = New-GenericList

$TabNames = 'Dashboard', 'Something'

$Report.Add($(Get-HTMLOpenPage -TitleText $ReportTitle -HideLogos -Verbose -AddAuthor -HideDate -CSSName 'Sample')) #-LeftLogoString $CompanyLogo -RightLogoString $RightLogo -Verbose
$Report.Add($(Get-HTMLTabHeader -TabNames $TabNames))
$Report.Add($(Get-HTMLTabContentOpen -TabName 'Dashboard'))
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
$Report.Add($(Get-HTMLContentOpen -HeaderText "Groups 1"))
$Report.Add($(Get-HTMLColumnOpen -ColumnNumber 1 -ColumnCount 1))
$Report.Add($(Get-HTMLContentDataTable $DomainAdminTable -HideFooter))
$Report.Add($(Get-HTMLColumnClose))
$Report.Add($(Get-HTMLColumnOpen -ColumnNumber 1 -ColumnCount 1))
$Report.Add($(Get-HTMLContentDataTable $DomainAdminTable -HideFooter))
$Report.Add($(Get-HTMLColumnClose))
$Report.Add($(Get-HTMLContentClose))

$Report.Add($(Get-HTMLContentOpen -HeaderText "Groups 2"))
$Report.Add($(Get-HTMLColumnOpen -ColumnNumber 1 -ColumnCount 1))
$Report.Add($(Get-HTMLContentDataTable $Allusers -HideFooter))
$Report.Add($(Get-HTMLColumnClose))
$Report.Add($(Get-HTMLContentClose))

$Report.Add($(Get-HTMLTabContentClose))

Save-HTMLReport -ReportContent $Report -ReportName $ReportName -ReportPath $ReportPath -ShowReport


Stop-TimeLog -Time $Time -Option OneLiner