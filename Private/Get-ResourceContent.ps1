function Get-ResourceContent {
    param(
        [string[]]$FilePath
    )
    foreach ($File in $FilePath) {
        if ($File -ne '' -and (Test-Path -LiteralPath $FilePath)) {
          # if ($File -like '*.min.*') {
        #        Write-Verbose "Generating Style Header from - $($File) (minified file)"
            #    Get-Content -Path $File
          # } else {
                Write-Verbose "Generating Style Header from - $($File) (from non-minified file (adding delimiter))"
                Get-Content -Path $File #-Delimiter "`r`n"
           # }
        }
    }
}