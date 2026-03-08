---
Module Name: PSWriteHTML
Module Guid: a7bdf640-f5cb-4acf-9de0-365b322d245c
Download Help Link: https://github.com/EvotecIT/PSWriteHTML
Help Version: 1.41.0
Locale: en-US
---
# PSWriteHTML Module
## Description
PSWriteHTML is PowerShell Module to generate beautiful HTML reports, pages, emails without any knowledge of HTML, CSS or JavaScript. To get started basics PowerShell knowledge is required.

## PSWriteHTML Cmdlets
### [Add-HTML](Add-HTML.md)
Adds HTML content to the email body.

### [Add-HTMLScript](Add-HTMLScript.md)
Adds JavaScript content to the HTML body.

### [Add-HTMLStyle](Add-HTMLStyle.md)
Adds CSS styles to HTML documents.

### [ConvertTo-CascadingStyleSheets](ConvertTo-CascadingStyleSheets.md)
Converts a hashtable of CSS properties into Cascading Style Sheets (CSS) format.

### [Email](Email.md)
Sends an email with specified parameters.

### [EmailAttachment](EmailAttachment.md)
Creates an email attachment object for header attachments.

### [EmailBCC](EmailBCC.md)
Creates an email object for blind carbon copy (BCC) recipients.

### [EmailBody](EmailBody.md)
Defines styling properties for an email body content.

### [EmailCC](EmailCC.md)
Creates an email object for carbon copy (CC) recipients.

### [EmailFrom](EmailFrom.md)
Creates an email object for the sender address.

### [EmailHeader](EmailHeader.md)
Creates email headers based on the provided ScriptBlock.

### [EmailLayout](EmailLayout.md)
Defines the layout structure for an email content.

### [EmailLayoutColumn](EmailLayoutColumn.md)
Defines the layout structure for a column in an email content.

### [EmailLayoutRow](EmailLayoutRow.md)
Defines the layout structure for a row in an email content.

### [EmailListItem](EmailListItem.md)
Creates an HTML list item with customizable text styling.

### [EmailOptions](EmailOptions.md)
Configures email options for sending notifications.

### [EmailReplyTo](EmailReplyTo.md)
Defines the email address to which replies should be directed.

### [EmailServer](EmailServer.md)
Defines the email server configuration for sending emails.

### [EmailSubject](EmailSubject.md)
Defines the subject line for an email.

### [EmailTo](EmailTo.md)
Defines the email addresses to which the email should be sent.

### [Enable-HTMLFeature](Enable-HTMLFeature.md)
Provides a way to enable existing feature or extending PSWriteHTML

### [New-AccordionItem](New-AccordionItem.md)
Creates a new accordion item with specified header text and panel text.

### [New-CalendarEvent](New-CalendarEvent.md)
Allows adding new calendar events to calendar

### [New-CarouselSlide](New-CarouselSlide.md)
Creates a new carousel slide with specified content, background color, and height.

### [New-ChartAxisX](New-ChartAxisX.md)
Creates a new X-axis for a chart with specified parameters.

### [New-ChartAxisY](New-ChartAxisY.md)
Creates a new Y-axis for a chart with customizable parameters.

### [New-ChartBar](New-ChartBar.md)
Creates a new bar chart object with specified name, value, and color.

### [New-ChartBarOptions](New-ChartBarOptions.md)
Creates options for a bar chart with customizable parameters.

### [New-ChartDataLabel](New-ChartDataLabel.md)
Configures DataLabels for Charts

### [New-ChartDesign](New-ChartDesign.md)
Configures charts gradient, image, pattern and dropShadow options

### [New-ChartDonut](New-ChartDonut.md)
Creates a new donut chart object with specified name, value, and color.

### [New-ChartEvent](New-ChartEvent.md)
Creates a new chart event for a specified DataTable.

### [New-ChartGrid](New-ChartGrid.md)
Creates a new chart grid with customizable options.

### [New-ChartLegend](New-ChartLegend.md)
Creates a new chart legend with customizable options.

### [New-ChartLine](New-ChartLine.md)
Add a line to a chart

### [New-ChartMarker](New-ChartMarker.md)
Creates a new chart marker with customizable options.

### [New-ChartPie](New-ChartPie.md)
Creates a new pie chart with customizable options.

### [New-ChartRadial](New-ChartRadial.md)
Creates a new radial chart object.

### [New-ChartRadialOptions](New-ChartRadialOptions.md)
Creates customizable options for a radial chart.

### [New-ChartSpark](New-ChartSpark.md)
Creates a new spark chart object.

