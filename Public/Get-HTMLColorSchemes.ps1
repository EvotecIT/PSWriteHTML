Function Get-HTMLColorSchemes
{
    [CmdletBinding()]
	param
    (
        [Parameter(Mandatory=$false)]
        [String]$SchemePath
    )
    if([String]::IsNullOrEmpty($SchemePath))
    {
        $SchemePath= "$((Get-Item $PSScriptRoot).Parent.FullName)\\Resources\ColorSchemas"
     }
    $Schemes=@{}
    Write-Verbose "Retrieving *.rcs from $SchemePath"
    $SchemeFiles = @(Get-ChildItem $SchemePath -Filter '*.rcs' -Recurse )
    foreach ($SchemeFile in $SchemeFiles)
    {
        $SchemeContent=Import-Csv -Delimiter ';' -Path $SchemeFile.FullName
        $Schemes.Add($SchemeFile.BaseName,$SchemeContent)
    }
    $Schemes.add('Generated1',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated2',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated3',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated4',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated5',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated6',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated7',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated8',(GenerateRandomColorScheme -NumberOfSchemes 80))
	Write-Output $Schemes
}