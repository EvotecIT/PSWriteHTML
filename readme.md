# PSWriteHTML - PowerShell Module

<p align="center">
  <a href="https://dev.azure.com/evotecpl/PSWriteHTML/_build/latest?definitionId=3"><img src="https://img.shields.io/azure-devops/build/evotecpl/a5ce5d3e-9ae2-49a0-9905-53eb41205fc9/7?label=Azure%20Pipelines&style=flat-square"></a>
  <a href="https://www.powershellgallery.com/packages/PSWriteHTML"><img src="https://img.shields.io/powershellgallery/v/PSWriteHTML.svg?style=flat-square"></a>
  <a href="https://www.powershellgallery.com/packages/PSWriteHTML"><img src="https://img.shields.io/powershellgallery/vpre/PSWriteHTML.svg?label=powershell%20gallery%20preview&colorB=yellow&style=flat-square"></a>
  <a href="https://github.com/EvotecIT/PSWriteHTML"><img src="https://img.shields.io/github/license/EvotecIT/PSWriteHTML.svg?style=flat-square"></a>
</p>

<p align="center">
  <a href="https://www.powershellgallery.com/packages/PSWriteHTML"><img src="https://img.shields.io/powershellgallery/p/PSWriteHTML.svg?style=flat-square"></a>
  <a href="https://github.com/EvotecIT/PSWriteHTML"><img src="https://img.shields.io/github/languages/top/evotecit/PSWriteHTML.svg?style=flat-square"></a>
  <a href="https://github.com/EvotecIT/PSWriteHTML"><img src="https://img.shields.io/github/languages/code-size/evotecit/PSWriteHTML.svg?style=flat-square"></a>
  <a href="https://www.powershellgallery.com/packages/PSWriteHTML"><img src="https://img.shields.io/powershellgallery/dt/PSWriteHTML.svg?style=flat-square"></a>
  <a href="https://www.jsdelivr.com/package/gh/evotecit/cdn"><img src="https://img.shields.io/jsdelivr/gh/hm/evotecit/cdn?style=flat-square"></a>
</p>

<p align="center">
  <a href="https://twitter.com/PrzemyslawKlys"><img src="https://img.shields.io/twitter/follow/PrzemyslawKlys.svg?label=Twitter%20%40PrzemyslawKlys&style=flat-square"></a>
  <a href="https://evotec.xyz/hub"><img src="https://img.shields.io/badge/Blog-evotec.xyz-2A6496.svg?style=flat-square"></a>
  <a href="https://www.linkedin.com/in/pklys"><img src="https://img.shields.io/badge/LinkedIn-pklys-0077B5.svg?logo=LinkedIn&style=flat-square"></a>
</p>

