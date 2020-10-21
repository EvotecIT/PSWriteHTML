Import-Module .\PSWriteHTML.psd1 -Force

$DataTable3 = @(
    [PSCustomObject] @{
        'Tree Parent?'                                      = 'Testing Tree ?'
        'Other Tree (Rigth)'                                = 'Ok You mean Me (Test)'
        'Hierarchy Table Recaluculation interval (minutes)' = "\\*\NETLOGON"
        "Test"                                              = "\\Ooops\C$\Windows\System32\config\netlogon.dns"
        "\\*\SYSVOL"                                        = 'Test me \\*\SYSVOL and \\*\NETLOGON shares.'
        "\\*\NETLOGON"                                      = 'Test me \\*\SYSVOL and \\*\NETLOGON shares.'
        'Test^'                                             = 'Oops1'
        "Hello+Motto"                                       = 'Oops2'
        'Hello|Motto'                                       = 'Oops3'
        'Hello{Value}'                                      = 'Oops4'
        'Hello$Value'                                       = 'Oops5'
        'Hello.Value'                                       = 'Oops6'
        'Hello Value'                                       = 'Oops7.Test'
        "TestOt"                                            = "MSFT_NetAdapter (CreationClassName = `"MSFT_NetAdapter`", DeviceID = `"{49B2B54A-37B5-4130-8D41-AAAD57854F3A}`", SystemCreationClassName = `"CIM_NetworkPort`", SystemName = `"EVOWIN.ad.evotec.xyz`")"
        "Test3"                                             = "MSFT_NetRoute (InstanceID = `";C?8;@B8??:8:9??55;?55:8:8:8:55;`")"
    }
)
#$DataTable3 | ConvertTo-Json

#$DataTable3 | ConvertTo-JsonLiteral | ConvertFrom-Json

#$DataTable3 | Out-HtmlView -DataStore JavaScript -FilePath $PSScriptRoot\Example7_10_DataStoreJava.html -Online

#$T = Get-HotFix -ComputerName AD1 | Sort-Object -Property InstalledOn -Descending | Select-Object -First 1
$T | Out-HtmlView -DataStore JavaScript -FilePath $PSScriptRoot\Example7_10_DataStoreJava.html -Online -Filtering

<#

"NetAdapter":"MSFT_NetAdapter (CreationClassName = "MSFT_NetAdapter", DeviceID = "{49B2B54A-37B5-4130-8D41-AAAD57854F3A}", SystemCreationClassName = "CIM_NetworkPort", SystemName = "EVOWIN.ad.evotec.xyz")",
"NetRoute":"MSFT_NetRoute (InstanceID = ";C?8;@B8??:8:9??55;?55:8:8:8:55;")",

"InterfaceAlias":"vEthernet (External Switch)",
"InterfaceIndex":14,
"InterfaceDescription":"Hyper-V Virtual Ethernet Adapter #2",
"NetAdapter":"MSFT_NetAdapter (CreationClassName = "MSFT_NetAdapter", DeviceID = "{49B2B54A-37B5-4130-8D41-AAAD57854F3A}", SystemCreationClassName = "CIM_NetworkPort", SystemName = "EVOWIN.ad.evotec.xyz")",
"NetRoute":"MSFT_NetRoute (InstanceID = ";C?8;@B8??:8:9??55;?55:8:8:8:55;")",
"SourceAddress":"192.168.240.221",
"NameResolutionSucceeded":"True",
"BasicNameResolution":"Microsoft.DnsClient.Commands.DnsRecord_A",
"LLMNRNetbiosRecords":"Microsoft.DnsClient.Commands.DnsRecord_A",

"__SERVER":"AD1",
"__NAMESPACE":"root\\cimv2",
"__PATH":"\\\\AD1\\root\\cimv2:Win32_QuickFixEngineering.HotFixID=\"KB4577015\",ServicePackInEffect=\"\"",
"Caption":"https://support.microsoft.com/help/4577015",
"CSName":"AD1",
"Description":"Security Update",
"FixComments":"",
"HotFixID":"KB4577015",
"InstallDate":"",
"InstalledBy":"NT AUTHORITY\\SYSTEM",
"Name":"",
"ServicePackInEffect":"",
"Status":"",
"Scope":"System.Management.ManagementScope",
"Path":"\AD1
oot	mv2:Win32_QuickFixEngineering.HotFixID="KB4577015",ServicePackInEffect=""",
"Options":"System.Management.ObjectGetOptions",
"ClassPath":"\AD1
oot	mv2:Win32_QuickFixEngineering",
"Properties":"System.Management.PropertyDataCollection",
"SystemProperties":"System.Management.PropertyDataCollection",
"Qualifiers":"System.Management.QualifierDataCollection",
#>