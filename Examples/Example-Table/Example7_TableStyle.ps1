Import-Module .\PSWriteHTML.psd1 -Force

$Table = Get-Process | Select-Object -First 3
New-HTML -ShowHTML -HtmlData {
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Yellow -TextColor Aquamarine -TextAlign center -Type RowOdd
    New-HTMLTableStyle -BackgroundColor Red -TextColor Aquamarine -Type Button
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type RowEven
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type Row
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor DarkSlateGray -TextColor Aquamarine -TextAlign center -Type Header
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Orange -TextColor Aquamarine -TextAlign center -Type Footer
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Orange -TextColor Aquamarine -TextAlign center -Type RowSelectedEven
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Green -TextColor Aquamarine -TextAlign center -Type RowSelectedOdd
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Yellow -TextColor Aquamarine -TextAlign center -Type RowHover
    New-HTMLTableStyle -FontFamily 'Calibri' -BackgroundColor Red -TextColor Aquamarine -TextAlign center -Type RowHoverSelected
    New-HTMLTableStyle -Type Header -BorderLeftStyle dashed -BorderLeftColor Red -BorderLeftWidthSize 1px
    New-HTMLTableStyle -Type Footer -BorderLeftStyle dotted -BorderLeftColor Red -BorderLeftWidthSize 1px
    New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle solid
    New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle solid
    New-HTMLTableStyle -Type Footer -BorderTopStyle none -BorderTopColor Red -BorderTopWidthSize 5px -BorderBottomColor Yellow -BorderBottomStyle none
    New-HTMLTable -DataTable $table -HideButtons {

    } -DisablePaging
} -FilePath $PSScriptRoot\Example7_TableStyle.html -Online