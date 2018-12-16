Function Get-HTMLLogos {
    <#
	 	.SYNOPSIS
		    Get Base64 HTML

	#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $false)]
        [String] $LogoPath,

        [switch] $Builtin
    )
    if ($Builtin) {
        $LogoPath = "$((get-item $PSScriptRoot).Parent.FullName)\Resources\Images"
    } else {
        if ([String]::IsNullOrEmpty($LogoPath)) {
            return @{}
        }
    }

    $LogoSources = @{}
    $ImageFiles = Get-ChildItem -Path (join-path $LogoPath '\*') -Include *.jpg, *.png, *.bmp -Recurse
    foreach ($ImageFile in $ImageFiles) {
        if ($ImageFile.Extension -eq '.jpg') {
            $FileType = 'jpeg'
        } else {
            $FileType = $ImageFile.Extension.Replace('.', '')
        }
        Write-Verbose "Converting $($ImageFile.FullName) to base64 ($FileType)"
        $LogoSources.Add($ImageFile.BaseName, "data:image/$FileType;base64," + [Convert]::ToBase64String((Get-Content $ImageFile.FullName -Encoding Byte)))
    }
    Write-Output $LogoSources

}