### [New-ChartTheme](New-ChartTheme.md)
Creates a new chart theme with customizable options.

### [New-ChartTimeLine](New-ChartTimeLine.md)
Creates a new time series chart object.

### [New-ChartToolbar](New-ChartToolbar.md)
Creates a new chart toolbar object with customizable options.

### [New-ChartToolTip](New-ChartToolTip.md)
Creates a new chart tooltip object with customizable options.

### [New-DiagramEvent](New-DiagramEvent.md)
Allows to connect Diagrams with Tables using Events.

### [New-DiagramLink](New-DiagramLink.md)
Creates a new diagram link between two nodes.

### [New-DiagramNode](New-DiagramNode.md)
Creates nodes on a diagram

### [New-DiagramOptionsInteraction](New-DiagramOptionsInteraction.md)
Creates a new diagram options interaction object with customizable options.

### [New-DiagramOptionsLayout](New-DiagramOptionsLayout.md)
Defines layout options for hierarchical diagrams.

### [New-DiagramOptionsLinks](New-DiagramOptionsLinks.md)
Creates a new set of options for diagram edges in a diagram.

### [New-DiagramOptionsManipulation](New-DiagramOptionsManipulation.md)
Creates a new object for manipulating diagram options in a network visualization.

### [New-DiagramOptionsNodes](New-DiagramOptionsNodes.md)
Creates a custom object representing options for diagram nodes.

### [New-DiagramOptionsPhysics](New-DiagramOptionsPhysics.md)
Configures the physics settings for a network visualization.

### [New-GageSector](New-GageSector.md)
Creates a new gauge sector with specified color, minimum value, and maximum value.

### [New-HierarchicalTreeNode](New-HierarchicalTreeNode.md)
Creates a new hierarchical tree node object.

### [New-HTML](New-HTML.md)
Building block for creating HTML elements. A starting point for all other cmdlets in PSWriteHTML except Out-HtmlView.

### [New-HTMLAccordion](New-HTMLAccordion.md)
Creates a new HTML accordion element with customizable options.

### [New-HTMLAnchor](New-HTMLAnchor.md)
Creates a new HTML anchor element.

### [New-HTMLCalendar](New-HTMLCalendar.md)
Creates a new HTML calendar using FullCalendar library.

### [New-HTMLCarousel](New-HTMLCarousel.md)
Creates a new HTML carousel element with customizable options.

### [New-HTMLCarouselStyle](New-HTMLCarouselStyle.md)
New-HTMLCarouselStyle [<CommonParameters>]

### [New-HTMLChart](New-HTMLChart.md)
Creates a new HTML chart with customizable settings.

### [New-HTMLCodeBlock](New-HTMLCodeBlock.md)
Creates a new HTML code block with customizable settings for syntax highlighting.

### [New-HTMLContainer](New-HTMLContainer.md)
Creates a new HTML container element with customizable options.

### [New-HTMLDate](New-HTMLDate.md)
Outputs a date with a data attribute for live "time ago" calculation or custom display via Moment.js.

### [New-HTMLDiagram](New-HTMLDiagram.md)
Creates a new HTML diagram with customizable options.

### [New-HTMLFontIcon](New-HTMLFontIcon.md)
Creates an HTML font icon with specified parameters.

### [New-HTMLFooter](New-HTMLFooter.md)
Building block for use within New-HTML. Provides ability to define footer.

### [New-HTMLFrame](New-HTMLFrame.md)
Allows to inline other HTML files into the current HTML file.

### [New-HTMLGage](New-HTMLGage.md)
Creates a new HTML gauge with customizable options.

### [New-HTMLHeader](New-HTMLHeader.md)
Building block for use within New-HTML. Provides ability to define header.

### [New-HTMLHeading](New-HTMLHeading.md)
Creates a new HTML heading with customizable options.

### [New-HTMLHierarchicalTree](New-HTMLHierarchicalTree.md)
Creates a hierarchical tree structure in HTML using D3.js.

### [New-HTMLHorizontalLine](New-HTMLHorizontalLine.md)
Creates a horizontal line in HTML.

### [New-HTMLImage](New-HTMLImage.md)
Creates IMG tag with image link or image bundled inline

### [New-HTMLInfoCard](New-HTMLInfoCard.md)
Creates a dashboard info card with customizable styling options.

### [New-HTMLList](New-HTMLList.md)
Creates an HTML list with customizable styling options.

### [New-HTMLListItem](New-HTMLListItem.md)
Creates a new HTML list item with customizable styling options.

### [New-HTMLLogo](New-HTMLLogo.md)
Creates a new HTML logo with specified parameters.

