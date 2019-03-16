function New-HTMLTimeline {
    param(
        [Parameter(Mandatory = $false, Position = 0)][alias('TimeLineItems')][ScriptBlock] $Content
    )
    $Script:HTMLSchema.Features.TimeLine = $true
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'timelineSimpleContainer' } {
        if ($null -eq $Value) { '' } else { Invoke-Command -ScriptBlock $Content }
    }
}