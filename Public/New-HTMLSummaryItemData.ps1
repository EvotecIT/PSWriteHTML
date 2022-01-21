function New-HTMLSummaryItemData {
    [cmdletBinding()]
    param(
        [string] $Icon,
        [parameter(Mandatory)][string] $Text,
        [parameter(Mandatory)][alias('Value')][string] $Information
    )
    New-HTMLText -Text "$($Text): ", $Information -Color Grey, Black -Display inline -Opacity 0.3, 1 -FontWeight bold, normal
}