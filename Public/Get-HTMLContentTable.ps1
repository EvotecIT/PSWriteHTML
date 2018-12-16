Function Get-HTMLContentTable {
    <#
	.SYNOPSIS
		Creates an HTML table from an array of objects
	    .PARAMETER ArrayOfObjects
			An array of objects
		.PARAMETER Fixed
		    fixes the html column width by the number of columns
		.PARAMETER GroupBy
		    The column to group the data.  make sure this is first in the array
		.PARAMETER Column Totals
		    an Array of headers from that exist in the array of objects to be summed up
#>
    param(
        [Array]$ArrayOfObjects,
        [String]$GroupBy,
        [Array]$ColumnCounts,
        [Switch]$Fixed,
        [Array]$ColumnAverages,
        [Switch]$NoSortableHeader,
        [Array]$ColumnTotals

    )
    if ($GroupBy -eq '') {
        $Report = $ArrayOfObjects | ConvertTo-Html -Fragment
        $Report = $Report -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', ""
        $Report = $Report -replace "<tr>(.*)<td>Green</td></tr>", "<tr class=`"green`">`$+</tr>"
        $Report = $Report -replace "<tr>(.*)<td>Yellow</td></tr>", "<tr class=`"yellow`">`$+</tr>"
        $Report = $Report -replace "<tr>(.*)<td>Red</td></tr>", "<tr class=`"red`">`$+</tr>"
        $Report = $Report -replace "<tr>(.*)<td>Odd</td></tr>", "<tr class=`"odd`">`$+</tr>"
        $Report = $Report -replace "<tr>(.*)<td>Even</td></tr>", "<tr class=`"even`">`$+</tr>"
        $Report = $Report -replace "<tr>(.*)<td>None</td></tr>", "<tr>`$+</tr>"
        $Report = $Report -replace '<th>RowColor</th>', ''

        if ($Fixed.IsPresent) {
            $Report = $Report -replace '<table>', '<table class="fixed">'
        } else {
            if (!($NoSortableHeader)) {	$Report = $Report -replace '<table>', '<table class="sortable">' }
        }
    } else {
        $NumberOfColumns = ($ArrayOfObjects | Get-Member -MemberType NoteProperty  | Select-Object Name).Count
        $Groupings = @()
        $ArrayOfObjects | Select-Object $GroupBy -Unique  | Sort-Object $GroupBy | ForEach-Object { $Groupings += [String]$_.$GroupBy}
        if ($Fixed.IsPresent) {	$Report = '<table class="fixed">' }
        else { $Report = '<table>' }
        $GroupHeader = $ArrayOfObjects | ConvertTo-Html -Fragment
        $GroupHeader = $GroupHeader -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', "" -replace '<table>', "" -replace '</table>', "" -replace "<td>.+?</td>" -replace "<tr></tr>", ""
        $GroupHeader = $GroupHeader -replace '<th>RowColor</th>', ''
        $Report += $GroupHeader
        foreach ($Group in $Groupings) {
            $Report += "<tr><td colspan=`"$NumberOfColumns`" class=`"groupby`">$Group</td></tr>"
            $GroupBody = $ArrayOfObjects | Where-Object { [String]$($_.$GroupBy) -eq $Group } | Select-Object * -ExcludeProperty $GroupBy | ConvertTo-Html -Fragment
            $GroupBody = $GroupBody -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', "" -replace '<table>', "" -replace '</table>', "" -replace "<th>.+?</th>" -replace "<tr></tr>", "" -replace '<tr><td>', "<tr><td></td><td>"
            $GroupBody = $GroupBody -replace "<tr>(.*)<td>Green</td></tr>", "<tr class=`"green`">`$+</tr>"
            $GroupBody = $GroupBody -replace "<tr>(.*)<td>Yellow</td></tr>", "<tr class=`"yellow`">`$+</tr>"
            $GroupBody = $GroupBody -replace "<tr>(.*)<td>Red</td></tr>", "<tr class=`"red`">`$+</tr>"
            $GroupBody = $GroupBody -replace "<tr>(.*)<td>Odd</td></tr>", "<tr class=`"odd`">`$+</tr>"
            $GroupBody = $GroupBody -replace "<tr>(.*)<td>Even</td></tr>", "<tr class=`"even`">`$+</tr>"
            $GroupBody = $GroupBody -replace "<tr>(.*)<td>None</td></tr>", "<tr>`$+</tr>"
            $Report += $GroupBody
        }

    }
    $Report = $Report -replace 'URL01NEW', '<a target="_blank" href="'
    $Report = $Report -replace 'URL01', '<a href="'
    $Report = $Report -replace 'URL02', '">'
    $Report = $Report -replace 'URL03', '</a>'

    if ($Report -like "*<tr>*" -and $report -like "*odd*" -and $report -like "*even*") {
        $Report = $Report -replace "<tr>", '<tr class="header">'
    }

    if ($ColumnTotals.count -gt 0 -or $ColumnAverages.count -gt 0 -or $ColumnCounts.count -gt 0 ) {
        $Report = $Report -replace "</table>", ""
        $TableFooter = $ArrayOfObjects | ConvertTo-Html -Fragment
        $TableFooter = $TableFooter -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', "" -replace '<table>', "" -replace '</table>', "" -replace "<td>.+?</td>" -replace "<tr></tr>", ""
        $TableFooter = $TableFooter -replace '<th>RowColor</th>', ''
        #$ColumnTotal
        foreach ($ColumnTotal in $ColumnTotals) {
            $TableFooter = $TableFooter -replace $ColumnTotal, ("sum:" + ($arrayofobjects | measure $ColumnTotal -Sum ).sum)
        }
        #ColumnAverage
        foreach ($ColumnAverage in $ColumnAverages) {
            $TableFooter = $TableFooter -replace $ColumnAverage, ("avg:" + ($arrayofobjects | measure $ColumnAverage -Average ).average)
        }
        #ColumnCount
        foreach ($ColumnCount in $ColumnCounts) {
            $TableFooter = $TableFooter -replace $ColumnCount, ("count:" + ($arrayofobjects | measure $ColumnCount).count)
        }
        #Cleanup
        foreach ($Column in ($ArrayOfObjects | Get-Member )) {
            $TableFooter = $TableFooter -replace ("<th>" + $Column.Name + "</th>"), '<td></td>'
        }

        $TableFooter = $TableFooter -replace '<th>', '<td class="totalrow">' -replace "</th>", '</td>'
        $TableFooter = $TableFooter -replace '<tr>', '<tr class="totalrow">'
        $Report += "<tfoot>"
        $Report += $TableFooter
        $Report += "</tfoot>"
    }


    $Report += "</table>"


    return $Report
}