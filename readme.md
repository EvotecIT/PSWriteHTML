<p align="center">
  <a href="https://www.powershellgallery.com/packages/PSWriteHTML"><img src="https://img.shields.io/powershellgallery/v/PSWriteHTML.svg"></a>
  <a href="https://www.powershellgallery.com/packages/PSWriteHTML"><img src="https://img.shields.io/powershellgallery/vpre/PSWriteHTML.svg?label=powershell%20gallery%20preview&colorB=yellow"></a>
  <a href="https://github.com/EvotecIT/PSWriteHTML"><img src="https://img.shields.io/github/license/EvotecIT/PSWriteHTML.svg"></a>
</p>

<p align="center">
  <a href="https://www.powershellgallery.com/packages/PSWriteHTML"><img src="https://img.shields.io/powershellgallery/p/PSWriteHTML.svg"></a>
  <a href="https://github.com/EvotecIT/PSWriteHTML"><img src="https://img.shields.io/github/languages/top/evotecit/PSWriteHTML.svg"></a>
  <a href="https://github.com/EvotecIT/PSWriteHTML"><img src="https://img.shields.io/github/languages/code-size/evotecit/PSWriteHTML.svg"></a>
  <a href="https://github.com/EvotecIT/PSWriteHTML"><img src="https://img.shields.io/powershellgallery/dt/PSWriteHTML.svg"></a>
</p>

<p align="center">
  <a href="https://twitter.com/PrzemyslawKlys"><img src="https://img.shields.io/twitter/follow/PrzemyslawKlys.svg?label=Twitter%20%40PrzemyslawKlys&style=social"></a>
  <a href="https://evotec.xyz/hub"><img src="https://img.shields.io/badge/Blog-evotec.xyz-2A6496.svg"></a>
  <a href="https://www.linkedin.com/in/pklys"><img src="https://img.shields.io/badge/LinkedIn-pklys-0077B5.svg?logo=LinkedIn"></a>
</p>

# PSWriteHTML - PowerShell Module

