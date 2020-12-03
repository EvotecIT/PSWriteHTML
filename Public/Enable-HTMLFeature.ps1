function Enable-HTMLFeature {
    [cmdletBinding()]
    param(
        [string[]] $Feature
    )
    foreach ($F in $Feature) {
        $Script:HTMLSchema.Features.$F = $true
    }
}

Register-ArgumentCompleter -CommandName Enable-HTMLFeature -ParameterName Feature -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    $Script:CurrentConfiguration.Features.Keys | Sort-Object | Where-Object { $_ -like "*$wordToComplete*" }
}