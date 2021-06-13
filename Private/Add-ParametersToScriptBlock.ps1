function Add-ParametersToScriptBlock {
    [CmdletBinding()]
    param(
        [scriptblock] $ScriptBlock,
        [System.Collections.IDictionary] $Parameter
    )

    if ($ScriptBlock) {
        if ($Parameter) {
            $Count = 0
            [string] $ScriptBlockParams = @(
                "param("
                foreach ($Key in $Parameter.Keys) {
                    $Count++
                    if ($Count -eq $Parameter.Keys.Count) {
                        "`$$($Key)"
                    } else {
                        "`$$($Key),"
                    }
                }
                ")"
                $ScriptBlock.ToString()
            )
            $ScriptBlockScript = [scriptblock]::Create($ScriptBlockParams)
            $ScriptBlockScript
        } else {
            $ScriptBlock
        }
    }

}