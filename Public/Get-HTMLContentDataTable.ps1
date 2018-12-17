Function Get-HTMLContentDataTable {
    <#
	.SYNOPSIS
		Creates an HTML 5 Data table from an array of objects
	    .PARAMETER ArrayOfObjects
			An array of objects
		.PARAMETER Paging
		.PARAMETER PagingOptions
		.PARAMETER Ordering
		.PARAMETER Info
		.PARAMETER HideFooter

#>
    param
    (
        [Parameter(Mandatory = $True, ValueFromPipeline = $True)]
        [Array]$ArrayOfObjects,
        [Parameter(Mandatory = $false, ValueFromPipeline = $false)]
        [switch]$DisablePaging,
        [Parameter(Mandatory = $false, ValueFromPipeline = $false)]
        [string]$PagingOptions = '15,25, 50, 100,',
        [Parameter(Mandatory = $false, ValueFromPipeline = $false)]
        [switch]$DisableOrdering,
        [Parameter(Mandatory = $false, ValueFromPipeline = $false)]
        [switch]$DisableInfo,
        [Parameter(Mandatory = $false, ValueFromPipeline = $false)]
        [switch]$HideFooter,
        [switch]$DisableColumnReorder,
        [switch]$DisableResponsiveTable,
        [switch]$DisableSelect

    )
    if ($DisablePaging)	{$Paging = 'false'} else {$Paging = 'true'}
    if ($DisableOrdering) {$Ordering = 'false'} else {$Ordering = 'true'}
    if ($DisableInfo) {$Info = 'false'} else {$Info = 'true'}
    if ($DisableColumnReorder) { $ColumnReorder = 'false' } else { $ColumnReorder = 'true' }
    if ($DisableResponsiveTable) { $ResponsiveTable = 'false' } else { $ResponsiveTable = 'true' }
    if ($DisableSelect) { $Select = 'false' } else { $Select = 'true' }

    $DTInstance = ( -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})).tolower()

    $TableHeader = @'
<script>
 $(document).ready(function() {
     $('#
'@

    $TableHeader += $DTInstance
    $TableHeader += @"
').DataTable({
		"paging":     $($Paging),
		"pagingType": "full_numbers",
		"lengthMenu": [[$PagingOptions -1], [$PagingOptions "All"]],
        "ordering":   $($Ordering),
        "info":       $($Info),
        "colReorder": $($ColumnReorder),
        "responsive": { details: $($ResponsiveTable) },
        "select":     $($Select),
        "columns":    [
"@
    $ArraryHeader = $ArrayOfObjects | ConvertTo-Html -Fragment
    $HeadersText = ($ArraryHeader[2] -replace '<tr>', '' -replace '<th>', '' -replace '</tr>', '')
    $ColumnHeaders = ($HeadersText.substring(0, $HeadersText.Length - 5)) -split '</th>'

    foreach ($ColumnHeader in $ColumnHeaders ) {
        $TableHeader += '{ "data": "' + $ColumnHeader + '" },'
    }
    $TableHeader += @'
]
     });
 } );
</script>
'@
    $TableHeader = $TableHeader.Replace(',]', ']')

    $NumberOfColumns = ($ArrayOfObjects | Get-Member -MemberType NoteProperty  | Select-Object Name).Count

    $Report = $ArrayOfObjects | ConvertTo-Html -Fragment
    $Report = $Report -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', ""
    $Report = $Report -replace '<table>', ('<table id="' + $DTInstance + '" class="display compact"><thead>')
    $Report = $Report -replace '</th></tr>', '</th></tr></thead><tbody>'
    $Report = $Report -replace "</table>", "LoadFooterHere</tbody>"
    if ($HideFooter -eq $true) {
        $Report = $Report -replace "LoadFooterHere", ""
    } else {
        $Footer = '<tfoot><tr>'
        foreach ($Header in $ColumnHeaders) {
            $Footer += '<th>' + $Header + '</th>'
        }
        $Footer += '</tr></tfoot>'
        $Report = $Report -replace "LoadFooterHere", $Footer
    }

    $Report = $Report -replace 'URL01NEW', '<a target="_blank" href="'
    $Report = $Report -replace 'URL01', '<a href="'
    $Report = $Report -replace 'URL02', '">'
    $Report = $Report -replace 'URL03', '</a>'

    $Report += "</table>"
    return ($TableHeader + $Report)
}