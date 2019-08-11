Import-Module PSParseHTML -Force

Format-HTML -File 'C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Examples\Example25-Toasts\Example25.html' -OutputFile $PSScriptRoot\Output\Example.Toasts.html
Optimize-ResourceFile -File 'C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Resources\CSS\datatables.min.css' -OutputFile $PSScriptRoot\Output\Example.DataTables.css
Optimize-ResourceFile -File 'C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Resources\JS\HideSection.js' -OutputFile $PSScriptRoot\Output\Example.HideSection.js
Optimize-ResourceFile -File 'C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Resources\JS\jquery-3.3.1.min.js' -OutputFile $PSScriptRoot\Output\Example.Jquery.js
