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
        [Parameter(Mandatory = $false)]
        [string]$FilePath,
        [Parameter(Mandatory = $true)]
        [Array] $HTML,
        [Parameter(Mandatory = $false)]
        [switch]$ShowHTML
    )

    if ([string]::IsNullOrEmpty($FilePath)) {
        Write-Warning "Save-HTMLReport - FilePath parameter $ReportPath is empty, using Temporary"
        $FilePath = Get-FileName -Temporary -Extension 'html'
    } else {
        if (Test-Path -Path $FilePath) {
            Write-Warning 'Save-HTMLReport - Path already exists. Report will be overwritten.'
        }
    }
    Write-Verbose "Saving HTML to file $FilePath"


    $HTML | Set-Content -Path $FilePath -Force
    Write-Verbose $FilePath
    if ($ShowHTML) {
        #Start-Sleep -Seconds 1
        Invoke-Item $FilePath
    }
    Write-Output $FilePath
}