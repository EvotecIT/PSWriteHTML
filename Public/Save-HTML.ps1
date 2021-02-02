Function Save-HTML {
    <#
    .SYNOPSIS
    #

    .DESCRIPTION
    Long description

    .PARAMETER FilePath
    Parameter description

    .PARAMETER HTML
    Parameter description

    .PARAMETER ShowHTML
    Parameter description

    .PARAMETER Encoding
    Parameter description

    .PARAMETER Supress
    Parameter description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $false)][string]$FilePath,
        [Parameter(Mandatory = $true)][string] $HTML,
        [alias('Show', 'Open')][Parameter(Mandatory = $false)][switch]$ShowHTML,
        [ValidateSet('Unknown', 'String', 'Unicode', 'Byte', 'BigEndianUnicode', 'UTF8', 'UTF7', 'UTF32', 'Ascii', 'Default', 'Oem', 'BigEndianUTF32')] $Encoding = 'UTF8',
        [alias('Supress')][bool] $Suppress = $true,
        [switch] $Format,
        [switch] $Minify
    )
    if ([string]::IsNullOrEmpty($FilePath)) {
        $FilePath = Get-FileName -Temporary -Extension 'html'
        Write-Verbose "Save-HTML - FilePath parameter is empty, using Temporary $FilePath"
    } else {
        if (Test-Path -LiteralPath $FilePath) {
            Write-Verbose "Save-HTML - Path $FilePath already exists. Report will be overwritten."
        }
    }
    Write-Verbose "Save-HTML - Saving HTML to file $FilePath"

    if ($Format -or $Minify) {
        $Commands = Get-Command -Name 'Format-HTML' -ErrorAction SilentlyContinue
        if ($Commands -and $Commands.Source -eq 'PSParseHTML') {
            if ($Format) {
                $HTML = Format-HTML -Content $HTML
            }
            if ($Minify) {
                $HTML = Optimize-HTML -Content $HTML
            }
        } else {
            Write-Warning "Save-HTML - Minify or Format functionality requires PSParseHTML module. Please install it using Install-Module PSParseHTML -Force."
        }
    }
    try {
        $HTML | Set-Content -LiteralPath $FilePath -Force -Encoding $Encoding -ErrorAction Stop
        if (-not $Suppress) {
            $FilePath
        }
    } catch {
        $ErrorMessage = $_.Exception.Message -replace "`n", " " -replace "`r", " "
        $FilePath = Get-FileName -Temporary -Extension 'html'
        Write-Warning "Save-HTML - Failed with error: $ErrorMessage"
        Write-Warning "Save-HTML - Saving HTML to file $FilePath"
        try {
            $HTML | Set-Content -LiteralPath $FilePath -Force -Encoding $Encoding -ErrorAction Stop
        } catch {
            $ErrorMessage = $_.Exception.Message -replace "`n", " " -replace "`r", " "
            Write-Warning "Save-HTML - Failed with error: $ErrorMessage`nPlease define a different path for the `'-FilePath`' parameter."
        }
    }
    if ($ShowHTML) {
        try {
            Invoke-Item -LiteralPath $FilePath -ErrorAction Stop
        } catch {
            $ErrorMessage = $_.Exception.Message -replace "`n", " " -replace "`r", " "
            Write-Verbose "Save-HTML - couldn't open file $FilePath in a browser. Error: $ErrorMessage"
        }
    }
}