### [New-HTMLMain](New-HTMLMain.md)
Defines the body HTML content. By default this is not required, but can be useful when header and footer are used to explicitly define the main content.

### [New-HTMLMap](New-HTMLMap.md)
Creates a new HTML map with specified settings.

### [New-HTMLMarkdown](New-HTMLMarkdown.md)
Creates HTML content from Markdown text with customizable options.

### [New-HTMLMermeidChart](New-HTMLMermeidChart.md)
Creates a new HTML Mermaid chart.

### [New-HTMLNav](New-HTMLNav.md)
Creates a new HTML navigation menu with customizable options.

### [New-HTMLNavFloat](New-HTMLNavFloat.md)
Creates a new HTML floating navigation menu with customizable options.

### [New-HTMLNavTop](New-HTMLNavTop.md)
Creates a top navigation bar in HTML format with customizable options.

### [New-HTMLOrgChart](New-HTMLOrgChart.md)
Creates an HTML organizational chart based on the provided nodes and options.

### [New-HTMLPage](New-HTMLPage.md)
Creates a new HTML page with specified content, name, title, file path, and ID.

### [New-HTMLPanel](New-HTMLPanel.md)
Creates a new HTML panel with customizable styling options.

### [New-HTMLPanelStyle](New-HTMLPanelStyle.md)
Creates a new HTML panel style with customizable options.

### [New-HTMLQRCode](New-HTMLQRCode.md)
Creates an HTML QR code with specified parameters.

### [New-HTMLSection](New-HTMLSection.md)
Creates a new HTML section with customizable styling options.

### [New-HTMLSectionScrolling](New-HTMLSectionScrolling.md)
Creates a new HTML section with scrolling functionality.

### [New-HTMLSectionScrollingItem](New-HTMLSectionScrollingItem.md)
Creates a new HTML section with scrolling functionality.

### [New-HTMLSectionStyle](New-HTMLSectionStyle.md)
Creates a new HTML section style with customizable options.

### [New-HTMLSpanStyle](New-HTMLSpanStyle.md)
Creates an HTML <span> element with specified styling.

### [New-HTMLStatus](New-HTMLStatus.md)
Creates a new HTML status section with customizable content.

### [New-HTMLStatusItem](New-HTMLStatusItem.md)
New-HTMLStatusItem [-Name <string>] [-Status <string>] [-Icon <Object>] [-Percentage <string>] [-FontColor <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconHex <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconSolid <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconRegular <string>] [<CommonParameters>]

New-HTMLStatusItem [-Name <string>] [-Status <string>] [-FontColor <string>] [-BackgroundColor <string>] [-IconBrands <string>] [<CommonParameters>]

### [New-HTMLSummary](New-HTMLSummary.md)
Creates a new HTML summary section with customizable content.

### [New-HTMLSummaryItem](New-HTMLSummaryItem.md)
Creates a new HTML summary item with specified parameters.

### [New-HTMLSummaryItemData](New-HTMLSummaryItemData.md)
Creates a new HTML summary item data with specified text and information.

### [New-HTMLTab](New-HTMLTab.md)
Creates a new HTML tab with customizable content and icons.

### [New-HTMLTable](New-HTMLTable.md)
Creates a new HTML table with various customization options.

### [New-HTMLTableOption](New-HTMLTableOption.md)
Configures New-HTMLTable options

### [New-HTMLTableStyle](New-HTMLTableStyle.md)
Apply new style for HTML Table

### [New-HTMLTabPanel](New-HTMLTabPanel.md)
Flexible and easy to implement Tab Panel with a lot of features, cool animation effects, event support, easy to customize.

### [New-HTMLTabPanelColor](New-HTMLTabPanelColor.md)
Creates a new HTML Tab Panel with customizable colors.

### [New-HTMLTabStyle](New-HTMLTabStyle.md)
Creates a new HTML tab style with customizable options.

### [New-HTMLTag](New-HTMLTag.md)
Creates a new HTML tag with specified attributes and content.

### [New-HTMLText](New-HTMLText.md)
This function provides ability to add new text to the HTML file.

### [New-HTMLTextBox](New-HTMLTextBox.md)
Adds text to HTML where each line in TextBlock is treated as next line (adds BR to each line)

### [New-HTMLTimeline](New-HTMLTimeline.md)
Creates a new HTML timeline with customizable content.

### [New-HTMLTimelineItem](New-HTMLTimelineItem.md)
Creates a new HTML timeline item with specified date, heading text, content text, and color.

### [New-HTMLToast](New-HTMLToast.md)
Creates a new HTML toast notification with customizable text, icons, and colors.

