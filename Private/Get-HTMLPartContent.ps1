function Get-HTMLPartContent {
    <#
    .SYNOPSIS
    Retrieves a part of HTML content between specified start and end markers.

    .DESCRIPTION
    This function extracts a portion of HTML content from an array based on the provided start and end markers. The extracted content can be either before, between, or after the specified markers.

    .PARAMETER Content
    Specifies the array containing the HTML content.

    .PARAMETER Start
    Specifies the starting marker to identify the beginning of the desired content.

    .PARAMETER End
    Specifies the ending marker to identify the end of the desired content.

    .PARAMETER Type
    Specifies the type of extraction to perform. Options are 'Before', 'Between', or 'After'. Default is 'Between'.

    .EXAMPLE
    Get-HTMLPartContent -Content $HTMLArray -Start '<div>' -End '</div>' -Type 'Between'
    Retrieves the HTML content between the '<div>' and '</div>' markers from the provided array.

    .EXAMPLE
    Get-HTMLPartContent -Content $HTMLArray -Start '<head>' -End '</head>' -Type 'After'
    Retrieves the HTML content after the '</head>' marker from the provided array.

    .EXAMPLE
    Get-HTMLPartContent -Content $HTMLArray -Start '<body>' -End '</body>' -Type 'Before'
    Retrieves the HTML content before the '<body>' marker from the provided array.
    #>
    param(
        [Array] $Content,
        [string] $Start,
        [string] $End,
        [ValidateSet('Before', 'Between', 'After')] $Type = 'Between'
    )
    $NrStart = $Content.IndexOf($Start)
    $NrEnd = $Content.IndexOf($End)   
    
    #Write-Color $NrStart, $NrEnd, $Type -Color White, Yellow, Blue

    if ($Type -eq 'Between') {
        if ($NrStart -eq -1) {
            # return nothing
            return
        }
        $Content[$NrStart..$NrEnd]
    } 
    if ($Type -eq 'After') {
        if ($NrStart -eq -1) {
            # Returns untouched content
            return $Content
        }
        $Content[($NrEnd + 1)..($Content.Count - 1)]

    }
    if ($Type -eq 'Before') {
        if ($NrStart -eq -1) {
            # return nothing
            return
        }
        $Content[0..$NrStart]
    }
}