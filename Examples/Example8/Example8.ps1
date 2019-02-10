Import-Module PSWriteHTML -Force
$Processes = Get-Process | Select -First 5

$DynamicHTML = New-HTML -TitleText $ReportOptions.AsDynamicHTML.Title `
    -HideLogos:(-not $ReportOptions.AsDynamicHTML.Branding.Logo.Show) `
    -RightLogoString $ReportOptions.AsDynamicHTML.Branding.Logo.RightLogo.ImageLink `
    -UseCssLinks:$true `
    -UseStyleLinks:$true {

    New-HTMLContent -HeaderText '0 section' -BackgroundColor SkyBlue {
        New-HTMLColumn -ColumnCount 1 {
            New-HTMLTable -ArrayOfObjects $Processes -HideFooter
        }
    }

    New-HTMLContent -HeaderText '-1 section' -CanCollapse {
        New-HTMLColumn -ColumnCount 1 {
            $PieObjectGroupMembersType = Get-HTMLPieChartObject
            $PieObjectGroupMembersType.Title = "Group Membership"
            $PieObjectGroupMembersType.Size.Height = 250
            $PieObjectGroupMembersType.Size.width = 250
            $PieObjectGroupMembersType.ChartStyle.ChartType = 'doughnut'
            #$PieObjectGroupMembersType.ChartStyle.ColorSchemeName = "ColorScheme4"
            #$PieObjectGroupMembersType.ChartStyle.ColorSchemeName = "Generated8"
            $PieObjectGroupMembersType.ChartStyle.ColorSchemeName = 'Random'
            $PieObjectGroupMembersType.DataDefinition.DataNameColumnName = 'Name'
            $PieObjectGroupMembersType.DataDefinition.DataValueColumnName = 'Count'
            $GroupMembershipTable = New-Object 'System.Collections.Generic.List[System.Object]'
            $objmem = @{

                'Name'  = 'Members'
                'Count' = 10
            }
            $GroupMembershipTable.Add($objmem)

            $objmem = @{

                'Name'  = 'No Members'
                'Count' = 5
            }

            $GroupMembershipTable.Add($objmem)
            Get-HTMLPieChart -ChartObject $PieObjectGroupMembersType -DataSet $GroupMembershipTable
        }
        New-HTMLColumn -ColumnCount 1 {
            
            $LineObject = Get-HTMLLineChartObject
            # $LineObject.DataDefinition.DataCategoryName = '2012','2013'
            $LineObject.Title = "Group Membership"
            #$LineObject.Size.Height = 250
            #$LineObject.Size.width = 250
            $LineObject.DataDefinition.DataSetNames = @('My', 'New', 'Hello')

            #$PieObjectGroupMembersType.ChartStyle.ChartType = 'doughnut'
            #$PieObjectGroupMembersType.ChartStyle.ColorSchemeName = "ColorScheme4"
            #$PieObjectGroupMembersType.ChartStyle.ColorSchemeName = "Generated8"
            $LineObject.ChartStyle.ColorSchemeName = 'Random'
            #$PieObjectGroupMembersType.DataDefinition.DataNameColumnName = 'Name'
            #$PieObjectGroupMembersType.DataDefinition.DataValueColumnName = 'Count'
            $dataSet = New-Object 'System.Collections.Generic.List[System.Object]'
            # $dataSet.Add( @{ my = 10; new =  20,30 ; hello = 30 } )
            # $dataSet.Add( @{ my = 10; new =  20 ; hello = 30 } )
            $dataSet.Add( @{ my = @(10, 30, 1, 5); new = @(20, 50) ; hello = @(30, 5, 30) } )
            Get-HTMLLineChart -ChartObject $LineObject -DataSet $DataSet 
            
        }
        New-HTMLColumn -ColumnCount 1 {
            
            $Stacked = Get-HTMLStackedChartObject
            $Stacked.Title = "Group Membership"
            #$LineObject.Size.Height = 250
            #$LineObject.Size.width = 250
            #$Stacked.DataDefinition.DataSetNames = @('My','New','Hello')
            #$PieObjectGroupMembersType.ChartStyle.ChartType = 'doughnut'
            #$PieObjectGroupMembersType.ChartStyle.ColorSchemeName = "ColorScheme4"
            #$PieObjectGroupMembersType.ChartStyle.ColorSchemeName = "Generated8"
            $Stacked.ChartStyle.ColorSchemeName = 'Random'
            #$PieObjectGroupMembersType.DataDefinition.DataNameColumnName = 'Name'
            #$PieObjectGroupMembersType.DataDefinition.DataValueColumnName = 'Count'
            $dataSet = New-Object 'System.Collections.Generic.List[System.Object]'
            # $dataSet.Add( @{ my = 10; new =  20,30 ; hello = 30 } )
            # $dataSet.Add( @{ my = 10; new =  20 ; hello = 30 } )
            $dataSet.Add( @{ my = @(10, 30, 1, 5); new = @(20, 50) ; hello = @(30, 5, 30) } )
            Get-HTMLStackedChart -ChartObject $Stacked -DataSet $DataSet 
            
        }
    }
}

[string] $DynamicHTMLPath = Save-HTML -HTML $DynamicHTML `
    -FilePath 'C:\Support\GitHub\PSWriteHTML\Examples\Example8\Example8.html'