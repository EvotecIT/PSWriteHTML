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
        [alias('ArrayOfObjects', 'Object', 'Table')][Array]$DataTable,
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

    [string] $DTInstance = Get-RandomStringName -Size 8

    $TableHeader = @'
<script>
 $(document).ready(function() {
     $('#
'@

    $TableHeader += $DTInstance
    $TableHeader += @"
').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5'
        ],
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
    $ArraryHeader = $DataTable | ConvertTo-Html -Fragment
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

    $NumberOfColumns = ($DataTable | Get-Member -MemberType NoteProperty  | Select-Object Name).Count

    $Report = $DataTable | ConvertTo-Html -Fragment
    <# Sample view of output

    <table>
    <colgroup><col/><col/><col/><col/></colgroup>
    <tr><th>ForestMode</th><th>Name</th><th>RootDomain</th><th>SchemaMaster</th></tr>
    <tr><td>Windows2012R2Forest</td><td>ad.evotec.xyz</td><td>ad.evotec.xyz</td><td>AD1.ad.evotec.xyz</td></tr>
    </table>

    When formatted:
    <table>
        <colgroup>
            <col />
            <col />
            <col />
            <col />
        </colgroup>
        <tr>
            <th>ForestMode</th>
            <th>Name</th>
            <th>RootDomain</th>
            <th>SchemaMaster</th>
        </tr>
        <tr>
            <td>Windows2012R2Forest</td>
            <td>ad.evotec.xyz</td>
            <td>ad.evotec.xyz</td>
            <td>AD1.ad.evotec.xyz</td>
        </tr>
    </table>
    #>

    # Removes colgroup and col that is empty
    $Report = $Report -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', ""

    # Connects Table Header with Table by replacing Table Tag with new tag and thead
    $Report = $Report -replace '<table>', ('<table id="' + $DTInstance + '" class="display compact"><thead>')

    # This splits 1st row from the rest of the table making it table header, closes theader and opens up tbody
    $Report = $Report -replace '</th></tr>', '</th></tr></thead><tbody>'

    # This closes body instead of table
    $Report = $Report -replace "</table>", "</tbody>"
    if (-not $HideFooter) {
        # this fixes footer (column names at the bottom of table)
        $Footer = '<tfoot><tr>'
        foreach ($Header in $ColumnHeaders) {
            $Footer += '<th>' + $Header + '</th>'
        }
        $Footer += '</tr></tfoot>'
        $Report += $Footer  # $Report = $Report -replace "LoadFooterHere", $Footer
    }

    #$Report = $Report -replace 'URL01NEW', '<a target="_blank" href="'
    #$Report = $Report -replace 'URL01', '<a href="'
    #$Report = $Report -replace 'URL02', '">'
    #$Report = $Report -replace 'URL03', '</a>'

    $Report += "</table>"
    return ($TableHeader + $Report)
}