function New-MapPlot {
    <#
    .SYNOPSIS
    Creates a new MapPlot object with specified latitude, longitude, and other optional parameters.

    .DESCRIPTION
    This function creates a new MapPlot object with the provided latitude, longitude, and other optional parameters like href, value, and tooltip content.

    .PARAMETER Plot
    Specifies the name of the plot.

    .PARAMETER Latitude
    Specifies the latitude coordinate for the plot.

    .PARAMETER Longitude
    Specifies the longitude coordinate for the plot.

    .PARAMETER Href
    Specifies the hyperlink reference for the plot.

    .PARAMETER Value
    Specifies the value associated with the plot.

    .PARAMETER TooltipContent
    Specifies the content of the tooltip associated with the plot.

    .EXAMPLE
    New-MapPlot -Plot "Sample Plot" -Latitude 40.7128 -Longitude -74.0060 -Href "https://example.com" -Value "Sample Value" -TooltipContent { "This is a sample tooltip." }

    Creates a new MapPlot object named "Sample Plot" with latitude 40.7128, longitude -74.0060, a hyperlink reference to "https://example.com", a value of "Sample Value", and a tooltip content of "This is a sample tooltip."

    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)][string] $Plot,
        [Parameter(Mandatory)][double] $Latitude,
        [Parameter(Mandatory)][double] $Longitude,
        [string] $Href,
        [Parameter(Mandatory)][string] $Value,
        [alias('Tooltip')][scriptblock] $TooltipContent
    )

    $OutputObject = [ordered] @{
        Type          = 'MapPlot'
        Configuration = [ordered] @{
            $Plot = [ordered] @{
                latitude  = $Latitude
                longitude = $Longitude
                href      = $Href
                value     = $Value
                tooltip   = @{
                    content = if ($TooltipContent) {
                        $ValueExecuted = & $TooltipContent
                        $ValueExecuted -join ""
                    } else {
                        $null
                    }
                }
            }
        }
    }
    Remove-EmptyValue -Hashtable $OutputObject.Configuration -Recursive -Rerun 2
    $OutputObject
}