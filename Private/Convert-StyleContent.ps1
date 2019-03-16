function Convert-StyleContent {
    [CmdLetBinding()]
    param(
        [string[]] $CSS,
        [string] $ImagesPath,
        [string] $SearchPath
    )

    #Get-ObjectType -Object $CSS -VerboseOnly -Verbose

    $ImageFiles = Get-ChildItem -Path (Join-Path $ImagesPath '\*') -Include *.jpg, *.png, *.bmp #-Recurse
    foreach ($Image in $ImageFiles) {
        #$Image.FullName
        #$Image.Name
        $CSS = Convert-ImagesToBinary -Content $CSS -Search "$SearchPath$($Image.Name)" -ReplacePath $Image.FullName
    }
    return $CSS
}

#

#Convert-StyleContent -ImagesPath "$PSScriptRoot\..\Resources\Images\DataTables" -SearchPath "DataTables-1.10.18/images/"