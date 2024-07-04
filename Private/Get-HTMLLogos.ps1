Function Get-HTMLLogos {
    <#
    .SYNOPSIS
    Retrieves HTML logos from specified paths and converts them to binary format.

    .DESCRIPTION
    This function retrieves HTML logos from specified paths and converts them to binary format. It allows for customization of left and right logos with default names "Sample" and "Alternate" respectively.

    .PARAMETER LeftLogoName
    The name of the left logo. Default is "Sample".

    .PARAMETER RightLogoName
    The name of the right logo. Default is "Alternate".

    .PARAMETER LeftLogoString
    The path to the left logo file.

    .PARAMETER RightLogoString
    The path to the right logo file.

    .EXAMPLE
    Get-HTMLLogos -LeftLogoName "CompanyLogo" -LeftLogoString "C:\Logos\CompanyLogo.png"
    Retrieves the left logo named "CompanyLogo" from the specified path.

    .EXAMPLE
    Get-HTMLLogos -RightLogoName "BrandLogo" -RightLogoString "C:\Logos\BrandLogo.jpg"
    Retrieves the right logo named "BrandLogo" from the specified path.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$LeftLogoName = "Sample",
        [string]$RightLogoName = "Alternate",
        [string]$LeftLogoString,
        [string]$RightLogoString

    )
    $LogoSources = [ordered] @{ }
    $LogoPath = @(
        if ([String]::IsNullOrEmpty($RightLogoString) -eq $false -or [String]::IsNullOrEmpty($LeftLogoString) -eq $false) {
            if ([String]::IsNullOrEmpty($RightLogoString) -eq $false) {
                $LogoSources.Add($RightLogoName, $RightLogoString)
            }
            if ([String]::IsNullOrEmpty($LeftLogoString) -eq $false) {
                $LogoSources.Add($LeftLogoName, $LeftLogoString)
            }
        } else {
            "$PSScriptRoot\..\Resources\Images\Other"
        }
    )
    $ImageFiles = Get-ChildItem -Path (Join-Path $LogoPath '\*') -Include *.jpg, *.png, *.bmp -Recurse
    foreach ($ImageFile in $ImageFiles) {
        $ImageBinary = Convert-ImageToBinary -ImageFile $ImageFile
        $LogoSources.Add($ImageFile.BaseName, $ImageBinary)
    }
    $LogoSources
}