# PSWriteHTML - PowerShell Module

<p align="center">
  <a href="https://dev.azure.com/evotecpl/PSWriteHTML/_build/latest?definitionId=3"><img src="https://img.shields.io/azure-devops/build/evotecpl/a5ce5d3e-9ae2-49a0-9905-53eb41205fc9/7?label=Azure%20Pipelines&style=flat-square"></a>
  <a href="https://www.powershellgallery.com/packages/PSWriteHTML"><img src="https://img.shields.io/powershellgallery/v/PSWriteHTML.svg?style=flat-square"></a>
  <a href="https://www.powershellgallery.com/packages/PSWriteHTML"><img src="https://img.shields.io/powershellgallery/vpre/PSWriteHTML.svg?label=powershell%20gallery%20preview&colorB=yellow&style=flat-square"></a>
  <a href="https://github.com/EvotecIT/PSWriteHTML"><img src="https://img.shields.io/github/license/EvotecIT/PSWriteHTML.svg?style=flat-square"></a>
  <a href="https://wakatime.com/badge/user/f1abc372-39bb-4b06-ad2b-3a24cf161f13/project/c73e600a-70df-4d9c-ad2e-71d0ff77201d"><img src="https://wakatime.com/badge/user/f1abc372-39bb-4b06-ad2b-3a24cf161f13/project/c73e600a-70df-4d9c-ad2e-71d0ff77201d.svg" alt="wakatime"></a>
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

- 🔗 [Meet Statusimo - PowerShell generated Status Page](https://evotec.xyz/meet-statusimo-powershell-generated-status-page/)
- 🔗 [Meet Dashimo - PowerShell Generated Dashboard](https://evotec.xyz/meet-dashimo-powershell-generated-dashboard/)
- 🔗 [Dashimo - Easy Table Conditional Formatting and more](https://evotec.xyz/dashimo-easy-table-conditional-formatting-and-more/)
- 🔗 [Out-HtmlView - HTML alternative to Out-GridView](https://evotec.xyz/out-htmlview-html-alternative-to-out-gridview/)
- 🔗 [Meet Emailimo - New way to send pretty emails with PowerShell](https://evotec.xyz/meet-emailimo-new-way-to-send-pretty-emails-with-powershell/)
- 🔗 [All your HTML Tables are belong to us](https://evotec.xyz/all-your-html-tables-are-belong-to-us/)
- 🔗 [Sending HTML emails with PowerShell and zero HTML knowledge required](https://evotec.xyz/sending-html-emails-with-powershell-and-zero-html-knowledge-required/)
- 🔗 [Dashimo (PSWriteHTML) - Charting, Icons and few other changes](https://evotec.xyz/dashimo-pswritehtml-charting-icons-and-few-other-changes/)
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

For colors, you can visit this [online page](https://evotec.xyz/wp-content/uploads/2019/05/Example-Colors.html).

## 3rd Party Libraries

**PSWriteHTML** uses some 3rd party libraries to deliver its functionality. It requires those and without them - this project would have a basic functionality. There are two ways to use it

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
