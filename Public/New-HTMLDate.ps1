function New-HTMLDate {
    <#
    .SYNOPSIS
    Outputs a date with a data attribute for live "time ago" calculation.

    .DESCRIPTION
    Generates a span element containing the provided date and data attributes
    defining formatting and whether to display relative time.
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][DateTime]$InputDate,
        [string]$DisplayFormat = 'yyyy-MM-dd HH:mm:ss',
        [switch]$IncludeFromNow
    )

    $Script:HTMLSchema.Features.Moment = $true
    $Script:HTMLSchema.Features.MomentDateText = $true
    $Script:HTMLSchema.Features.Jquery = $true

    $dateString = $InputDate.ToString($DisplayFormat)

    "<span class='reportDate' data-reportdate='$dateString' data-format='$DisplayFormat' data-fromnow=$($IncludeFromNow.IsPresent)>$($InputDate.ToString())</span>"
}
