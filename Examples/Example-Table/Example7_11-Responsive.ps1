Import-Module .\PSWriteHTML.psd1 -Force

$Test = Get-Process | Select-Object -First 2
$AllProperties = $Test | Get-Member -MemberType Properties | Where-Object {
     $_.Name -notin 'Name', 'Id'
} | Select-Object -ExpandProperty Name
# New-HTML option
New-HTML {
    New-HTMLTable -DataTable $Test {
        TableHeader -Names 'Name', 'ID' -Title 'Process Information' -BackGroundColor Green
        #TableHeader -Names 'PagedMemorySize', 'PrivateMemorySize', 'VirtualMemorySize' -Title 'Memory' -Color White -BackGroundColor Gainsboro

        New-HTMLTableHeader -Names 'ID', 'Name' -ResponsiveOperations all
        New-HTMLTableHeader -ResponsiveOperations none -Names $AllProperties
    } -ResponsivePriorityOrder 'Name', 'Id' -PagingLength 1
} -ShowHTML -Online -FilePath $PSScriptRoot\Example7_11-Responsive.html