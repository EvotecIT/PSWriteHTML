Function New-HTMLHeading {
    Param (
        [validateset('h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'h7')][string]$Heading,
        [string]$HeadingText,
        [validateset('', 'central')][string] $Type,
        [switch] $Underline
    )  
    $Attributes = @{} 
    if ($Type -eq 'central') {       
        $Attributes.Class = 'central'        
    }
    if ($Underline) {
        $Attributes.Class = "$($Attributes.Class) underline"
    }

    New-HTMLTag -Tag $Heading -Attributes $Attributes {
        $HeadingText
    }
}