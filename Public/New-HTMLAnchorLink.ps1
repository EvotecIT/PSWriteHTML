Function New-HTMLAnchorLink {
    <#
    .SYNOPSIS
    Creates Hyperlink for an Anchor

    .DESCRIPTION
    Long description

    .PARAMETER AnchorName
    The Actual name of the Anchor (Hidden)

    .PARAMETER AnchorText
    The HyperLink text.  Will default to $AnchorNname if not specified

    .EXAMPLE
    Get-HTMLAnchorLink -AnchorName 'test'

    .NOTES
    General notes
    #>

    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)][String] $AnchorName,
        [Parameter(Mandatory = $false)][String] $AnchorText
    )
    if ($AnchorText -eq $null -or $AnchorText -eq '') {
        $AnchorText = $AnchorName
    }
    New-HTMLAnchor -Name $AnchorName -HrefLink '#' -Class 'alink' -Text $AnchorText
}