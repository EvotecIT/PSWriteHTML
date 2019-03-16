function New-HTMLTimelineItem {
    param(
        $Date = (Get-Date),
        $HeadingText,
        $Text
    )
    $Attributes = @{
        class     = 'timelineSimple-item'
        "date-is" = $Date
    }
    # $Script:HTMLSchema.Features.TimeLine = $true
    New-HTMLTag -Tag 'div' -Attributes $Attributes -Value {
        New-HTMLTag -Tag 'h1' -Attributes @{ class = 'timelineSimple' } {
            $HeadingText
        }
        New-HTMLTag -Tag 'p' -Attributes @{ class = 'timelineSimple'} {
            $Text
        }
    }
}