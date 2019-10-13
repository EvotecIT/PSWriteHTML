function New-ChartInternalPattern {
    [CmdletBinding()]
    param(

    )
    $Options.fill = [ordered]@{
        type    = 'pattern'
        opacity = 1
        pattern = [ordered]@{
            style = @('circles', 'slantedLines', 'verticalLines', 'horizontalLines')
        }
    }
}