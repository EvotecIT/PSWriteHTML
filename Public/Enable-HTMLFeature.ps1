function Enable-HTMLFeature {
    <#
    .SYNOPSIS
    Provides a way to enable existing feature or extending PSWriteHTML

    .DESCRIPTION
    Provides a way to enable existing feature or extending PSWriteHTML

    .PARAMETER Feature
    Choose one of the existing features or define them via extension

    .PARAMETER Configuration
    Provide hashtable with configuration of libraries

    .EXAMPLE
    Enable-HTMLFeature -Feature Raphael, Mapael, Jquery, JQueryMouseWheel, "MapaelMaps_$Map" -Configuration $Script:Configuration

    .NOTES
    General notes
    #>
    [cmdletBinding()]
    param(
        [string[]] $Feature,
        [System.Collections.IDictionary] $Configuration
    )
    if (-not $Script:HTMLSchema) {
        Write-Warning -Message "Enable-HTMLFeature - no HTMLSchema defined. Using cmdlets outside of New-HTML will not generate missing CSS/JS content."
        return
    }
    foreach ($F in $Feature) {
        $Script:HTMLSchema.Features.$F = $true
    }
    if ($Configuration) {
        # Allows for extending PSWriteHTML with other modules
        foreach ($Library in $Configuration.Keys) {
            $Script:CurrentConfiguration['Features'][$Library] = $Configuration[$Library]
        }
    }
}

Register-ArgumentCompleter -CommandName Enable-HTMLFeature -ParameterName Feature -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    $Script:CurrentConfiguration.Features.Keys | Sort-Object | Where-Object { $_ -like "*$wordToComplete*" }
}