function New-HTMLDate {
    <#
    .SYNOPSIS
    Outputs a date with a data attribute for live "time ago" calculation or custom display via Moment.js.

    .DESCRIPTION
    Generates a <span> element containing the provided date.
    - CanonicalFormat is always 'yyyy-MM-dd HH:mm:ss' (used for consistent parsing).
    - Data attribute "data-format" uses one of the predefined or custom Moment.js formats.
    - Visible text uses standard .NET formatting. (Or can be changed if desired.)
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [DateTime]
        $InputDate,

        # Choose one of the predefined format sets or use 'Custom'
        [ValidateSet('US', 'EU', '24', '12', 'Custom')]
        [string]
        $Format = '24',

        # Only used if -Format is set to 'Custom', e.g. 'dddd, MMMM Do YYYY, h:mm:ss A'
        [string]
        $CustomMomentFormat = 'YYYY-MM-DD HH:mm:ss',

        # Decide whether to display "X minutes/hours/days ago" next to the date.
        [switch]
        $DoNotIncludeFromNow
    )

    $Script:HTMLSchema.Features.Moment = $true
    $Script:HTMLSchema.Features.MomentDateText = $true
    $Script:HTMLSchema.Features.Jquery = $true

    # A small dictionary providing parallel mappings:
    #   DotNet:  .NET style for the visible text.
    #   Moment:  Moment.js format to use if you decide to reformat or parse in JS.
    $formatMap = @{
        'US'     = @{
            'DotNet' = 'MM/dd/yyyy hh:mm tt'   # e.g. 01/23/2025 07:54 PM
            'Moment' = 'MM/DD/YYYY hh:mm A'    # e.g. 01/23/2025 07:54 PM
        }
        'EU'     = @{
            'DotNet' = 'dd/MM/yyyy HH:mm'      # e.g. 23/01/2025 19:54
            'Moment' = 'DD/MM/YYYY HH:mm'      # e.g. 23/01/2025 19:54
        }
        '24'     = @{
            'DotNet' = 'yyyy-MM-dd HH:mm:ss'   # e.g. 2025-01-23 19:54:00
            'Moment' = 'YYYY-MM-DD HH:mm:ss'   # e.g. 2025-01-23 19:54:00
        }
        '12'     = @{
            'DotNet' = 'yyyy-MM-dd hh:mm:ss tt'# e.g. 2025-01-23 07:54:00 PM
            'Moment' = 'YYYY-MM-DD hh:mm:ss A' # e.g. 2025-01-23 07:54:00 PM
        }
        'Custom' = @{
            # Use a safe default for visible text
            'DotNet' = 'yyyy-MM-dd HH:mm:ss'
            # The user must define this at call time via -CustomMomentFormat
            'Moment' = $CustomMomentFormat
        }
    }

    # Get correct .NET and Moment.js formats based on the user’s choice
    $dotNetFormat = $formatMap[$Format].DotNet
    $momentFormat = $formatMap[$Format].Moment

    # A canonical string for consistent parsing by Moment.js in the JS code
    $canonicalDate = $InputDate.ToString('yyyy-MM-dd HH:mm:ss')

    # Visible text in the span (what the user sees immediately)
    $displayStr = $InputDate.ToString($dotNetFormat)

    $IncludeFromNow = (($DoNotIncludeFromNow.IsPresent -eq $false)).ToString().ToLower()

    # Return the final HTML snippet:
    #   data-reportdate   -> canonical date
    #   data-format       -> the chosen Moment.js format (US/EU/24/12/Custom)
    #   data-fromnow      -> whether to display relative time
    #   <span> text       -> what the user sees initially in the HTML
    return "<span class='reportDate' data-reportdate='$canonicalDate' data-format='$momentFormat' data-fromnow='$IncludeFromNow'>$displayStr</span>"
}
