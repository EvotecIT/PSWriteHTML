function Rename-Dictionary {
    <#
    .SYNOPSIS
    Renames keys in a dictionary based on a set of key-value pairs.

    .DESCRIPTION
    This function renames keys in a dictionary based on a set of key-value pairs provided. It iterates through each pair and updates the dictionary keys accordingly.

    .PARAMETER HashTable
    Specifies the dictionary whose keys are to be renamed.

    .PARAMETER Pair
    Specifies an array of dictionaries containing key-value pairs for renaming keys.

    .EXAMPLE
    $ExistingDictionary = @{
        Test     = 'SomeValue'
        OtherKey = 'SomeOtherValue'
    }

    $ExpectedSheetsConfiguration = [ordered] @{
        Test     = "defaultSection-$(Get-RandomStringName -Size 7)"
        OtherKey = "defaultSectionText-$(Get-RandomStringName -Size 7)"
    }

    Rename-Dictionary -HashTable $ExistingDictionary -Pair $ExpectedSheetsConfiguration
    Renames the keys in $ExistingDictionary based on the key-value pairs provided in $ExpectedSheetsConfiguration.

    #>
    [cmdletBinding()]
    param(
        [System.Collections.IDictionary] $HashTable,
        [System.Collections.IDictionary[]] $Pair
    )
    foreach ($P in $Pair) {
        foreach ($Key in [string[]] $P.Keys) {
            $HashTable[$($P[$Key])] = $HashTable[$Key]
            $HashTable.Remove($Key)
        }
    }
}
<#
$ExistingDictionary = @{
    Test     = 'SomeValue'
    OtherKey = 'SomeOtherValue'
}

$ExpectedSheetsConfiguration = [ordered] @{
    Test     = "defaultSection-$(Get-RandomStringName -Size 7)"
    OtherKey = "defaultSectionText-$(Get-RandomStringName -Size 7)"
}


Rename-Dictionary -HashTable $ExistingDictionary -Pair $ExpectedSheetsConfiguration
#>