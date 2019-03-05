function New-IconExclamation {
    <#
    .SYNOPSIS
    This function is used for New-HTMLToast
    
    .DESCRIPTION
    Long description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param()
    $SvgAttributes = [ordered] @{
        version       = "1.1"
        class         = "toast__svg"
        xmlns         = "http://www.w3.org/2000/svg"
        'xmlns:xlink' = "http://www.w3.org/1999/xlink"
        x             = "0px"
        y             = "0px"
        viewBox       = "0 0 301.691 301.691"
        style         = "enable-background:new 0 0 301.691 301.691;"
        'xml:space'   = "preserve"
    }
    New-HTMLTag -Tag 'svg' -Attributes $SvgAttributes {
        $Points = @{
            points = "119.151,0 129.6,218.406 172.06,218.406 182.54,0  "
        }
        New-HTMLTag -Tag 'polygon' -Attributes $Points 
        $React = @{
            x      = "130.563"
            y      = "261.168"
            width  = "40.525"
            height = "40.523"
        }
        New-HTMLTag -Tag 'react' -Attributes $React
    }
}