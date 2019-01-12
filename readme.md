# PSWriteHTML - PowerShell Module

`PSWriteHTML` is fork of `ReportHTML` module. I've forked `ReportHTML` due to it being outdated and not really maintained anymore. I also wanted to address some problems it has and possibly add more features. As it stands currently `PSWriteHTML` is replacement for `ReportHTML` but in next days/weeks/months most likely it will be totally different module.

Since PSWriteHTML currently uses same commands those commands will need to be renamed to prevent clashing with ReportHTML.

## Advantages over ReportHTML:

-   faster report building (from 20+ seconds to 0-2 seconds)
-   updated libraries
-   bunch of different, new features

Following external libaries and frameworks are in use. They make `PSWriteHTML` what it is now. This list is dynamic and doesn't cover everything yet.

### External JS Framework

Following JS Framework is intergrated as part of this module. It was downloaded from https://datatables.net/download/ with following settings.

-   [x] Styling Framework:
    -   [x] DataTables' default styling.v1.10.18
-   [x] Selected Packages:
    -   [x] jQuery 3 DataTables requires jQuery. Don't select either version if you already have it.v3.3.1
    -   [x] Enhance HTML tables with advanced interaction controls.v1.10.18
-   [x] Extensions:
    -   [x] AutoFill Excel-like click and drag copying and filling of data.v2.3.2
    -   [x] Buttons A common framework for user interaction buttons.v1.5.4
    -   [x] Column visibility End user buttons to control column visibility.v1.5.4
    -   [ ] Flash export Create Excel, PDF, CSV files and copy data from the table. For legacy browsers.v1.5.4
    -   [x] HTML5 export Copy to clipboard and create Excel, PDF and CSV files from the table's data.v1.5.4
        -   [ ] JSZip Required for the Excel HTML5 export button.v2.5.0
        -   [ ] pdfmake Required for the PDF HTML5 export button.v0.1.36
    -   [x] Print view Button that will display a printable view of the table.v1.5.4
    -   [x] ColReorder Click-and-drag column reordering.v1.5.0
    -   [x] FixedColumns Fix one or more columns to the left or right of a scrolling table.v3.2.5
    -   [x] FixedHeader Sticky header and / or footer for the table.v3.1.4
    -   [x] KeyTable Keyboard navigation of cells in a table, just like a spreadsheet.v2.5.0
    -   [x] Responsive Dynamically show and hide columns based on the browser size.v2.2.2
    -   [x] RowGroup Show similar data grouped together by a custom data point.v1.1.0
    -   [x] RowReorder Click-and-drag reordering of rows.v1.2.4
    -   [x] Scroller Virtual rendering of a scrolling table for large data sets.v1.5.0
    -   [x] Select Adds row, column and cell selection abilities to a table.v1.2.6

JSZip and PDFMake are not downloaded as part of this package. They fail to import properly hence they are not bundled as one minified version.

### Additionally separately following JS frameworks are loaded:

-   [x] Downloaded from https://github.com/Stuk/jszip
    -   [x] JSZip Required for the Excel HTML5 export button.v2.5.0
-   [x] DataTables Package https://datatables.net/download/ but with separate file
    -   [x] pdfmake Required for the PDF HTML5 export button.v0.1.36
-   [x] ChartJS Package - https://github.com/chartjs/Chart.js/releases
    -   [x] ChartJS - version 2.7.3 (required for charts)

### PSWriteHTML - Library EnligherJS

PSWriteHTML preovides built-in EnligherJS JavaScript. This allows for code blocks support

## Following languages are supported for New-HTMLCodeBlock

-   **Assembly** (assembly, asm)
-   **AVR Assembly** (avrassembly, avrasm)
-   **C/C++** (c,cpp, c++)
-   **C#** (csharp)
-   **CSS** (css)
-   **Cython** (cython)
-   **CordPro** (cordpro)
-   **diff** (diff)
-   **Dockerfile** (docker, dockerfile)
-   **Generic** (generic, standard) - default highlighting scheme
-   **Groovy** (groovy)
-   **Go** (go, golang)
-   **HTML** (html)
-   **Ini** (ini, conf)
-   **Java** (java)
-   **Javascript** (js, javascript, jquery, mootools, ext.js)
-   **JSON** (json)
-   **Kotlin** (kotlin)
-   **LESS** (less)
-   **LUA** (lua)
-   **Markdown** (gfm, md, markdown)
-   **Matlab/Octave** (octave, matlab)
-   **NSIS** (nsis)
-   **PHP** (php)
-   **Powerhsell** (powershell)
-   **Prolog** (prolog)
-   **Python** (py, python)
-   **RAW** (raw) - raw code without highlighting with EnlighterJS container styles!
-   **Ruby** (ruby)
-   **Rust** (rust)
-   **SCSS** (scss, sass)
-   **Shellscript** (shell, bash)
-   **SQL** (sql)
-   **Squirrel** (squirrel)
-   **Swift** (swift)
-   **Typescript** (typescript)
-   **VHDL** (vhdl)
-   **VisualBasic** (visualbasic, vb)
-   **XML** (xml)
-   **YAML** (yaml)

## Following themes are supported for New-HTMLCodeBlock

-   **Enlighter** (enlighter, standard) - Enlighter`s default Theme
-   **Classic** (classic) - SyntaxHighlighter inspired
-   **Bootstrap** (bootstrap4) - Bootstrap 4 inpired themes, high contrast
-   **Beyond** (beyond) - BeyondTechnology Theme
-   **Godzilla** (godzilla) - A MDN inspired Theme
-   **Eclipse** (eclipse) - Eclipse inspired
-   **MooTwo** (mootwo) - Inspired by the MooTools Website
-   **Droide** (droide) - Modern, minimalistic
-   **Minimal** (minimal) - Bright, High contrast
-   **Atomic** (atomic) - Dark, Colorful
-   **Dracula** (dracula) - Dark, using official [draculatheme](https://draculatheme.com/) colorscheme
-   **Rowhammer** (rowhammer) - Light, Transparent, divided rows
