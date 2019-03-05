function New-IconInfo {
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
        viewBox       = "0 0 32 32"
        style         = "enable-background:new 0 0 32 32;"
        'xml:space'   = "preserve"
    }
    New-HTMLTag -Tag 'svg' -Attributes $SvgAttributes {
        $PathAttributes = @{
            d = "M10,16c1.105,0,2,0.895,2,2v8c0,1.105-0.895,2-2,2H8v4h16v-4h-1.992c-1.102,0-2-0.895-2-2L20,12H8     v4H10z"        
        }
        New-HTMLTag -Tag 'path' -Attributes $PathAttributes
        New-HTMLTag -Tag 'circle' -Attributes @{ cx = "16"; cy = "4"; r = "4"; }
    }
}