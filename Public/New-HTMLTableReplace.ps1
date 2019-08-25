function New-HTMLTableReplace {
    [alias('TableReplace', 'EmailTableReplace')]
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