### [New-HTMLTree](New-HTMLTree.md)
Creates a new HTML tree using FancyTree with various customization options.

### [New-HTMLTreeChildCounter](New-HTMLTreeChildCounter.md)
Creates a new HTML tree child counter object with specified options.

### [New-HTMLTreeNode](New-HTMLTreeNode.md)
Creates a new HTML tree node with specified properties.

### [New-HTMLWinBox](New-HTMLWinBox.md)
Creates a customizable HTML window box with various options for styling and functionality.

### [New-HTMLWizard](New-HTMLWizard.md)
Provides a simple way to build wizard

### [New-HTMLWizardColor](New-HTMLWizardColor.md)
Creates a new HTML Wizard Color configuration.

### [New-HTMLWizardStep](New-HTMLWizardStep.md)
Creates a new HTML wizard step with customizable options.

### [New-MapArea](New-MapArea.md)
Creates a new MapArea object with specified parameters.

### [New-MapLegendOption](New-MapLegendOption.md)
Creates a new map legend option with specified parameters.

### [New-MapLegendSlice](New-MapLegendSlice.md)
Creates a new map legend slice.

### [New-MapPlot](New-MapPlot.md)
Creates a new MapPlot object with specified latitude, longitude, and other optional parameters.

### [New-NavFloatWidget](New-NavFloatWidget.md)
Creates a new navigation float widget with customizable options for different types of widgets.

### [New-NavFloatWidgetItem](New-NavFloatWidgetItem.md)
Creates a new navigation float item with specified parameters.

### [New-NavItem](New-NavItem.md)
Creates a new navigation item with specified parameters.

### [New-NavLink](New-NavLink.md)
Creates a new navigation link with customizable options for nested links.

### [New-NavTopMenu](New-NavTopMenu.md)
Creates a new navigation top menu item with customizable options.

### [New-OrgChartNode](New-OrgChartNode.md)
Creates a new organizational chart node.

### [New-TableAlphabetSearch](New-TableAlphabetSearch.md)
Creates a custom object for Table Alphabet Search with specified parameters.

### [New-TableButtonColumnVisibility](New-TableButtonColumnVisibility.md)
Creates a new table button for column visibility control.

### [New-TableButtonCopy](New-TableButtonCopy.md)
Creates a new table button for copying data with customizable options.

### [New-TableButtonCSV](New-TableButtonCSV.md)
Creates a new table button for exporting data to CSV with customizable options.

### [New-TableButtonExcel](New-TableButtonExcel.md)
Creates a new table button for exporting data to Excel with customizable options.

### [New-TableButtonPageLength](New-TableButtonPageLength.md)
Creates a new table button for setting the page length in a DataTable.

### [New-TableButtonPDF](New-TableButtonPDF.md)
Allows more control when adding buttons to Table

### [New-TableButtonPrint](New-TableButtonPrint.md)
Creates a new table button for printing with optional title and button name.

### [New-TableButtonSearchBuilder](New-TableButtonSearchBuilder.md)
Creates a configuration object for a table button search builder.

### [New-TableColumnOption](New-TableColumnOption.md)
Allows for certain modification of options within DataTable's columnDefs parameter. You can set visibility, searchability, sortability, and width for specific columns

### [New-TableCondition](New-TableCondition.md)
Creates a new table condition with specified parameters and styling options for pass and fail conditions.

### [New-TableConditionGroup](New-TableConditionGroup.md)
Creates a new table condition group with specified conditions and styling options.

### [New-TableContent](New-TableContent.md)
Provide a way to style or overwrite the table content with new content or style

### [New-TableEvent](New-TableEvent.md)
Creates a new table event object.

### [New-TableHeader](New-TableHeader.md)
Creates a new table header with specified styling options.

### [New-TableLanguage](New-TableLanguage.md)
Provides ability to overwrite texts available in the table.

### [New-TablePercentageBar](New-TablePercentageBar.md)
Creates a new table percentage bar object with specified attributes.

### [New-TablePercentageBarCondition](New-TablePercentageBarCondition.md)
Creates a new table percentage bar condition object with specified attributes.

### [New-TableReplace](New-TableReplace.md)
Replaces values in a specified field of a table.

### [New-TableRowGrouping](New-TableRowGrouping.md)
Creates a new table row grouping object with specified attributes.

### [Out-HtmlView](Out-HtmlView.md)
Small function that allows to send output to HTML

### [Save-HTML](Save-HTML.md)
Saves HTML (text) to a file. Can be used with conjucncton with New-HTML.

