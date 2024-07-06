function New-HTMLTimelineItem {
    <#
    .SYNOPSIS
    Creates a new HTML timeline item with specified date, heading text, content text, and color.

    .DESCRIPTION
    This function generates an HTML timeline item with the provided information. It allows customization of the date, heading text, content text, and color of the timeline item.

    .PARAMETER Date
    Specifies the date for the timeline item. Defaults to the current date if not specified.

    .PARAMETER HeadingText
    Specifies the heading text for the timeline item.

    .PARAMETER Text
    Specifies the content text for the timeline item.

    .PARAMETER Color
    Specifies the color of the timeline item. If not provided, the default color is used.

    .EXAMPLE
    New-HTMLTimelineItem -Date "2022-01-01" -HeadingText "Project Kickoff" -Text "Started the project development phase." -Color "Blue"
    Creates a timeline item with a specific date, heading, content, and color.

    .EXAMPLE
    New-HTMLTimelineItem -HeadingText "Meeting with Client" -Text "Discussed project requirements." -Color "Green"
    Creates a timeline item with the current date, specified heading, content, and color.

    #>
    [CmdletBinding()]
    param(
        [DateTime] $Date = (Get-Date),
        [string] $HeadingText,
        [string] $Text,
        [string] $Color
    )
    $Attributes = @{
        class     = 'timelineSimple-item'
        "date-is" = $Date
    }

    if ($null -ne $Color) {
        $RGBcolor = ConvertFrom-Color -Color $Color
        $Style = @{
            color = $RGBcolor
        }
    } else {
        $Style = @{}
    }
    # $Script:HTMLSchema.Features.TimeLine = $true
    New-HTMLTag -Tag 'div' -Attributes $Attributes -Value {
        New-HTMLTag -Tag 'h1' -Attributes @{ class = 'timelineSimple'; style = $style } {
            $HeadingText
        }
        New-HTMLTag -Tag 'p' -Attributes @{ class = 'timelineSimple' } {
            $Text -Replace [Environment]::NewLine, '<br>' -replace '\n', '<br>'
        }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLTimelineItem -ParameterName Color -ScriptBlock $Script:ScriptBlockColors