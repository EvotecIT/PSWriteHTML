# PSWriteHTML - PowerShell Module

`PSWriteHTML` is fork of `ReportHTML` module. I've forked `ReportHTML` due to it being outdated and not really maintained anymore. I also wanted to address some problems it has and possibly add more features. As it stands currently `PSWriteHTML` is replacement for `ReportHTML` but in next days/weeks/months most likely it will be totally different module.

## Advantages over ReportHTML:
- faster report building (from 20+ seconds to 2seconds)
- updated libraries


Following external libaries and frameworks are in use. They make `PSWriteHTML` what it is now. This list is dynamic and doesn't cover everything yet.

### External JS Framework

Following JS Framework is intergrated as part of this module. It was downloaded from https://datatables.net/download/ with following settings.

- [x] Styling Framework:
    - [x] DataTables' default styling.v1.10.18
- [x] Selected Packages:
    - [x] jQuery 3 DataTables requires jQuery. Don't select either version if you already have it.v3.3.1
    - [x] Enhance HTML tables with advanced interaction controls.v1.10.18
- [x] Extensions:
    - [x] AutoFill Excel-like click and drag copying and filling of data.v2.3.2
    - [x] Buttons A common framework for user interaction buttons.v1.5.4
    - [x] Column visibility End user buttons to control column visibility.v1.5.4
    - [ ] Flash export Create Excel, PDF, CSV files and copy data from the table. For legacy browsers.v1.5.4
    - [x] HTML5 export Copy to clipboard and create Excel, PDF and CSV files from the table's data.v1.5.4
        - [ ] JSZip Required for the Excel HTML5 export button.v2.5.0
        - [ ] pdfmake Required for the PDF HTML5 export button.v0.1.36
    - [x] Print view Button that will display a printable view of the table.v1.5.4
    - [x] ColReorder Click-and-drag column reordering.v1.5.0
    - [x] FixedColumns Fix one or more columns to the left or right of a scrolling table.v3.2.5
    - [x] FixedHeader Sticky header and / or footer for the table.v3.1.4
    - [x] KeyTable Keyboard navigation of cells in a table, just like a spreadsheet.v2.5.0
    - [x] Responsive Dynamically show and hide columns based on the browser size.v2.2.2
    - [x] owGroup Show similar data grouped together by a custom data point.v1.1.0
    - [x] RowReorder Click-and-drag reordering of rows.v1.2.4
    - [x] Scroller Virtual rendering of a scrolling table for large data sets.v1.5.0
    - [x] Select Adds row, column and cell selection abilities to a table.v1.2.6

JSZip and PDFMake are not downloaded as part of this package. They fail to import properly hence they are not bundled as one minified version.

### Additionally separatly following JS frameowrks are loaded:

- [x] Downloaded from https://github.com/Stuk/jszip
    - [x] JSZip Required for the Excel HTML5 export button.v2.5.0
- [x] DataTables Package https://datatables.net/download/ but with separate file
    - [x] pdfmake Required for the PDF HTML5 export button.v0.1.36