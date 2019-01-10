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
    [CmdletBinding()]
    param(
        [alias('ArrayOfObjects', 'Object', 'Table')][Array]$DataTable,
        [String]$GroupBy,
        [Array]$ColumnCounts,
        [Switch]$Fixed,
        [Array]$ColumnAverages,
        [Switch]$NoSortableHeader,
        [Array]$ColumnTotals

    )

	# save the advanced properties (objects) to a hashtable for later use
	$AdvancedTypes = @{}
	$ArrayOfObjects | ForEach-Object {
		$obj = $_
		$obj.PSObject.Properties | Where-Object {$_.TypeNameOfValue -eq 'System.Management.Automation.PSCustomObject'} | ForEach-Object {
			$Key = [guid]::NewGuid().Guid -replace '-',''
			$PropertyName = $_.Name
			$o = $obj.$PropertyName
			$AdvancedTypes[$Key] = $o
			# the key will be put into a table which we can then later replace using the content of the object we just saved to that key
			$obj.$PropertyName = $Key
		}
    }

    if ($GroupBy -eq '') {
        Write-Verbose "Get-HTMLContentTable - Running this option 1"
        $Report = $DataTable | ConvertTo-Html -Fragment
        $Report = $Report -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', ""
        $Report = $Report -replace "<tr>(.*)<td>Green</td></tr>", "<tr class=`"green`">`$+</tr>"
        $Report = $Report -replace "<tr>(.*)<td>Yellow</td></tr>", "<tr class=`"yellow`">`$+</tr>"
        $Report = $Report -replace "<tr>(.*)<td>Red</td></tr>", "<tr class=`"red`">`$+</tr>"
        $Report = $Report -replace "<tr>(.*)<td>Odd</td></tr>", "<tr class=`"odd`">`$+</tr>"
        $Report = $Report -replace "<tr>(.*)<td>Even</td></tr>", "<tr class=`"even`">`$+</tr>"
        $Report = $Report -replace "<tr>(.*)<td>None</td></tr>", "<tr>`$+</tr>"
        $Report = $Report -replace '<th>RowColor</th>', ''

        if ($Fixed) {
            $Report = $Report -replace '<table>', '<table class="fixed">'
        } else {
            if (!($NoSortableHeader)) {
                $Report = $Report -replace '<table>', '<table class="sortable">'
            }
        }
    } else {
        Write-Verbose "Get-HTMLContentTable - Running this option 2"
        $NumberOfColumns = ($DataTable | Get-Member -MemberType NoteProperty  | Select-Object Name).Count
        $Groupings = @()
        $DataTable | Select-Object $GroupBy -Unique  | Sort-Object $GroupBy | ForEach-Object { $Groupings += [String]$_.$GroupBy}
        if ($Fixed) {
            $Report = '<table class="fixed">'
        } else {
            $Report = '<table>'
        }
        $GroupHeader = $DataTable | ConvertTo-Html -Fragment
        $GroupHeader = $GroupHeader -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', "" -replace '<table>', "" -replace '</table>', "" -replace "<td>.+?</td>" -replace "<tr></tr>", ""
        $GroupHeader = $GroupHeader -replace '<th>RowColor</th>', ''
        $Report += $GroupHeader
        foreach ($Group in $Groupings) {
            $Report += "<tr><td colspan=`"$NumberOfColumns`" class=`"groupby`">$Group</td></tr>"
            $GroupBody = $DataTable | Where-Object { [String]$($_.$GroupBy) -eq $Group } | Select-Object * -ExcludeProperty $GroupBy | ConvertTo-Html -Fragment
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

    # replace the guids with html formatted tags
	$AdvancedTypes.Keys | ForEach-Object{
		$Key = $_
		$Object = $AdvancedTypes[$Key]
		$Report = $Report -replace $Key, (Format-Html -Object $Object)
    }

    # Not sure what that is for, must be something that ReportHTML guy was using - will be removed
    # spaelling: it is because ConvertTo-Html will botch any existing html. Below is a very clumsy solution
    # I have put my solution for this into this file.
    $Report = $Report -replace 'URL01NEW', '<a target="_blank" href="'
    $Report = $Report -replace 'URL01', '<a href="'
    $Report = $Report -replace 'URL02', '">'
    $Report = $Report -replace 'URL03', '</a>'

    if ($Report -like "*<tr>*" -and $report -like "*odd*" -and $report -like "*even*") {
        $Report = $Report -replace "<tr>", '<tr class="header">'
    }

    if ($ColumnTotals.count -gt 0 -or $ColumnAverages.count -gt 0 -or $ColumnCounts.count -gt 0 ) {
        Write-Verbose "Get-HTMLContentTable - Running this option 3"

        $TableFooter = $DataTable | ConvertTo-Html -Fragment
        $TableFooter = $TableFooter -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', "" -replace '<table>', "" -replace '</table>', "" -replace "<td>.+?</td>" -replace "<tr></tr>", ""
        $TableFooter = $TableFooter -replace '<th>RowColor</th>', ''
        #$ColumnTotal
        foreach ($ColumnTotal in $ColumnTotals) {
            $TableFooter = $TableFooter -replace $ColumnTotal, ("sum:" + ($DataTable | measure $ColumnTotal -Sum ).sum)
        }
        #ColumnAverage
        foreach ($ColumnAverage in $ColumnAverages) {
            $TableFooter = $TableFooter -replace $ColumnAverage, ("avg:" + ($DataTable | measure $ColumnAverage -Average ).average)
        }
        #ColumnCount
        foreach ($ColumnCount in $ColumnCounts) {
            $TableFooter = $TableFooter -replace $ColumnCount, ("count:" + ($DataTable | measure $ColumnCount).count)
        }
        #Cleanup
        foreach ($Column in ($DataTable | Get-Member )) {
            $TableFooter = $TableFooter -replace ("<th>" + $Column.Name + "</th>"), '<td></td>'
        }

        $TableFooter = $TableFooter -replace '<th>', '<td class="totalrow">' -replace "</th>", '</td>'
        $TableFooter = $TableFooter -replace '<tr>', '<tr class="totalrow">'

        $Report = $Report -replace "</table>", ""
        $Report += "<tfoot>"
        $Report += $TableFooter
        $Report += "</tfoot>"
        # We need to close the table because we removed closing to add TableFooters.
        $Report += "</table>"
    }
    return $Report
}