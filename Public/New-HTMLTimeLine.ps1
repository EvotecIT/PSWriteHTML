function New-HTMLTimeline {
    <#
    .SYNOPSIS
    Creates a new HTML timeline with customizable content.

    .DESCRIPTION
    This function creates an HTML timeline with the specified content. The timeline can be used to display a sequence of events or steps in a visually appealing manner.

    .PARAMETER Content
    Specifies the content of the HTML timeline as a script block.

    .EXAMPLE
    New-HTMLTimeline -Content {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'event' } -Value { "Event 1" }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'event' } -Value { "Event 2" }
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'event' } -Value { "Event 3" }
    }

    Creates an HTML timeline with three events.

    #>
    [cmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][alias('TimeLineItems')][ScriptBlock] $Content
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.TimeLine = $true
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'timelineSimpleContainer' } {
        if ($null -eq $Value) { '' } else { Invoke-Command -ScriptBlock $Content }
    }
}