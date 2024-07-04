function New-TableReplace {
    <#
    .SYNOPSIS
    Replaces values in a specified field of a table.

    .DESCRIPTION
    This function replaces values in a specified field of a table with the provided replacements.

    .PARAMETER FieldName
    The name of the field in the table where replacements will be made.

    .PARAMETER Replacements
    An array of strings containing the values to replace in the specified field.

    .EXAMPLE
    New-TableReplace -FieldName "Status" -Replacements @("Active", "Inactive")

    Description:
    Replaces values in the "Status" field with "Active" or "Inactive".

    .EXAMPLE
    New-TableReplace -FieldName "Priority" -Replacements @("High", "Medium", "Low")

    Description:
    Replaces values in the "Priority" field with "High", "Medium", or "Low".
    #>
    [alias('TableReplace', 'EmailTableReplace', 'New-HTMLTableReplace')]
    [CmdletBinding()]
    param(
        [string] $FieldName,
        [string[]] $Replacements

    )
    [PSCustomObject]@{
        Type   = 'TableReplaceCompare'
        Output = @{
            $FieldName = $Replacements
        }
    }
}