#Get public and private function definition files.
$Public = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue -Recurse )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue -Recurse )
if ($PSEdition -eq 'Core') {
    $Assembly = @( Get-ChildItem -Path $PSScriptRoot\Lib\Core\*.dll -ErrorAction SilentlyContinue )
} else {
    $Assembly = @( Get-ChildItem -Path $PSScriptRoot\Lib\Default\*.dll -ErrorAction SilentlyContinue )
}
#Dot source the files
Foreach ($Import in @($Public + $Private)) {
    Try {
        . $Import.Fullname
    } Catch {
        Write-Error -Message "Failed to import function $($import.Fullname): $_"
    }
}

Foreach ($Import in @($Assembly)) {
    try {
        if ($Import.Extension -eq '.dll') {
            Add-Type -Path $Import.Fullname -ErrorAction Stop
        }
    } catch [System.Reflection.ReflectionTypeLoadException] {
        Write-Warning -Message "[x] Message: $($_.Exception.Message)"
        #Write-Warning -Message "StackTrace: $($_.Exception.StackTrace)"
        foreach ($_ in $($_.Exception.LoaderExceptions)) {
            Write-Warning -Message "[x] LoaderExceptions: $($_.Message) "
            #Write-Warning -Message "[x] LoaderExceptions: $($_.FileName)"
        }
        return
    }
}