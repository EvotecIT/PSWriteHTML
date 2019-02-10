Function New-HTMLAnchorName {
    <#
    .SYNOPSIS
    Creates an anchor

    .DESCRIPTION
    Long description

    .PARAMETER AnchorName
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)][String] $AnchorName
    )
    New-HTMLAnchor -Name $AnchorName
}