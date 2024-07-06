function New-HTMLSummaryItemData {
    <#
    .SYNOPSIS
    Creates a new HTML summary item data with specified text and information.

    .DESCRIPTION
    This function creates a new HTML summary item data with the provided text and information. It formats the output using New-HTMLText cmdlet.

    .PARAMETER Icon
    Specifies the icon for the summary item.

    .PARAMETER Text
    Specifies the text to be displayed in the summary item. This parameter is mandatory.

    .PARAMETER Information
    Specifies the information to be displayed in the summary item. This parameter is mandatory.

    .EXAMPLE
    New-HTMLSummaryItemData -Text "Total Sales" -Information "$1000"
    Creates a new HTML summary item with the text "Total Sales" and information "$1000".

    .EXAMPLE
    New-HTMLSummaryItemData -Text "Total Orders" -Information "50" -Icon "order.png"
    Creates a new HTML summary item with the text "Total Orders", information "50", and icon "order.png".
    #>
    [cmdletBinding()]
    param(
        [string] $Icon,
        [parameter(Mandatory)][string] $Text,
        [parameter(Mandatory)][alias('Value')][string] $Information
    )
    New-HTMLText -Text "$($Text): ", $Information -Color Grey, Black -Display inline -Opacity 0.3, 1 -FontWeight bold, normal
}