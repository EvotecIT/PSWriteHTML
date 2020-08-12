function Rename-Dictionary {
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