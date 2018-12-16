Function Save-HTMLToBlobStorage {
    <#
	.SYNOPSIS
		generation of  report and invokes the file to open
#>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true)]
        [Array]
        $ReportContent,
        [Parameter(Mandatory = $true)]
        [string]
        $resourceGroupName = "",
        [Parameter(Mandatory = $true)]
        [string]
        $storageAccountName = "",
        [Parameter(Mandatory = $true)]
        [string]
        $storageContainerName = "",
        [Parameter(Mandatory = $false)]
        [string]
        $ReportPrefix = "HTMLReport"
    )

    $localFileName = "{0}\report.html" -f $env:TEMP
    $ReportContent | Set-Content -Path $localFileName
    $blobFileName = $ReportPrefix + "-{0}" -f [guid]::NewGuid() + ".html"

    Write-Output ("Saving the report to storage")
    Write-Output ("Resource Group: {0}" -f $resourceGroupName)
    Write-Output ("Storage Account: {0}" -f $storageAccountName)
    Write-Output ("Storage Container: {0}" -f $storageContainerName)
    Write-Output ("Blob: {0}" -f $blobFileName)

    Set-AzureRmCurrentStorageAccount   -ResourceGroupName $resourceGroupName  -Name $storageAccountName | Out-Null

    $storageAccount = Get-AzureRmStorageAccount `
        -ResourceGroupName $resourceGroupName `
        -Name $storageAccountName

    $storageAccountContainer = Get-AzureStorageContainer `
        -Name $storageContainerName

    $blob = Set-AzureStorageBlobContent `
        -Container $storageContainerName `
        -Blob $blobFileName `
        -File $localFileName

    Write-Output ("Click the link below to view the report")
    $url = "https://{0}.blob.core.windows.net/{1}/{2}" -f $storageAccountName, $storageContainerName, $blob.Name
    $hash = @{
        type  = "hyperlink";
        name  = "Report: {0}" -f $blob.Name;
        value = $url
    }
    Write-Output($hash)
}