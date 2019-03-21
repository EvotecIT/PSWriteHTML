Function Save-HTML {
    <#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .PARAMETER FilePath
    Parameter description

    .PARAMETER HTML
    Parameter description

    .PARAMETER ShowReport
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
        [Parameter(Mandatory = $true)][Array] $HTML,
        [Parameter(Mandatory = $false)][switch]$ShowHTML
       # [switch] $Supress
    )
    if ([string]::IsNullOrEmpty($FilePath)) {
        $FilePath = Get-FileName -Temporary -Extension 'html'
        Write-Warning "Save-HTML - FilePath parameter $FilePath is empty, using Temporary $FilePath"
    } else {
        if (Test-Path -LiteralPath $FilePath) {
            Write-Warning "Save-HTML - Path $FilePath already exists. Report will be overwritten."
        }
    }
    Write-Verbose "Save-HTML - Saving HTML to file $FilePath"


    $HTML | Set-Content -Path $FilePath -Force
    Write-Verbose $FilePath
    if ($ShowHTML) {
        #Start-Sleep -Seconds 1
        Invoke-Item $FilePath
    }
   # if (-not $Supress) {
   #     $FilePath
   # }
}