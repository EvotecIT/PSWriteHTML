Import-Module .\PSWriteHTML.psd1 -Force

Get-Process | Select-Object -First 5 | Out-HtmlView -PriorityProperties PM, NPM, Company -DefaultSortColumn Name, NPM -Filtering -FilteringLocation Both -FilePath $PSScriptRoot\Test.html

Get-Process | Select-Object -First 5 | Out-HtmlView -DefaultSortIndex 5, 2 -HideFooter

Get-Process | Select-Object -First 5 | Out-HtmlView -DefaultSortIndex 5, 2 -HideFooter -ScrollX