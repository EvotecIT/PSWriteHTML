Import-Module PSWriteHTML -Force

Get-Process | Select-Object -First 5 | Out-HtmlView -PriorityProperties PM, NPM, Company -DefaultSortColumn Name, NPM

Get-Process | Select-Object -First 5 | Out-HtmlView -DefaultSortIndex 5, 2