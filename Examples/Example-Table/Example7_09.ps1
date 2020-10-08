Import-Module .\PSWriteHTML.psd1 -Force

$Test = Get-Process | Select-Object -First 30
# New-HTML option
New-HTML {
    New-HTMLTable -DataTable $Test -Filtering -FilteringLocation bottom -DefaultSortIndex 0 -DefaultSortOrder Ascending -ScrollX -ScrollY -ScrollSizeY 300
} -ShowHTML -Online -FilePath $PSScriptRoot\Testing.html

# Out-HTMLView
Out-HtmlView -DataTable $Test -Filtering -FilteringLocation bottom -DefaultSortIndex 0 -DefaultSortOrder Ascending -ScrollX -ScrollY -ScrollSizeY 300