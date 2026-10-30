function Get-TableExportScript {
    <#
    .SYNOPSIS
    Adds PSWriteHTML export policy to the existing Buttons configurations.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [string] $ExportScope
    )
    $Replacements = @{}
    for ($Index = 0; $Index -lt $Options.buttons.Count; $Index++) {
        $Button = $Options.buttons[$Index]
        if ($Button.extend -notin 'excelHtml5', 'csvHtml5', 'copyHtml5', 'pdfHtml5', 'print') { continue }
        # Excel's old numeric conversion is replaced by the shared export policy.
        if ($Button.exportOptions -and $Button.exportOptions.format -eq 'findExportOptions') { $Button.exportOptions.Remove('format') }
        $Json = ConvertTo-HTMLScriptJson -InputObject $Button -Depth 8 -Compress
        $ScopeJson = ConvertTo-HTMLScriptJson -InputObject $ExportScope -Compress
        $Marker = "pswhExportButton$Index"
        $Replacements[$Marker] = "pswhConfigureExport($Json, $ScopeJson)"
        $Options.buttons[$Index] = $Marker
    }
    if ($Replacements.Count -gt 0) {
        $Script:HTMLSchema.CustomFooterJS['PSWriteHTMLExportPolicy'] = [IO.File]::ReadAllText((Join-Path $MyInvocation.MyCommand.Module.ModuleBase 'Resources/JS/pswritehtml-table-export.js'))
    }
    return $Replacements
}
