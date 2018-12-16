function Get-Parameters {
    Param (
        $Cmdlet,
        [switch]$ShowCommon,
        [switch]$Full
    )
    $command = Get-Command $Cmdlet -ea silentlycontinue

    # resolve aliases (an alias can point to another alias)
    while ($command.CommandType -eq "Alias") {
        $command = Get-Command ($command.definition)
    }
    if (-not $command) { return }

    foreach ($paramset in $command.ParameterSets) {
        $Output = @()
        foreach ($param in $paramset.Parameters) {
            if ( ! $ShowCommon ) {
                if ($param.aliases -match "vb|db|ea|wa|ev|wv|ov|ob|wi|cf") { continue }
            }
            $process = "" | Select-Object Name, Type, ParameterSet, Aliases, Position, IsMandatory,
            Pipeline, PipelineByPropertyName
            $process.Name = $param.Name
            if ( $param.ParameterType.Name -eq "SwitchParameter" ) {
                $process.Type = "Boolean"
            } else {
                switch -regex ( $param.ParameterType ) {
                    "Nullable``1\[(.+)\]" { $process.Type = $matches[1].Split('.')[-1] + " (nullable)" ; break }
                    default { $process.Type = $param.ParameterType.Name }
                }
            }
            if ( $paramset.name -eq "__AllParameterSets" ) { $process.ParameterSet = "Default" }
            else { $process.ParameterSet = $paramset.Name }
            $process.Aliases = $param.aliases
            if ( $param.Position -lt 0 ) { $process.Position = $null }
            else { $process.Position = $param.Position }
            $process.IsMandatory = $param.IsMandatory
            $process.Pipeline = $param.ValueFromPipeline
            $process.PipelineByPropertyName = $param.ValueFromPipelineByPropertyName
            $output += $process
        }
        if ( ! $Full ) {
            $Output | Select-Object Name, Type, ParameterSet, IsMandatory, Pipeline
        } else { Write-Output $Output }
    }
}