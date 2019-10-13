function New-TableReplace {
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