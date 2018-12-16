Function Get-HTMLColorSchemes {
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $false)][String]$SchemePath
    )
    if ([String]::IsNullOrEmpty($SchemePath)) {
        $SchemePath = "$PSScriptRoot\..\Resources\ColorSchemas"
    }
    $Schemes = @{}
    Write-Verbose "Retrieving *.rcs from $SchemePath"
    $SchemeFiles = @(Get-ChildItem $SchemePath -Filter '*.rcs' -Recurse )
    foreach ($SchemeFile in $SchemeFiles) {
        $SchemeContent = Import-Csv -Delimiter ';' -Path $SchemeFile.FullName
        $Schemes.Add($SchemeFile.BaseName, $SchemeContent)
    }
    $Schemes.add('Generated1', (Get-RandomColorScheme -NumberOfSchemes 80))
    $Schemes.add('Generated2', (Get-RandomColorScheme -NumberOfSchemes 80))
    $Schemes.add('Generated3', (Get-RandomColorScheme -NumberOfSchemes 80))
    $Schemes.add('Generated4', (Get-RandomColorScheme -NumberOfSchemes 80))
    $Schemes.add('Generated5', (Get-RandomColorScheme -NumberOfSchemes 80))
    $Schemes.add('Generated6', (Get-RandomColorScheme -NumberOfSchemes 80))
    $Schemes.add('Generated7', (Get-RandomColorScheme -NumberOfSchemes 80))
    $Schemes.add('Generated8', (Get-RandomColorScheme -NumberOfSchemes 80))
    Write-Output $Schemes
}