`PSWriteHTML` is PowerShell Module to generate beautiful HTML reports, pages, emails without any knowledge of HTML, CSS or JavaScript. To get started basics PowerShell knowledge is required. `PSWriteHTML` is a fork of [ReportHTML](https://github.com/azurefieldnotes/ReportHTML/) module. I've forked [ReportHTML](https://github.com/azurefieldnotes/ReportHTML/) due to it being outdated and not maintained. I also wanted to address some problems it had and add more features. As it stands `PSWriteHTML` is a complete rewrite. Make sure to read blog posts provided to understand the concepts and how you can use `PSWriteHTML` for your own needs.

## How to install

While you can take sources and use it from here, **PSWriteHTML** actually is composed of multiple other of my modules. To get it up and running you will need ***PSSharedGoods**, and **PSSharedGoods** will need **Connectimo** and **PSWriteColor**. While **Connectimo** or **PSWriteColor** aren't needed for **PSWriteHTML**, **PSSharedGoods** uses them for some of the commands and it will fail without them. You can get all that from sources but if you **just want** to use my modules you should use the `Install-Module` command. It's available in PowerShell 5.1. As an added bonus when I publish modules to **PowerShellGallery** I remove any junk, minimize modules to a single file which makes them faster to load and use. I really encourage you to use the module from PowerShellGallery and treat **GitHub** as a highly development version. Since version 0.0.61 when **PSWriteHTML** is published every dependency is baked into **PSWriteHTML**. That means you don't need to download any other modules unless you want to contribute to this project.

### Installing

```powershell
Install-Module -Name PSWriteHTML -AllowClobber -Force
```

Force and AllowClobber aren't necessary but they do skip errors in case some appear.

### Updating

```powershell
Update-Module -Name PSWriteHTML
```

That's it. Whenever there's a new version you simply run the command and you can enjoy it. Remember, that you may need to close, reopen the PowerShell session if you have already used the module before updating it.

**The important thing** is if something works for you on production, keep using it till you test the new version on a test computer. I do changes that may not be big, but big enough that auto-update will break your code. For example, small rename to a parameter and your code stops working! Be responsible!

Dependencies: **PSSharedGoods**, **PSWriteColor** and **Connectimo** are only used during development. When published to PSGallery / Releases it's a merged release without any dependencies.

## Articles worth reading to understand use cases

- 🔗 [Meet Statusimo – PowerShell generated Status Page](https://evotec.xyz/meet-statusimo-powershell-generated-status-page/)
- 🔗 [Meet Dashimo – PowerShell Generated Dashboard](https://evotec.xyz/meet-dashimo-powershell-generated-dashboard/)
- 🔗 [Dashimo – Easy Table Conditional Formatting and more](https://evotec.xyz/dashimo-easy-table-conditional-formatting-and-more/)
- 🔗 [Out-HtmlView – HTML alternative to Out-GridView](https://evotec.xyz/out-htmlview-html-alternative-to-out-gridview/)
- 🔗 [Meet Emailimo – New way to send pretty emails with PowerShell](https://evotec.xyz/meet-emailimo-new-way-to-send-pretty-emails-with-powershell/)
- 🔗 [All your HTML Tables are belong to us](https://evotec.xyz/all-your-html-tables-are-belong-to-us/)
- 🔗 [Sending HTML emails with PowerShell and zero HTML knowledge required](https://evotec.xyz/sending-html-emails-with-powershell-and-zero-html-knowledge-required/)
- 🔗 [Dashimo (PSWriteHTML) – Charting, Icons and few other changes](https://evotec.xyz/dashimo-pswritehtml-charting-icons-and-few-other-changes/)
- 🔗 [Working with HTML in PowerShell just got better](https://evotec.xyz/working-with-html-in-powershell-just-got-better/)
- 🔗 [Comparing two or more objects visually in PowerShell (cross-platform)](https://evotec.xyz/comparing-two-or-more-objects-visually-in-powershell-cross-platform/)
- 🔗 [Easy way to create diagrams using PowerShell and PSWriteHTML](https://evotec.xyz/easy-way-to-create-diagrams-using-powershell-and-pswritehtml/)
- 🔗 [Nested Tabs, Diagram Updates, Diagram Events, Calendar Object and more in PSWriteHTML](https://evotec.xyz/nested-tabs-diagram-updates-diagram-events-calendar-object-and-more-in-pswritehtml/)
- 🔗 [Emailimo merged into PSWriteHTML, IE support and no dependencies](https://evotec.xyz/emailimo-merged-into-pswritehtml-ie-support-and-no-dependencies/)
- 🔗 [Active Directory DHCP Report to HTML or EMAIL with zero HTML knowledge](https://evotec.xyz/active-directory-dhcp-report-to-html-or-email-with-zero-html-knowledge/)
- 🔗 [Creating Office 365 Migration Diagram with PowerShell](https://evotec.xyz/creating-office-365-migration-diagram-with-powershell/)
- 🔗 [Advanced HTML reporting using PowerShell](https://evotec.xyz/advanced-html-reporting-using-powershell/)

## Changelog

`PSWriteHTML` undergoes changes that hopefully will make it more versalite, consistent and better.
Unfortunetly some code is very old, some code doesn't serve it's purpose anymore, and requires heavy changes that may have an impact on already deployed code.
Please make sure to read changes before updating, as we're undergoing some breaking changes.

- 0.0.150-Alpha01 (prerelease) - 2021.05.05
  - 🐛 Fixes for charts when using multiple 0 next to each other
- 0.0.149-Alpha9 (prerelease) - 2021.05.04
  - 🐛 Fixes to `ChartLegend`
  - ☑ Added `New-ChartRadialOptons` - work in progress/not functional
  - ☑ Added `New-ChartDesign` - work in progress/not functional
  - ☑ Added `New-CarouselStyle` - place holder/not functional
- 0.0.149-Alpha8 (prerelease) - 2021.04.22
  - 🐛 Fixes issue with `FontsAwesome` in offline mode after recent upgrade
  - 💡 Improved spark charts
- 0.0.149-Alpha7 (prerelease) - 2021.04.19
  - 💡 Improved `New-HTMLChart`
- 0.0.149-Alpha6 (prerelease) - 2021.04.19
  - ☑ Added two or more separate y-axis to a line charts [#153](https://github.com/EvotecIT/PSWriteHTML/issues/153)
  - ☑ Added ability to mix line charts and bar charts
  - 💡 Improved `New-ChartDataLabel`
  - ☑ Added `New-ChartMarker`
  - 💡 Improved `New-ChartLine`
- 0.0.149-Alpha5 (prerelease) - 2021.04.18
  - Libraries
    - 🔨 Upgraded `Apex Charts` from 3.26.0 to 3.26.1
- 0.0.149-Alpha4 (prerelease) - 2021.04.16
  - 🐛 Fixes issues where `Title` of `New-HTMLTable` wouldn't be used for buttons in certain circumstances
- 0.0.149-Alpha3 (prerelease) - 2021.04.16
  - Added more properties for `New-CalendarEvent` and some help content
  - Libraries
    - 🔨 Upgraded `FullCalendar` from 5.5.1 to 5.6.0
- 0.0.149-Alpha3 (prerelease) - 2021.04.16
  - Added ability to control menu items width in top navigation
- 0.0.149-Alpha2 (prerelease) - 2021.04.15
  - Padding for logo in navigation changed
- 0.0.149-Alpha1 (prerelease) - 2021.04.15
  - Added **Navigation** - this is highly experimental and requires a lot more work. Please don't use it in production because it can change daily.
    - `New-HTMLNav` - navigation option 1 can be used with:
      - `New-NavItem`
      - `New-NavLink` with nesting
    - `New-HTMLNavFloat` - navigation option 2 can be used with:
      - `New-NavFloatWidget`
      - `New-NavFloatWidgetItem`
    - `New-HTMLNavTop` - navigation option 3 can be used with:
      - `New-NavTopMenu`
      - `New-NavLink`
  - ➕ Added multiple new icons for `Fonts Awesome`
  - 🐛 Fixed `New-TableEvent`. It would not display 0 records if there are no matching records
  - 🐛 Fixed `New-ChartAxisX` usage in `New-HTMLChart` [#225](https://github.com/EvotecIT/PSWriteHTML/issues/225)
  - Libraries
    - 🔨 Upgraded `FontsAwesome` from 5.15.1 to 5.15.3
    - 🔨 Upgraded `JustGage` from 1.4.1 to 1.4.2
    - 📦 Added `Material Design Iconic Font` 2.2.0 required by some features until replaced later on
- 0.0.148 - 2021.04.02
  - 🐛 Conditional formatting/groups should now work correctly in Internet Explorer - had to downgrade some JS capabilities
- 0.0.147 - 2021.04.01
  - 💥 **Potentially breaking change**: due to changes in some defaults things could move around - for example legend may not always start at the bottom, it shouldn't affect crucial parts tho
  - 💡 Improved `New-ChartPie`,`New-ChartRadial`,`New-ChartLine`, `New-ChartBar` to convert $null or empty string as 0
  - 💡 Improved `New-ChartAxisY` with more parameters and now works within `Bar Charts`
  - 📦 Added back `New-ChartSpark` (I've removed it before for some reason)
  - 💡 Improved `New-ChartLegend` with more parameters
  - 💡 Improved `Title*` options in `New-HTMLChart`
  - 📦 Added `Subtitle*` options in `New-HTMLChart`
- 0.0.146 - 2021.03.23
  - ☑ Improves `New-TableConditionGroup`
    - ☑ Added `Row` switch
- 0.0.145 - 2021.03.20
  - ☑ Improves `New-TableCondition`
    - ☑ Added missing `ne` condtion (not equals)
    - ☑ Added `ReverseCondition` parameter which allows `ConditionValue` compared to `ColumnValue`, rather then default `ColumnValue` to `ConditionValue`.
    - ☑ Added condition `in` and `notin`
- 0.0.144 - 2021.03.20
  - ☑ Improves `New-TableCondition` and `New-TableConditionGroup` with styles when condition FAILS
    - ☑ This allows for example `New-TableCondition -Name 'BoolAsString' -Value $true -BackgroundColor Yellow -Color Green -Operator eq -ComparisonType string -Inline -FailBackgroundColor Green`
- 0.0.143 - 2021.03.18
  - ☑ Improves `New-TableCondition` by detecting non-existing column names
  - ☑ Improves `New-TableConditionGroup` by adding logic operator NONE
  - ☑ Fixes `New-TableConditionGroup` with `Inline` switch
- 0.0.142 - 2021.03.17
  - ☑ Improves `New-HTMLText` URL Link markdown parsing [#216](https://github.com/EvotecIT/PSWriteHTML/pull/216) - thank you **Alan Longstaff**
- 0.0.141 - 2021.03.17
  - ☑ Added `IncludeProperty`/`ExcludeProperty` to `New-HTMLTable`/`Out-HTMLView` for easy excluding properties we don't need
    - ☑ Example `Get-Process | Out-HtmlView -ExcludeProperty Name -First 3`
- 0.0.140 - 2021.03.17
  - ☑ Changed `New-TableCondition` parameter name from `CaseInsensitive` to `CaseSensitive`
    - ☑ This means by default conditions of strings are not case sensitive
- 0.0.139 - 2021.03.16
  - ☑ Improved `Out-HTMLView`
- 0.0.138 - 2021.03.16
  - ☑ Added alias for `New-HTMLTableOption`
  - ☑ Forces `Table` within `EmailBody` to respect `font-size` and other style options given to EmailBody
- 0.0.137 - 2021.03.16
  - ☑ Fix for timeline charts not working due to date conversion
  - ☑ Fix for chart events (I don't know how i test things)
  - ☑ Library
    - ☑ Upgrade ApexCharts from `3.22` to `3.26`
    - ☑ Upgrade VisNetwork from `9.0.3` to `9.0.4`
- 0.0.136 - 2021.03.14
  - ☑ Fixed - Values with decimals do not auto-find within html table when clicking on charts/pies [#209](https://github.com/EvotecIT/PSWriteHTML/issues/209)
  - ☑ Table Conditioning - highly improved table conditions. This requires some documentation/blog post
    - ☑ Added `New-TableCondtionGroup`
    - ☑ Improved `New-TableCondition`
    - ☑ **Let's hope I didn't break anything**
  - ☑ Added ability to configure ArrayJoin/ArrayJoinString for DataStore HTML using `New-HTMLTableOption`
  - ☑ Added `New-HTMLMap` experimental cmdlet
    - ☑ Due to that cmdlet size have become larger
  - ☑ Library
    - ☑ Updated DataTables `1.10.21` to `1.10.24`
    - ☑ Updated MomentJS to `2.29.1`
- 0.0.135 - 2021.03.07
  - ☑ Added ability to create plugins for `PSWriteHTML` -> Example: [PSWriteHTML.Maps](https://github.com/EvotecIT/PSWriteHTML.Maps)
    - ☑ Keep in mind that module is not required as the functionality is part of the PSWriteHTML module anyways - it's just an example on how to do it yourself
  - ☑ Removed `Adobe` icon from `FontsAwesome (Brands)`
  - ☑ Library
    - ☑ Updated `VisNetwork` from `9.0.2` to `9.0.3`
  - ☑ Added `Width` parameter to `New-HTMLSection` which allows `New-HTMLSection -Width 30%` or similar
  - ☑ Added `Title` field in New-DiagramNode
  - ☑ Improves ability to provide basic HTML in Label/Title in `New-DiagramNode`
- 0.0.134 - 2021.03.05
  - ☑ Fixes wrong register argument completer for `New-HTMLTextBox`
  - ☑ Fixes SearchPane not completly visible [#193](https://github.com/EvotecIT/PSWriteHTML/issues/193)
- 0.0.133 - 2021.03.04
  - ☑ Library
    - ☑ Updated DataTables ColReorder 1.5.2 -> 1.5.3
    - ☑ Updated DataTables FixedColumns 3.3.1 -> 3.3.2
    - ☑ Updated DataTables FixedHeader 3.1.7 -> 3.1.8
    - ☑ Updated DataTables 1.10.22 -> 1.10.23
    - ☑ Updated DataTables KeyTable 2.5.3 -> 2.6.0
    - ☑ Updated DataTables Responsive 2.2.6 -> 2.2.7
    - ☑ Added `DataTables SearchBuilder` 1.0.1
    - ☑ Updated DataTables SearchPanes 1.2.1 -> 1.2.2
    - ☑ Updated FancyTree `2.33` -> `2.38`
    - ☑ Updated JustGage `1.4.0` -> `1.4.1`
    - ☑ Updated FullCalendar `5.1.0 -> 5.5.1`
    - ☑ Added DataTables Search Alphabet `1.0.0 with personal PR`
    - ☑ Updated `OrgChart` from `2.2.0` to `3.1.0`, `3.1.1`
    - ☑ Updated `VisData` from `7.1.1` to `7.1.2`
    - ☑ Updated `VisNetwork` from `8.5.5` to `9.0.2`
    - ☑ Updated `VisTimeline` from `7.4.2` to `7.4.6`
    - ☑ Updated `EasyQrCode` from `4.3.0` to `4.3.2`
    - ☑ Added `DataTables Select` -> `1.3.1`
  - ☑ Added ability `OverwriteDOM` in `New-HTMLTable` to provide granular option how options are visually positioned
  - ☑ Added ability `SearchBuilder` in `New-HTMLTable` for multi-condition search
  - ☑ Added ability `SearchHighlight` in `New-HTMLTable`
  - ☑ Added ability `AlphabetSearch` in `New-HTMLTable`
  - ☑ Fixes `New-ChartLegend` hex colors but most likely all other cmdlets where more than one HEX based color was used
  - ☑ Added `HeaderTextSize` to `New-HTMLSection`
  - ☑ Added `New-TablePercentageBar` for `New-HTMLTable`
  - ☑ Added `New-ChartEvent`
  - ☑ Fixed `New-HTMLTable -DataStore JavaScript` when dollar ($) is used within column name or content
  - ☑ Improved `New-HTMLTableOption` added `ArrayJoin`,`ArrayJoinString`
  - ☑ Fixed `New-HTMLTable` export to excel would only export visible columns. Exports all again
  - ☑ Improved some CDN handling
- 0.0.132 - 2021.02.02
  - ☑ Fixed `Format/Minify` error message when `PSParseHTML` is not installed.
  - ☑ Fixed Table headers pushed to the left when using ScrollX with Tabs [#191](https://github.com/EvotecIT/PSWriteHTML/issues/191)
- 0.0.131 - 2021.01.29
  - ☑ New-HTMLTable AjaxJSON fixed - [#189](https://github.com/EvotecIT/PSWriteHTML/issues/189)
- 0.0.130 - 2021.01.16
  - ☑ Update `New-HTMLTableStyle` with more options and functionality
- 0.0.129 - 2021.01.11
  - ☑ Update `New-HTMLText` regex for urls - tnx chrisdent!
- 0.0.128 - 2021.01.09
  - ☑ Fixed Export to Excel deletes all commas [#182](https://github.com/EvotecIT/PSWriteHTML/issues/182)
- 0.0.127 - 2021.01.06
  - ☑ Reverted ApexCharts to 3.22 from 3.23 (offline version)
- 0.0.126 - 2021.01.06
  - ☑ Reverted ApexCharts to 3.22 from 3.23
    - ☑ During tab switch it would sometimes fail to display charts properly - reported to apex [#2137](https://github.com/apexcharts/apexcharts.js/issues/2137)
- 0.0.125 - 2021.01.02
  - ☑ Easy QR Code update `4.2.1` to `4.3.0`
- 0.0.124 - 2021.01.02
  - ☑ Added `New-HTMLQRCode` to provide HTML based QR codes
- 0.0.123 - 2020.12.23
  - ☑ **Potentially Breaking Changes**
    - ☑ Removed custom Headings (H1,H2,H3,H4,H5,H6) -> `New-HTMLHeading` still works just using defaults
      - ☑ It was totally inconsistent between H1-H6, probably needs new CSS for those later on that will be consistent and inline with other code
    - ☑ Removed H7 heading totally - it got there by some copy paste from internet
    - ☑ Removed custom Horizontal Line (HR) -> `New-HTMLHorizonalLine` still works just using defaults
      - ☑ Not looking good, the default one looks better, more consitent but may need some work in the future
    - ☑ `New-HTMLLogo` is now marked as obsolete. It was there from day one but it's not really customizable. New way will be given sometime in the future
      - ☑ It still works, CSS code is only added when it's used
    - ☑ Removed custom link highlights CSS. Not sure if it was ever used, hopefully not. May come back in future in better form
    - ☑ When `EmailBody` is used it will no longer put `JavaScript` or `CSS` inside HTML for advanced features such as DataTables, or anything that used to be there
      - ☑ This is to make sure EMAIL HTML is as small as possbile
      - ☑ JavaScript in emails won't work in 90% of cases and it would just add to the junk in HTML
      - ☑ However if EmailBody is used within `Email` and `AttachSelf` is used it will generate same HTML using full JS/CSS code
      - ☑ This ensures that self attach should work as it used to, at the same time providing small HTML in email
    - ☑ JavaScript/CSS is now marked as safe for email or normal HTML reports/pages. What that means some CSS/JS is marked only as being added to Email or vice versa.
  - ☑ **Improvements to CSS**
    - ☑ The goal of PSWriteHTML is to get into state where only really nessecary code is added. Less CSS is now included by default
    - ☑ Hopefully there are no major problems from those changes
    - ☑ The default margin for all elements should be `5px`, however when used within email it will be set to `0px`
      - [ ] This mainly is important for Images/Text/Headings but all other html objects such as tables and so on, also are supposed to have `5px` margin
    - ☑ It would seem `Roboto Condensed` or other fonts defined in font-family across code were never used and defaults were kicking in
      - ☑ I've now fixed it so `Roboto Condensed` is used when `Online` mode
      - ☑ In `Offline` mode it will still go back to `Sans-Serif` (usually `Arial`)
      - ☑ I've removed other `font-families` from multiple CSS files to make it visually consistent
      - [ ] May need to be revisited if `Roboto Condensed` is best choice
    - ☑ Update to `FontsAwesome` from 5.14 to 5.15.1
    - ☑ Update to `FontsAwesome` to work offline
      - ☑ Unfortunetly this means 500KB file size in CSS module size and output HTML file is 500KB bigger
      - ☑ I'm skipping including of TTF/SVG/EOT types as WOFF and WOFF2 should be enough for modern browsers
  - ☑ **Other changes**
    - ☑ Changed Tables `row height` to fit more data
    - ☑ Changed Tables `noscript` version (email + no javascript) to fit more how DataTables looks like
    - ☑ Improved HTMLTable with `Simplify` switch positioning
    - ☑ `New-HTML` added parameter `AddComment` - by default comments are not added to code now
    - ☑ Added `link` preloading for styles - not sure if it will help but why not
    - ☑ Fix for `New-DiagramOptionsLinks` setting lenght which would have resultant html error
    - ☑ `EmailTextBox` renamed to `New-HTMLTextBox`. `EmailTextBox` added as alias to that command
    - ☑ Added `Format` and `Minify` switches to `New-HTML` and `EmailBody`. Those will only be working if [PSParseHTML](https://github.com/EvotecIT/PSParseHTML) is installed.
      - [ ] `PSParseHTML` is not installed by default and you need to install it separatly `Install-Module PSParseHTML`. There is no intention of bundling it at this moment.
      - [ ] **Known issue**: Removes comment required for `Internet Explorer` javascript to not prompt when using as local file
    - ☑ Improved `New-HTMLTimelineItem` generated HTML when no color is used
    - ☑ Added `Enable-HTMLFeature` to bring JS/CSS even if it's not used
    - ☑ `Calendars` & `DataTables` & `Diagrams` should now resize/fit properly on Global Tab change
    - ☑ `Calendars` & `DataTables` & `Diagrams` are now resize/fit properly on Wizard Step Change
    - ☑ `Calendars` & `DataTables` & `Diagrams` are now resize/fit properly on Tab Panel Tab Change
    - ☑ Tracks all `tables` with `Fixed Headers`/`Footers` and `disables`/`enables` them on `tab switch`/`wizard step` switch / `tab panel` switch
  - ☑ **Diagram Changes**
    - ☑ `New-DiagramLink` - added `SmoothType`, `SmoothForceDirection` and `SmoothRoundness`
    - ☑ `New-DiagramLink` - fixed `FontAlign` which was using wrong `validateset`.
    - ☑ `Diagrams` should now fit properly upon changing tabs. It used to hide outside of screen.
  - ☑ **Library updates**
    - ☑ Update of `Apex Charts` to 3.23.0
    - ☑ Update of `VisJS` to 8.5.5
- 0.0.122 - 2020.11.18
  - ☑ Added `New-ChartDataLabel` currently supported in `New-ChartTimeLine` only
  - ☑ Improvements `New-ChartTimeLine` - added by Splaxi [#170](https://github.com/EvotecIT/PSWriteHTML/pull/170) - Thank you (WIP)
  - ☑ Added `New-ChartToolTip` currently supported in `New-ChartTimeLine` only - added by Splaxi [#170](https://github.com/EvotecIT/PSWriteHTML/pull/170) - Thank you (WIP)
  - ☑ Improvements `New-ChartAxisY`
  - ☑ Added parameter for `EmailBody`,`New-HTMLText`, `New-HTMLSpanStyle` - `LineHeight`. This allows for controling line height.
- 0.0.121 - 2020.11.15
  - ☑ Added `Accordion` (alpha)
    - ☑ `New-HTMLAccordion`
    - ☑ `New-AccordionItem`
  - ☑ Fix for `New-HTMLDiagram` to disable loader if physics is disabled, as diagram wouldn't load, and loader is not nessecary
  - ☑ Fix for `New-HTMLDiagram` to load icons properly in Chrome, IE still requires press
  - [ ] VisNetwork update from `8.5.2` to `8.5.3`
- 0.0.120 - 2020.11.07
  - ☑ Fixes partially `New-HTMLTable -FixedFooter` issue [#166](https://github.com/EvotecIT/PSWriteHTML/issues/166)
  - ☑ ApexChart update 3.20 to 3.20.1
  - ☑ VisNetwork update 8.4.1 to 8.5.2
  - ☑ VisTimeLine update 7.3.7 to 7.4.2
- 0.0.119 - 2020.10.28
  - ☑ Added ability to use nested lists in `New-HTMLList`,`EmailList`
- 0.0.118 - 2020.10.27
  - ☑ Improvements to tab switching very fast which could cause an error [#126 DATATABLE warning - Cannot reinitialize DataTable](https://github.com/EvotecIT/PSWriteHTML/issues/126)
  - [ ] Added UseDefaultCredential for `EmailServer`
- 0.0.117 - 2020.10.25
  - ☑ Fix for issue when Charts are used with Diagrams
  - ☑ `ApexCharts` update to 3.22 from 3.20.2
  - ☑ `Vis.js` update to 8.4.1 from 8.3.2
  - ☑ Small update to `New-HTMLList` with `Reversed` parameter
  - ☑ Fix for missing responsive button for `New-HTMLTable`
  - ☑ Updates to offline `DataTables` library
- 0.0.116 - 2020.10.21
  - ☑ Charts improvement for `Flex` usage (doesn't require `Panel` anymore for positioning)
- 0.0.115 - 2020.10.21
  - ☑ Updates to DataStore Javascript
- 0.0.114 - 2020.10.20
  - ☑ Small fix to `New-HTMLTable` with DataStore `JavaScript`
- 0.0.113 - 2020.10.19
  - ☑ `New-HTMLTable` - changes/improvements/adds
    - ☑ Reworked JS/CSS loading for DataTables. It should now load less JS/CSS code by default making HTML smaller and more readable especially if not using all features
      - [ ] Some more work in this area is required. Small breaking change was introduced
    - ☑ **Breaking Change** - Renamed `DisableColumnReorder` to `EnableColumnReorder`
      - [ ] The reason for this is that the functionality is most likely used by very few people if at all
      - [ ] This, in turn, allows me to load JS/CSS for ColumnReordering only when someone requests for this functionality
    - ☑ Added `EnableRowReorder`
    - ☑ Added `EnableKeys` (excel like movement) to `New-HTMLTable`. Probably could add more options for this via nested `New-TableXXX`
    - ☑ Added `PagingLength` to `New-HTMLTable`. This improves `PagingOptions` / `DisablePaging`.
      - If user doesn't set Paging Length it will use defaults
      - If user doesn't set Paging Options it will use default `@(15, 25, 50, 100)`
      - If user doesn't set Paging Length, but sets different Paging Options such as `@(5,10,15)`, initial paging length will be set to lowest value `5`
      - If user sets paging options and sets paging length it will set as requested
    - ☑ Added `EnableScroller` to `New-HTMLTable`. This improves `ScrollY`. It allows to load data as it appears rather than loading everything. Should be plenty useful in JavaScript DataStore for large datasets
    - [ ] Enabling Scroller doesn't require ScrollY enablement, but it will use ScrollSizeY default 500px. You can change it tho.
    - ☑ Added `EnableAutoFill` to `New-HTMLTable`
    - ☑ Improved `New-HTMLTable` to load only required CSS/JS (hopefully nothing will be broken)
    - ☑ Updated `Out-HTMLView` with all new and old parameters to keep it synced with same the features as `New-HTMLTable` - hopefully, I didn't break anything
    - ☑ Updated some `DataTables` JS/CSS versions
    - [ ] `New-HTMLTableOption` allows now to define `BoolAsString`, `NumberAsString` and `DateTimeFormat`
      - [ ] This only works in `JavaScript` and `AjaxJSON` datastore.
      - [ ] This allows one to better control how they want their bools, numbers, and DateTime displayed
      - [ ] For example: `New-HTMLTableOption -DateTimeFormat "yyyy-MM-dd HH:mm:ss" -BoolAsString`
      - [ ] It will make sure all dates are converted to their string representation as requested
      - [ ] Default DateTime is `yyyy-MM-dd HH:mm:ss`
      - [ ] This is possible thanks to `ConvertTo-JsonLiteral` which is my own implementation of `ConvertTo-JSON`
  - ☑ Navigation Functionality (WIP)
    - ☑ Added `New-HTMLNav` command (WIP)
    - ☑ Added `New-HTMLNavLink` command (WIP)
  - ☑ Wizard Functionality
    - ☑ Added `New-HTMLWizard`
    - ☑ Added `New-HTMLWizardStep`
  - ☑ Other
    - ☑ Changed `New-HTMLText` to add `5px` margin. Hopefully things are not affected.
    - ☑ Added `New-HTMLTabPanel` - additional way to define tabs
    - ☑ Updated `JustGate` from 1.3.5 to 1.4.0
    - ☑ Updated `EnlighterJs` from 3.0 to 3.4.0
    - ☑ Small updates to `New-HTMLCodeBlock`
    - ☑ Fix for `New-HTMLChart` broken `Title` parameter
    - ☑ `New-HTMLList` and `New-HTMLListItem` updated with `FontSize`
- 0.0.112 - 2020.10.06
  - Fixed issue with x2 PDF Export button - [If ScrollY is selected the pdf button is doubled then #154](https://github.com/EvotecIT/PSWriteHTML/issues/154) - tnx Jekastr
  - Better handling of empty data in `New-HTMLTable`
- 0.0.111 - 2020.10.05
  - Added `New-HTMLOrgChart` (WIP)
  - Added `New-OrgChartNode` (WIP)
- 0.0.110 - 2020.09.29
  - Fix for `New-HTMLImage` messed up height with width
- 0.0.109 - 2020.09.28
  - If no author is provided meta is not added
  - `EmailText` `size` parameter supports the usual settings as described below
  - Removed `EmailText` and added it as an alias to `New-HTMLText` which does the same thing
  - Renamed `EmailHTML` to `Add-HTML`, added `EmailHTML` as alias - this allows to inline any code wherever it's used
  - Added `EmailImage` as alias to `New-HTMLImage`
  - Added `Inline` switch to `New-HTMLImage (EmailImage)` which embeddes given url/file image directly into HTML
  - Improved `New-HTMLImage/EmailImage`
  - Prevents errors `New-HTMLTable` if null is passed as the first element in DataTable (skips processing)
- 0.0.108 - 2020.09.23
  - Added escaping regex for string comparison during `New-TableEvent`
- 0.0.107 - 2020.09.23
  - Fix for Table Redraw/Calendar Redraw when tab switching/section collapsing
- 0.0.106 - 2020.09.23
  - Fix for `New-TableEvent` not working properly for column id different than `1`
  - Improvements to `New-TableEvent` introducing Source/Target columns with Source Column Names support
- 0.0.105 - 2020.09.23
  - Improved `New-HTMLTable` - removed page button if `DisablePaging` or `ScrollY` is selected
  - Updated PSD1 to a better version
  - Fix for `New-HTMLTable` always forcing to HTML if not global option was used
- 0.0.104 - 2020.09.14
  - Added `notlike`/`notcontains` operators to `New-TableCondition`
  - Fixed `like/notcontains` operators for JavaScript datasource in `New-TableCondition`
- 0.0.103 - 2020.09.13
  - Fix for wrong custom CSS placement
- 0.0.102 - 2020.09.13
  - **Updates**
  - Fix for `New-DiagramEvent` to work while `FontIcons` are used
  - Some improvements to `New-HTMLPanel` to better positioning Diagrams
  - Added Loading Bar to `New-HTMLDiagram`. You can disable it using the `DisableLoader` switch.
- 0.0.101 - 2020.09.12
  - **Updates**
    - ☑ Added `Transpose` to `New-HTMLTable`/`Out-HtmlView`
- 0.0.100 - 2020.09.12
  - **Library updates**
    - Update to `Apex Charts` from 3.20.0 to 3.20.1
  - **Updates**
    - ☑ Fix long-lasting issue with loading `FontIcons` in diagrams. Should be visible now.
    - ☑ Support for nested hashtables `ConvertTo-CascadingStyleSheets`
    - ☑ Fix/workaround for IE11 issue with section not showing any data, broken in 0.0.99
- 0.0.99 - 2020.09.07
  - **Notes**
    - ☑ `UTF8` will be set by default for `HTML`. `Email` will pick content encoding from `HTML`
      - ☑ It was already set for `HTML` for `charset` so just making sure it's all the same
    - ☑ Encoding parameter for `EmailOption` and `Email` are DEPRECATED
      - ☑ Whatever you set there doesn't matter - it will always be set to `UTF8`. From my tests setting it to anything else messes up display in some clients
      - ☑ While not really breaking change, just thought I would make sure people are aware
      - ☑ The reason is HTML was always `UTF8` and setting it up on transport level to `Unicode` or other encodings would break things
      - ☑ In outlook it wouldn't matter as it would fix it, but in other clients such as Thunderbird it would go nuts
  - **Library updates**
    - Update to `vis-network` from 8.2.1 to 8.3.2
  - **New/Non-Breaking**
    - ☑ Added aliases for `New-HTMLTableOption`
    - ☑ Fixes for Request Configuration for Sections and Panels
    - ☑ Fixes meta tags for HTML4/HTML5
    - ☑ Addeed **NoClosing** parameter to `New-HTMLTag`
    - ☑ Improvements to `Section` Hiding horizontally and vertically
    - ☑ Improvements to diagram resizing when section resizes - should be no need to resize diagram anymore
- 0.0.98 - 2020.08.30
  - **New/Non-Breaking**
    - ☑ Added `DataStoreID` to `New-HTMLTable` for use with `DataStore = JavaScript`
      - ☑ This allows multiple tables to use the same data. Useful if you want to present the same data in different tables across a single HTML file.
    - ☑ Fixes for JavaScript datastore and conditional formatting
- 0.0.97 - 2020.08.29
  - **Breaking changes**
    - ☑ Diagrams
      - ☑ New-DiagramLink
        - [ ] `ArrowsToEnabled` -> `nullable bool` replaced with `switch`
        - [ ] `ArrowsMiddleEnabled` -> `nullable bool` replaced with `switch`
        - [ ] `ArrowsFromEnabled` -> `nullable bool` replaced with `switch`
        - [ ] `ArrowStrikethrough` -> `nullable bool` replaced with `switch`
        - [ ] `Chosen` -> `nullable bool` replaced with `switch`
        - [ ] `FontSize` -> `int` replaced with `object` - check notes in `0.95`
        - [ ] `FontStrokeWidth` -> `int` replaced with `object` - check notes in `0.95`
  - **New/Non-Breaking**
    - ☑ New-DiagramNode
      - [ ] Exposed `ArrowsToEnabled`, `ArrowsMiddleEnabled`, `ArrowsFromEnabled`
    - ☑ Update to Diagram Height accepting multiple size values
      - ☑ This allows for `New-HTMLDiagram -Height 'calc(100vh - 50px)'` which fills whole screen (within section)
      - ☑ Or this `New-HTMLDiagram -Height 'calc(100vh - 50px)' -Width '50vw'` although not that useful, as flex fixes most of it
    - ☑ Updates `New-DiagramOptionsPhysics` - exposed a bunch of new options plus help
    - ☑ Updates `New-DiagramOptionsLayout` - added some help and new options
  - **Updated library**
    - ☑ `Vis-network` to 8.2.1
- 0.0.96 - 2020.08.28
  - ☑ It seems SearchPanes from DataTables conflict with `New-HTMLDiagram`
    - ☑ Separated that library to be added only on demand
- 0.0.95 - 2020.08.27
  - **Notes**
    - I'm reworking CSS model in which PSWriteHTML works allowing for more consistent design and more customization options. This means some breaking changes will happen soon enough.
    - FontSize will be reworked for most commands (as I get to them) to take `[int]` input but also `[string]` input
      - If `[int]` is provided it assumes size given in `px`. If text is provided it takes it as is.
        - If `15` this means `15px`
        - If `15px` this means `15px`
        - If `15pt` this means `15pt`
        - If `'15'` this means `15px` as it will convert to `[int]` first
        - Anything else will be treated as is meaning you know what you are doing
  - **Breaking changes**
    - ☑ Default Font Size for everything is `8pt`. This includes:
      - ☑ Tabs used to have `15px`. Now by default `8pt`. You will need `New-HTMLTabOption -FontSize '15px'` or `New-HTMLTabOption -FontSize 15` to set default fontsize for Tabs to it's old value (along with other customizations if needed)
      - ☑ Inputs for Tables (Filtering) having static `8pt`
  - **Improvements**
    - ☑ `New-HTMLMain` - allows customizing font size, font type, background color, and text color globally - this will overwrite defaults as described above
    - ☑ Fix TempFilePath for `Email` to work correctly on MacOS/Linux - tnx roberttoups [#146](https://github.com/EvotecIT/PSWriteHTML/pull/146)
    - ☑ Auto-wrapping of Tabs is enabled - can be disabled via `New-HTMLTabOption`
    - ☑ Bunch of options to control wrapping/direction of tabs via `New-HTMLTabOption`
    - ☑ Ability to define `RowElements` in `New-HTMLTabOption` to force number of tabs per row
    - ☑ Fixed BackgroundColor for `New-HTMLTabOption`
    - ☑ Removed `default.css` in favor of native powershell css
    - ☑ `New-HTMLTable` warning - `Hiding footer while filtering is requested without specifying FilteringLocation to Top or Both`
    - ☑ Fixed broken `Tab` switching in **Internet Explorer 11**
    - ☑ Added basic support for `SearchPane` within `New-HTMLTable`
    - ☑ Fixed broken `Tables` refresh on `Tabs` when using named `Tables`
    - ☑ Fixed `New-HTMLTable`/`Out-HTMLView` with `-AllProperties` displaying wrong properties for IDictionary objects
    - ☑ Fixed `New-HTMLTable` properly displaying string/int and other data if passed as a single value
    - ☑ Fixed `New-HTMLTable` properly display ordered dictionary, array of strings, array of singular objects, PSCustomObject with 1 column
    - ☑ Fixed `New-HTMLTable` properly displaying column name as `Name` in PowerShell 5.1 when used with int/string
    - ☑ Fixed `New-HTMLText` font size was ignored. Also now supports 15, 15px, 15pt as described in notes.
    - ☑ Resolves peformance issues by adding new parameter `DataStore` for `New-HTMLTable` to use with large tables
  - **Added cmdlets**
    - ☑ `New-HTMLTableStyle`
    - ☑ `New-HTMLTableOption` - added to provide `DataStore` parameter which globally sets required store, may be used for other things in future
    - ☑ `New-ChartTimeLine` - added basic support for TimeLine Charts
  - **Renamed cmdlets** (non-breaking change via aliases)
    - ☑ `New-HTMLTabOption` -> `New-HTMLTabStyle`
    - ☑ `New-HTMLSectionOption` -> `New-HTMLSectionStyle`
  - **Library updates**
    - `DataTables` and all related libraries
    - `JQuery` to 3.5.1
    - `ApexCharts` updated from 3.18.2 to 3.20
    - `FontAwesome` updated from 5.13 to 5.14
- 0.0.94 - 2020.08.18
  - Public
    - ☑ Added `New-TableEvent` for `New-HTMLTable` **experimental**
- 0.0.93 - 2020.08.16
  - Public
    - Fixes
      - ☑ Fix for `New-HTMLTabOption` switch "-SelectorColor" sets the color permanently [#128](https://github.com/EvotecIT/PSWriteHTML/issues/128)
      - ☑ Fix for `InvokeHTMLTags` in `New-HTMLTable` - replacement of (`&amp;` to `&`) and (`&nbsp;` to `<space>`)
        - ☑ Before it would try to change from `'&amp;nbsp;` to `<space>` which is wrong. Hopefully, nothing will be broken after that
    - Improvements
      - ☑ Choosing colors should be easier (wildcard added before and after)
      - ☑ Make it optional for `New-HTMLTab` to force TextTransform (uses global)
      - ☑ `New-HTMLSection`/`New-HTMLPanel` were updated to support additional options
    - New
      - ☑ Added `ConvertTo-CascadingStyleSheets` - converts hashtable into CSS
      - ☑ Added `New-HTMLSectionOption` - **experimental**
      - ☑ Added `New-HTMLPanelOption` - **experimental**
      - ☑ Added `AnchorName` for sections and panels
      - ☑ Added `New-HTMLAnchor/New-HTMLLink`
  - Internal
    - ☑ Support internally for `Custom Header CSS`, `Custom Footer CSS`
- 0.0.92 - 2020.08.08
  - Fixes `New-HierarchicalTreeNode` not recognized in latest modules [#141](https://github.com/EvotecIT/PSWriteHTML/issues/141)
- 0.0.91 - 2020.08.03
  - Refreshing release - fix for Remove-EmptyValue
- 0.0.90 - 2020.07.27
  - Added `New-TableColumnOption` for `New-HTMLTable` - tnx zsoch [#138](https://github.com/EvotecIT/PSWriteHTML/pull/138)
  - Removed dead/old `FullCalendar` js code
  - Updated `JustGage` to 1.3.5
- 0.0.89 - 2020.07.23
  - Fix for Tooltips in FullCalendar 5.1 - tnx smasterson [#137](https://github.com/EvotecIT/PSWriteHTML/pull/137)
- 0.0.88 - 2020.07.21
  - Updated `New-HTMLCalendar` with more options for `InitialView` parameter - tnx smasterson [#135](https://github.com/EvotecIT/PSWriteHTML/pull/135)
- 0.0.87 - 2020.07.20
  - Updated FullCalendar library to 5.1 from 4.3
  - `New-HTMLCalendar`- removed `plugins` parameter (no longer required)
  - `New-HTMLCalendar` - removed `WeekNumbersWithinDays` (no longer required)
  - `New-HTMLCalendar` - added `InitialView` parameter
  - Fixed Tabs switching with multiple tables on each tab fails [#134](https://github.com/EvotecIT/PSWriteHTML/issues/134)
  - Fixed Tabs switching with calendars [#133](https://github.com/EvotecIT/PSWriteHTML/issues/133)
- 0.0.86 - 2020.07.14
  - Fix for missing `Get-TemporaryDirectory` during merge - damn nested ASTTokens
  - Module is now signed (hopefully that doesn't break anything)
- 0.0.85 - 2020.06.27
  - Update `New-HTMLSpanStyle` with some protection for errors
  - Fix from PSSCriptAnalyzer - The Variable 'Event' is an automatic variable that is built into PowerShell, assigning to it might have undesired side effects. If the assignment is not by design, please use a different name.
- 0.0.84 - 2020.06.11
  - `Colors` autocompleter should be now a bit smarter
  - Added `Online` to `EmailBody`
  - `EmailBody` can be used separately now to generate HTML in case someone would like to use it with their own Send Email
    - Say .. using `Mailozaurr` (new PowerShell module)
  - `Email` has `OutputHTML` parameter which can send email but also output HTML for whatever reason

- 0.0.83 - 2020.05.27
  - Fix for `New-HTMLMain` and junk code showing up in HTML

- 0.0.82 - 2020.04.23
  - `New-HTMLTable` added ability to define Title which will be used as the filename when exporting
    - If no Title is defined title is used from `New-HTML`
    - If no Title is provided name of button will be used (default)
  - `New-TableButtonXXX` also have `Title` field which allows different naming for buttons

- 0.0.81 - 2020.04.18
  - `New-HTMLDiagram` keeps expanding without height bug fixed ([#113](https://github.com/EvotecIT/PSWriteHTML/issues/113)) with huge help from Thomaash

- 0.0.80 - 2020.04.13
  - **DEPRECATED**: `UseJavaScriptLinks` and `UseCssLinks` for `New-HTML`. Use `Online` switch instead.
  - Updated Vis.JS to 7.5.2
  - Updated FontAwesome to 5.13 and hopefully made it available offline
  - Updated ApexCharts to 3.18.1
  - Changed default for Email to Offline. Use `Online` switch to minimize content.
  - `New-HTMLTable` -HideButtons added [#114](https://github.com/EvotecIT/PSWriteHTML/issues/114)

- 0.0.79 - 2020.03.24
  - Typo fixes for Suppress
  - Added `AutoSize` parameter for `New-HTMLTable`/`EmailTable`
  - `Out-HtmlView` switched to `Offline` mode by default. Added `Online` switch.
    - Considering same approach to New-HTML (by default it's offline, but naming convention `UseJavaScriptLinks` and `UseCssLinks` is a bit weird)

- 0.0.77 - 2020.03.04
  - Updates to New-HTMLStatusItem [#111](https://github.com/EvotecIT/PSWriteHTML/pull/111) - tnx jimmy58663
    - Support for FontAwesome, More colors and Hex.
  - Fixes to New-HTMLHeading color property being empty

- 0.0.76 - 2020.02.07
  - Added -PreventShowHTML to Out-HtmlView for quick use with Path.

- 0.0.75 - 2020.02.07
  - Improvment for very long words in New-HTMLTable and New-TableContent using WordBreak parameter - issue [#107](https://github.com/EvotecIT/PSWriteHTML/issues/107)

- 0.0.74 - 2020.01.26
  - Improvements to speed Targetted DataTable recalc for tabs and sections - pull [#105](https://github.com/EvotecIT/PSWriteHTML/pull/105) / issue [#101](https://github.com/EvotecIT/PSWriteHTML/issues/101) - tnx opustecnica

- 0.0.73 - 2020.01.20
  - Fix for Out-HtmlView erroring out if Table was not given (or null)

- 0.0.72 - 2020.01.13
  - Removed unused CSS
  - Fix for Out-HtmlView buttons missing PageLength
  - Added FavIcon to New-HTML [#99](https://github.com/EvotecIT/PSWriteHTML/issues/99) / [#102](https://github.com/EvotecIT/PSWriteHTML/pull/102) - tnx xlrod
  - Updates to New-TableConditionalFormatting for IE 11 support [#100](https://github.com/EvotecIT/PSWriteHTML/pull/100) - tnx opustecnica
  - Updates to Search via RegularExpressions [#100](https://github.com/EvotecIT/PSWriteHTML/pull/100) - tnx opustecnica

- 0.0.71 - 2019.12.26
  - Fix for New-HTMLSection -JustifyContent missing in Invisible
  - Added option to disable the "Properties" row in `Out-HTMLView -SkipProperties` for **Compare** feature (tnx **AdrianDeller**) ([#91](https://github.com/EvotecIT/PSWriteHTML/issues/91) / [#96](https://github.com/EvotecIT/PSWriteHTML/pull/96))
  - Added New-HTMLHeader, New-HTMLMain, New-HTMLFooter

- 0.0.70 - 2019.12.19
  - Library update
    - JQuery to 3.4.1
    - ApexCharts to 3.11.1, and set a static version (instead of the latest)
  - Added New-HTMLTree, New-TreeNode (basic preview)
  - Added New-HTMLHeader, New-HTMLFooter, New-HTMLMain allowing adding content before Tabs or after all content. ([#74](https://github.com/EvotecIT/PSWriteHTML/issues/74))

- 0.0.69 - 2019.12.10
  - Fix for EmailList [#90](https://github.com/EvotecIT/PSWriteHTML/pull/90) - tnx natosullivan
  - Added New-HTMLGage, New-GageSector

- 0.0.68 - 2019.12.07
  - Library update
    - Vis-Network to 6.4.6
  - Diagrams now work in Internet Explorer (yay!)
  - Add Tab border customization and Tab header background color (tnx xlrod!) [#87](https://github.com/EvotecIT/PSWriteHTML/pull/87)
    - ☑ New-HTMLTabOption -SlimTabs -SelectorColor Blue **-BorderRadius 25px** **-BorderBackgroundColor LightBlue**
  - Added Tests so basic stuff is tested for regression (it's very basic)
  - Added alias for New-TableConditon (TableCondition)

- 0.0.67 - 2019.11.26
  - Save-HTML improvment to save to temp file if saving fails (tnx xlrod!) ([#81](https://github.com/EvotecIT/PSWriteHTML/issues/81) / [#86](https://github.com/EvotecIT/PSWriteHTML/pull/86))
  - Fix for New-HTMLTable (Convert-ImagesToBinary) on PS 6/7

- 0.0.66 - 2019.11.25
  - Added JustifyContent to New-HTMLSection (thx xlrod!) ([#79](https://github.com/EvotecIT/PSWriteHTML/issues/79) / [#85](https://github.com/EvotecIT/PSWriteHTML/pull/85))

- 0.0.65 - 2019.11.23
  - Fix for Hashtable/OrderedDictionary display in New-HTMLTable/Out-HTMLView

- 0.0.64 - 2019.11.21
  - Added TextTransform for New-HTMLTab (thx xlrod!)

- 0.0.63 - 2019.11.17
  - Fix for WhatIf in Email affecting other places. It should only affect sending emails.

- 0.0.62 - 2019.11.12
  - IE doesn't require approving running scripts anymore! (tnx orzfly)

- 0.0.61 - 2019.11.11
  - New colors (tnx Ferdi), along with the ability to use #HEX as color codes
  - Emailimo integrated into PSWriteHTML
  - PSSharedGoods is no longer a dependency
    - The way it works is that during development it still is dependency, but during publish it gets merged into one package using PSPublishModule

- 0.0.60 - 2019.11.05
  - Fix for IE 11 support of collapsable sections
  - Fix for nested, invisible sections not working properly
- 0.0.59 - 2019.10.29
  - Library update
    - DataTables upgrade to Nightly (1.10.21-dev) due to broken Table Conditioning. Works with IE as well.
- 0.0.58 - 2019.10.28
  - Library update
    - Vis-Network to 6.3.0 (known issue - IE not working)
    - DataTables downgrade to 1.10.12 for IE to work
  - Fix for IE 11 support of Tabs
  - Fix for IE 11 support of Tables (Out-HTMLView/New-HTMLTable)
  - Fix for Section that starts as Collapsed [#47](https://github.com/EvotecIT/PSWriteHTML/issues/47)
    - It's a heavy fix, meaning it can have perf impact on display - may need changes
  - Added New-TableRowGrouping
    - Allows grouping within New-HTMLTable
- 0.0.57 - 2019.10.13 - [Blog post about release](https://evotec.xyz/nested-tabs-diagram-updates-diagram-events-calendar-object-and-more-in-pswritehtml/)
  - Changes to Tabs
    - Fix for missing comma in Tabs
    - Fix for Tab Selector Color not being applied after changing to Nested Tabs
    - Fix for Tab Selector not being Active by default
  - Changes to Tables
    - Updated Table Row size to 20px from 27px
  - Renamed New-HTMLTable*commands to New-Table* to better reflect what they deliver (and those don't deliver HTML)
    - Old commands still available as aliases
  - Added **Calendar**
    - Added New-HTMLCalendar
    - Added New-CalendarEvent
  - Added **HierarchicalTreeView** - very basic implementation. Not sure it will stick as Diagrams have that option as well **Requires feedback**
    - Added New-HTMLHierarchicalTreeView
    - Added New-HierarchicalTreeNode
  - Changes to **Diagrams**
    - Updated Visjs to 6.1.1 (local version), linked version is always the newest
    - Added New-DiagramEvent for linking Tables with Diagrams
    - Fix for Diagram Size
    - Fix for using diagram defaults (smaller size), should work better now

- 0.0.55 - 2019.09.29
  - Fix for Underlined space when using -Collapsable [#51](https://github.com/EvotecIT/PSWriteHTML/issues/51) - Thanks Tuxhedoh
  - Fix for Stacked Charts [#59](https://github.com/EvotecIT/PSWriteHTML/issues/59) - Thanks for reporting colin-hall
  - Fix for Section -Invisible switch
  - Fix for Section impacting charts positioning
  - Added BackgroundImage,BackgroundImageSize for New-HTMLDiagram (doesn't work for Export)
  - Added Nested Tabs

- 0.0.54 - 2019.09.29 - [Blog Post about release](https://evotec.xyz/easy-way-to-create-diagrams-using-powershell-and-pswritehtml/)
  - **Support for Diagrams**
  - Font Awesome updated to 5.11.2
  - Enlighter updated to 3.0
  - **Dashimo** integrated to **PSWriteHTML** as aliases

- 0.0.53 - 2019.09.19
  - Bugfix chart inverse colors [#42](https://github.com/EvotecIT/PSWriteHTML/issues/42) - Thanks Ferdi Weiner

- 0.0.52 - 2019.09.07
  - Library updates:
    - ApexCharts update 3.8.5
  - ☑ New-HTMLChart
    - ☑ Removed Positioning parameter
    - ☑ Added New-ChartPie
    - ☑ Added New-ChartRadial
    - ☑ Added New-ChartDonut
    - ☑ Added few parameters to New-HTMLChart

- 0.0.51 - 2019.09.05
  - ☑ New-HTMLCode
    - ☑ Added some formatting of whitespaces for code

- 0.0.50 - 2019.08.30
  - ☑ Add-TableContent
    - [ ] Fix for a typo on LE (tnx gregwold)

- 0.0.49 - 2019.08.25 - [Blog post about release](https://evotec.xyz/comparing-two-or-more-objects-visually-in-powershell-cross-platform/)
  - ☑ Save-HTML
    - [ ] Moved some warnings to Verbose
    - [ ] Fixed weird message
  - ☑ New-HTMLTable, Out-HTMLView
    - [ ] Added AllProperties switch
    - [ ] Added Compare/Replacements

- 0.0.48 - 2019.08.11
  - I don't know. Got confused about what was changed :-p

- 0.0.47 - 2019.08.04
  - ☑ Fix for LOGO in PowerShell Core
  - ☑ New-HTMLTable
    - ☑ Added ImmediatelyShowHiddenDetails switch - Responsive has the ability to display the details that it has hidden in a variety of different ways. Its default is to allow the end-user to toggle the display by clicking on a row and showing the information in a DataTables child row. At times it can be useful not to require end-user interaction to display the hidden data in a responsive manner, which can be done with the childRowImmediate display type.
  - ☑ Fix for New-HTML wrong positioning in certain conditions - bug introduced in 0.0.46
  - ☑ Fix for Table Simplify with margins

- 0.0.46 - 2019.08.04 - [Blog post about release](https://evotec.xyz/working-with-html-in-powershell-just-got-better/)
  - ☑ New-HTMLMessage - Removed as not ready, useless
  - ☑ New-HTMLTable
    - [ ] Disable Paging when amount of objects to display is lower then PagingOptions
    - [ ] Added DataTableID for special use cases
  - ☑ New-HTMLTableContent - Added with plenty of new features
  - [ ] New HTMLTableConditionalFormatting - Added inline parameter

- 0.0.45 - 2019.07.09
  - ☑ New-HTMLTable
    - [ ] Added $PriorityProperties parameter - it works also on ScrollX and other types of places contrary to ResponsivePriorityProperties which only works on Responsive Table
    - [ ] It was moved from Out-HtmlView
  - ☑ Out-HTMLView
    - [ ] Updated with all features from New-HTMLTable as it's useful to use it for fast output

- 0.0.44 - 2019.07.08
  - ☑ New-HTMLTable
    - [ ] Small improvement when no data provided
  - ☑ New-HTMLTableCondition
    - [ ] Supports contains now - PR by Adam Cook (codamok)
  - [ ] Removed ColorSchemes - removal of ReportHTML old code

- 0.0.43 - 2019.07.01
  - ☑ New-HTMLTable
    - [ ] Fix for ScrollX with low amount of columns

- 0.0.42 - 2019.07.01
  - ☑ New-HTMLTableConditionalFormatting
    - [ ] Fix for Powershell Core, where conditional formatting wouldn't show up

- 0.0.41 - 2019.06.30
  - ☑ New-HTMLTableHeader - removing need for AddRow switch
    - [ ] If used with only Title it will assume AddRow
    - [ ] If used with Names it will assume merging
    - [ ] If used with Names without Title it will assume styling
    - [ ] Left AddRow for compatibility reasons, may remove it in future

- 0.0.40 - 2019.06.29 - [Blog post about release](https://evotec.xyz/all-your-html-tables-are-belong-to-us/)
  - ☑ New-HTMLTable features
    - ☑ FixedHeader/FixedFooter options
    - ☑ Scrolling
      - ScrollX,
      - ScrollY, ScrollSizeY
      - FreezeColumnsLeft, FreezeColumnsRight
    - ☑ ResponsivePriorityOrder, ResponsivePriorityOrderIndex
  - ☑ New-HTMLTableHeader - **new command**
    - ☑ Merging header, styling header, adding header row

- 0.0.39 - 2019.06.20
  - Fix for DefaultSortColumn
  - Fix for DefaultSortOrder when set to descending

- 0.0.38 - 2019.06.17 - [Blog post about release](http://evotec.xyz/dashimo-pswritehtml-charting-icons-and-few-other-changes)
  - Added support for Bar Charts/Line Charts
  - Added support for icons in tabs
  - Added support for controlling tabs
  - Fixes for tables in multiple places
  - Ability to control buttons behavior
  - Many many more, it's a big release

- 0.0.34 - 2019.06.02
  - Fix for New-HTMLListItem to support multiple Texts

- 0.0.33 - 2019.05.28
  - New-HTMLTable - Sorting ordered for DateTime - PR by Ferdi Weiner (ferwe)
  - Removed New-HTMLChart temporary as it will be rebuilt

## Advantages over ReportHTML

- complete rewrite
- faster report building (from 20+ seconds to 0-2 seconds)
- updated libraries
- bunch of different, new features
- easier building HTML

## Credits

[Matthew Quickenden](https://www.linkedin.com/in/matthewquickenden/) ([@lucidqdreams](https://github.com/lucidqdreams)) - author of  ReportHTML - without him this wouldn't be possible.

## Projects using PSWriteHTML (to give you ideas of what you can do)

- [Statusimo](https://github.com/EvotecIT/Statusimo) is a PowerShell module that is able to generate a Status Page entirely from PowerShell.
- [Dashimo](https://github.com/EvotecIT/Dashimo) is a PowerShell module that makes generating Dashboards, nice looking HTML, a breeze.
- [Emailimo](https://github.com/EvotecIT/Emailimo) is a PowerShell module that makes writing nice looking HTML emails, easy!
- [Out-HTMLView](https://evotec.xyz/out-htmlview-html-alternative-to-out-gridview/) is a PowerShell cross-platform command alternative to Out-GridView

![Out-HTMLView](https://evotec.xyz/wp-content/uploads/2019/04/Out-HtmlView.gif)

Following external libraries and frameworks are in use. They make `PSWriteHTML` what it is now. This list is dynamic and doesn't cover everything yet.

For colors, you can visit this [online page](https://evotec.xyz/wp-content/uploads/2019/05/Example-Colors.html).

## 3rd Party Libraries

**PSWriteHTML** uses some 3rd party libraries to deliver its functionality. It requires those. There are two ways to use it

- With links to CSS/JS which makes code cleaner and easy to see what is happening
- With code inline in HTML which makes HTML much bigger (default, but makes PSWriteHTML usage offline possible)

Below you can find 3rd party libraries being used.

- [DataTables.net](https://datatables.net/) - [MIT license](https://datatables.net/license/mit)
- [ApexCharts](https://github.com/apexcharts/apexcharts.js) - [MIT license](https://github.com/apexcharts/apexcharts.js/blob/master/LICENSE)
- Google Fonts (Roboto)
- [Fonts Awesome](https://fontawesome.com/)
- [Accordion](https://github.com/michu2k/Accordion) - [MIT license](https://github.com/michu2k/Accordion/blob/master/LICENSE)
- [Kineto](https://github.com/findawayer/kineto) - [MIT License](https://github.com/findawayer/kineto/blob/main/LICENSE)
- [MultiLevelPushMenu jQuery Plugin](https://github.com/adgsm/multi-level-push-menu)
- [Vis-Network](https://github.com/visjs/vis-network) - [Apache 2.0](https://github.com/visjs/vis-network/blob/master/LICENSE-APACHE-2.0)
- [Vis-TimeLine](https://github.com/visjs/vis-timeline) - [MIT and Apache 2.0](https://github.com/visjs/vis-timeline/blob/master/LICENSE.md)
- [EasyQRCodeJS](https://github.com/ushelp/EasyQRCodeJS) - [MIT license](https://github.com/ushelp/EasyQRCodeJS/blob/master/LICENSE)
- [JQuery SmartWizard](http://techlaboratory.net/jquery-smartwizard) - [MIT license](https://github.com/techlab/jquery-smartwizard/blob/master/LICENSE)
- [JQuery SmartTab](http://techlaboratory.net/jquery-smarttab) - [MIT license](https://github.com/techlab/jquery-smarttab/blob/master/LICENSE)
- [PopperJS](https://popper.js.org/) - [MIT license](https://github.com/popperjs/popper-core/blob/master/LICENSE.md)
- [MomentJS](https://momentjs.com/) - [MIT license](https://github.com/moment/moment/blob/develop/LICENSE)
- [JustGage](https://github.com/toorshia/justgage) - [MIT license](https://github.com/toorshia/justgage/blob/master/LICENSE)
- [FrancyTree](https://github.com/mar10/fancytree) - [MIT license](https://github.com/mar10/fancytree/blob/master/LICENSE.txt)
- [FullCalendar](https://github.com/fullcalendar/fullcalendar) - [MIT license](https://github.com/fullcalendar/fullcalendar/blob/master/LICENSE.txt)
- [D3 Mitch Tree](https://github.com/deltoss/d3-mitch-tree) - [MIT license](https://github.com/deltoss/d3-mitch-tree/blob/master/LICENSE)
- [JQuery](https://jquery.com/) - [MIT license](https://github.com/jquery/jquery/blob/main/LICENSE.txt)
- [Chart.xkcd](https://github.com/timqian/chart.xkcd) - [MIT license](https://github.com/timqian/chart.xkcd/blob/master/LICENSE)
- [OrgChart](https://github.com/dabeng/OrgChart) - [MIT license](https://github.com/dabeng/OrgChart/blob/master/LICENSE)
- [HighlightJS](https://highlightjs.org/) - [BSD 3-Clause "New" or "Revised" License](https://github.com/highlightjs/highlight.js/blob/master/LICENSE)
- [EnlighterJS](https://github.com/EnlighterJS/EnlighterJS) - [Mozilla Public License 2.0](https://github.com/EnlighterJS/EnlighterJS/blob/master/LICENSE.txt)
