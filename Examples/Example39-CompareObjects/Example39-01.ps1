Import-Module $PSScriptRoot\..\..\PSWriteHTML.psd1 -Force

<#
$Data = Get-ChildItem -Path $Env:USERPROFILE\Desktop
Pause
$Data1 = Get-ChildItem -Path $Env:USERPROFILE\Desktop
Pause
$Data2 = Get-ChildItem -Path $Env:USERPROFILE\Desktop
$Higlights = Compare-HTMLTable -Objects $Data, $Data1, $Data2 -MatchingProperty 'FullName' -Standard
return
#>

$Users1 = Get-ADUser -Filter * | Select-Object -First 5 SamAccountName, GivenName, Name, UserPrincipalName, Enabled, ObjectClass, DistinguishedName, SID
$Users2 = Get-ADUser -Filter * | Select-Object -First 7 SamAccountName, GivenName, Name, UserPrincipalName, Enabled, ObjectClass, DistinguishedName, SID
#$Users3 = Get-ADUser -Filter * | Select-Object -First 2 SamAccountName, GivenName, Name, UserPrincipalName, Enabled, ObjectClass, DistinguishedName, SID
$Users2[0].Enabled = $false
$Users2[0].GivenName = 'test'
$Users2[3].SamAccountName = 'test'
$Users2[4].UserPrincipalName = 'ole@ole.pl'
$Users2[0].UserPrincipalName = 'Oops@nope.pl'
$Users2[5].UserPrincipalName = 'Oops@nope.pl'

$Users3 = Get-ADUser -Filter * | Select-Object -First 4 SamAccountName, GivenName, Name, UserPrincipalName, Enabled, ObjectClass, DistinguishedName, SID


$Higlights = Compare-HTMLTable -Objects $Users1, $Users2, $Users3 -MatchingProperty 'DistinguishedName' -Standard

#$Higlights = Compare-HTMLTable -Objects $Process1,$Process2 -MatchingProperty 'ID' -standard


return

New-HTML {
    $Higlights = Compare-HTMLTable -Objects @($Users1, $Users2) -MatchingProperty 'DistinguishedName'
    New-HTMLTable -DataTable $Users1
    New-HTMLTable -DataTable $Users2 {
        $Higlights[0]
    }
    New-HTMLTable -DataTable $Users3 {
        $Higlights[1]
    }
} -Online -ShowHTML -FilePath $Env:USERPROFILE\Desktop\Test.html