`PSWriteHTML` is fork of [ReportHTML](https://github.com/azurefieldnotes/ReportHTML/) module. I've forked [ReportHTML](https://github.com/azurefieldnotes/ReportHTML/) due to it being outdated and not really maintained. I also wanted to address some problems it has and add more features. As it stands `PSWriteHTML` doesn't use same naming convention as [ReportHTML](https://github.com/azurefieldnotes/ReportHTML/) therefore you can have both. Keep in mind the approach on building html is much more simplified and I'm adding more and more features as I go (fixes included).

## How to install

While you can take sources and use it from here, **PSWriteHTML** actually is composed of multiple other of my modules. To get it up and running you will need ***PSSharedGoods**, and **PSSharedGoods** will need **Connectimo** and **PSWriteColor**. While **Connectimo** or **PSWriteColor** aren't needed for **PSWriteHTML**, **PSSharedGoods** uses them for some of the commands and it will fail without them. You can get all that from sources but if you **just want** to use my modules you should use `Install-Module` command. It's available in PowerShell 5.1. As an added bonus when I publish modules to **PowerShellGallery** I remove any junk, minimize modules to a single file which makes them faster to load and use. I really encourage you to use module from PowerShellGallery and treat **GitHub** as highely development version.

### To install

```powershell
Install-Module -Name PSWriteHTML -AllowClobber -Force
```

Force and AllowClobber aren't really nessecary but they do skip errors in case some appear.

### And to update

```powershell
Update-Module -Name PSWriteHTML
```

That's it. Whenever there's new version you simply run the command and you can enjoy it. Remember, that you may need to close, reopen PowerShell session if you have already used module before updating it.

**The important thing** is if something works for you on production, keep using it till you test the new version on a test computer. I do changes that may not be big, but big enough that auto-update will break your code. For example, small rename to a parameter and your code stops working! Be responsible!

I do plan on removing dependency on **PSSharedGoods**, **PSWriteColor** and **Connectimo** in the future (as I only use **Colors**) from PSSharedGoods but for now it is what it is.

## Changelog

- 0.0.42 - 2019.07.01
  - [x] New-HTMLTableConditionalFormatting
    - [ ] Fix for Powershell Core, where conditional formatting wouldn't show up

- 0.0.41 - 2019.06.30
  - [x] New-HTMLTableHeader - removing need for AddRow switch
    - [ ] If used with only Title it will assume AddRow
    - [ ] If used with Names it will assume merging
    - [ ] If used with Names without Title it will assume styling
    - [ ] Left AddRow for compatibility reasons, may remove it in future

- 0.0.40 - 2019.06.29 - https://evotec.xyz/all-your-html-tables-are-belong-to-us/
  - [x] New-HTMLTable features
    - [x] FixedHeader/FixedFooter options
    - [x] Scrolling
      - ScrollX,
      - ScrollY, ScrollSizeY
      - FreezeColumnsLeft, FreezeColumnsRight
    - [x] ResponivePriorityOrder, ResponsivePriorityOrderIndex
  - [x] New-HTMLTableHeader - **new command**
    - [x] Mergin header, styling header, adding header row


- 0.0.39 - 2019.06.20
  - Fix for DefaultSortColumn
  - Fix for DefaultSortOrder when set to descending

- 0.0.38 - 2019.06.17 - http://evotec.xyz/dashimo-pswritehtml-charting-icons-and-few-other-changes
  - Added support for Bar Charts/Line Charts
  - Added support for icons in tabs
  - Added support for controling tabs
  - Fixes for tables in multiple places
  - Ability to control buttons behavior
  - Many many more, it's a big release

- 0.0.34 - 2019.06.02
  - Fix for New-HTMLListItem to support multiple Texts

- 0.0.33 - 2019.05.28
  - New-HTMLTable - Sorting orderd for DateTime (added by ferwe/Ferdi Weiner)
  - Removed New-HTMLChart temporary as it will be rebuilt

## Advantages over ReportHTML:

-   faster report building (from 20+ seconds to 0-2 seconds)
-   updated libraries
-   bunch of different, new features
-   easier building HTML


## Credits

[Matthew Quickenden](https://www.linkedin.com/in/matthewquickenden/) ([@lucidqdreams](https://github.com/lucidqdreams)) - author of  ReportHTML - without him this wouldn't be possible.

## Projects using PSWriteHTML (to give you ideas what you can do):

- [Statusimo](https://github.com/EvotecIT/Statusimo) is a PowerShell module that is able to generate a Status Page entirely from PowerShell.
- [Dashimo](https://github.com/EvotecIT/Dashimo) is a PowerShell module that makes generating Dashboards, nice looking HTML, a breeze.
- [Emailimo](https://github.com/EvotecIT/Emailimo) is a PowerShell module that makes writting nice looking HTML emails, easy!
- [Out-HTMLView](https://evotec.xyz/out-htmlview-html-alternative-to-out-gridview/) is a PowerShell cross-platform command alternative to Out-GridView

![Out-HTMLView](https://evotec.xyz/wp-content/uploads/2019/04/Out-HtmlView.gif)

Following external libaries and frameworks are in use. They make `PSWriteHTML` what it is now. This list is dynamic and doesn't cover everything yet.

For colors you can visit this [online page](https://evotec.xyz/wp-content/uploads/2019/05/Example-Colors.html).

### PSWriteHTML - External JS Framework - DataTables

Following JS Framework is intergrated as part of this module. It's responsible for building Tables

![DataTables Example](https://evotec.xyz/wp-content/uploads/2019/03/img_5c9fe366e4906.png)

It was downloaded from https://datatables.net/download/ with following settings.

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

-   [x] Extensions:
    -   [x] Downloaded from https://github.com/Stuk/jszip (3.1.5)
        -   [x] JSZip Required for the Excel HTML5 export button.v2.5.0
    -   [x] DataTables Package https://datatables.net/download/ but with separate file
        -   [x] pdfmake Required for the PDF HTML5 export button.v0.1.36
    -   [x] ChartJS Package - https://github.com/chartjs/Chart.js/releases
        -   [x] ChartJS - version 2.7.3 (required for charts)

### PSWriteHTML - External JS Framework -EnlighterJS

**PSWriteHTML** provides built-in EnlighterJS JavaScript. It's responsible for building Code Blocks

![EnlighterJS Example](https://evotec.xyz/wp-content/uploads/2019/03/img_5c9fea1322df8.png)

This allows for **code blocks** support. Currently it uses Release Candidate version as it's first version to support **PowerShell highlighting** and many additional languages. It will be updated to new version

-   [x] Downloaded from https://github.com/EnlighterJS/EnlighterJS/tree/v3.0.0-RC1

#### Following languages are supported for New-HTMLCodeBlock

-   [x] **Assembly** (assembly, asm)
-   [x] **AVR Assembly** (avrassembly, avrasm)
-   [x] **C/C++** (c,cpp, c++)
-   [x] **C#** (csharp)
-   [x] **CSS** (css)
-   [x] **Cython** (cython)
-   [x] **CordPro** (cordpro)
-   [x] **diff** (diff)
-   [x] **Dockerfile** (docker, dockerfile)
-   [x] **Generic** (generic, standard) - default highlighting scheme
-   [x] **Groovy** (groovy)
-   [x] **Go** (go, golang)
-   [x] **HTML** (html)
-   [x] **Ini** (ini, conf)
-   [x] **Java** (java)
-   [x] **Javascript** (js, javascript, jquery, mootools, ext.js)
-   [x] **JSON** (json)
-   [x] **Kotlin** (kotlin)
-   [x] **LESS** (less)
-   [x] **LUA** (lua)
-   [x] **Markdown** (gfm, md, markdown)
-   [x] **Matlab/Octave** (octave, matlab)
-   [x] **NSIS** (nsis)
-   [x] **PHP** (php)
-   [x] **Powerhsell** (powershell)
-   [x] **Prolog** (prolog)
-   [x] **Python** (py, python)
-   [x] **RAW** (raw) - raw code without highlighting with EnlighterJS container styles!
-   [x] **Ruby** (ruby)
-   [x] **Rust** (rust)
-   [x] **SCSS** (scss, sass)
-   [x] **Shellscript** (shell, bash)
-   [x] **SQL** (sql)
-   [x] **Squirrel** (squirrel)
-   [x] **Swift** (swift)
-   [x] **Typescript** (typescript)
-   [x] **VHDL** (vhdl)
-   [x] **VisualBasic** (visualbasic, vb)
-   [x] **XML** (xml)
-   [x] **YAML** (yaml)

#### Following themes are supported for New-HTMLCodeBlock

-   [x] **Enlighter** (enlighter, standard) - Enlighter`s default Theme
-   [x] **Classic** (classic) - SyntaxHighlighter inspired
-   [x] **Bootstrap** (bootstrap4) - Bootstrap 4 inpired themes, high contrast
-   [x] **Beyond** (beyond) - BeyondTechnology Theme
-   [x] **Godzilla** (godzilla) - A MDN inspired Theme
-   [x] **Eclipse** (eclipse) - Eclipse inspired
-   [x] **MooTwo** (mootwo) - Inspired by the MooTools Website
-   [x] **Droide** (droide) - Modern, minimalistic
-   [x] **Minimal** (minimal) - Bright, High contrast
-   [x] **Atomic** (atomic) - Dark, Colorful
-   [x] **Dracula** (dracula) - Dark, using official [draculatheme](https://draculatheme.com/) colorscheme
-   [x] **Rowhammer** (rowhammer) - Light, Transparent, divided rows
