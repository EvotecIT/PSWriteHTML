$Script:ScriptBlockColors = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    $Script:RGBColors.Keys | Sort-Object | Where-Object { $_ -like "*$wordToComplete*" }
}