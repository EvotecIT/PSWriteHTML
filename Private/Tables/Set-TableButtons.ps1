function Set-TableButtons {
    <#
    .SYNOPSIS
    Builds the configured table buttons and enables only their required assets.
    #>
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [Array] $CustomButtons,
        [string[]] $Buttons,
        [string] $Title,
        [switch] $HideButtons,
        [switch] $DisablePaging,
        [switch] $ScrollY,
        [string] $ToggleViewDefaultViewMode
    )
    if (-not $Script:HTMLSchema['TableSimplify'] -and -not $HideButtons) {
        $Script:HTMLSchema.Features.DataTablesButtons = $true
        $Options['buttons'] = @(
            if ($CustomButtons) {
                foreach ($Button in $CustomButtons) {
                    if (-not $Button.Title -and $Title) {
                        $Button.title = $Title
                    }
                    if ($Button.extend -eq 'searchBuilder' -and $Button.text) {
                        if (-not $Options.Contains('language') -or -not $Options['language']) {
                            $Options['language'] = [ordered]@{}
                        }
                        if (-not $Options['language'].Contains('searchBuilder') -or -not $Options['language']['searchBuilder']) {
                            $Options['language']['searchBuilder'] = [ordered]@{}
                        }
                        $Options['language']['searchBuilder']['button'] = $Button.text
                    }
                    $Button
                }
            } else {
                foreach ($button in $Buttons) {
                    if ($button -eq 'pdfHtml5') {
                        $ButtonOutput = [ordered] @{
                            extend      = 'pdfHtml5'
                            pageSize    = 'A3'
                            orientation = 'landscape'
                            title       = $Title
                        }
                        $Script:HTMLSchema.Features.DataTablesButtonsPDF = $true
                    } elseif ($button -eq 'pageLength') {
                        if (-not $DisablePaging -and -not $ScrollY) {
                            $ButtonOutput = @{
                                extend = $button
                            }
                        } else {
                            $ButtonOutput = $null
                        }
                    } elseif ($button -eq 'excelHtml5') {
                        $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
                        $Script:HTMLSchema.Features.DataTablesButtonsExcel = $true
                        $ButtonOutput = [ordered] @{
                            extend        = $button
                            title         = $Title
                            exportOptions = @{
                                #columns = 'visible'
                                format = "findExportOptions"
                            }
                        }
                    } elseif ($button -eq 'copyHtml5') {
                        $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
                        $ButtonOutput = [ordered] @{
                            extend = $button
                            title  = $Title
                        }
                    } elseif ($button -eq 'csvHtml5') {
                        $Script:HTMLSchema.Features.DataTablesButtonsHTML5 = $true
                        $ButtonOutput = [ordered] @{
                            extend         = $button
                            title          = $Title
                            text           = 'CSV'
                            charset        = 'utf-8'
                            extension      = '.csv'
                            fieldSeparator = ';'
                            fieldBoundary  = '"'
                            #filename       = 'export'
                            bom            = $true
                        }
                    } elseif ($button -eq 'searchPanes') {
                        $Script:HTMLSchema.Features.DataTablesSearchPanes = $true
                        $ButtonOutput = [ordered] @{
                            extend = $button
                            title  = $Title
                        }
                    } elseif ($button -eq 'print') {
                        $Script:HTMLSchema.Features.DataTablesButtonsPrint = $true
                        $ButtonOutput = [ordered] @{
                            extend = $button
                            title  = $Title
                        }
                    } elseif ($button -eq 'searchBuilder') {
                        $Script:HTMLSchema.Features.DataTablesDateTime = $true
                        $Script:HTMLSchema.Features.DataTablesSearchBuilder = $true
                        $ButtonOutput = [ordered] @{
                            extend = $button
                            title  = $Title
                            #config = @{
                            #depthLimit = 2
                            #}
                        }
                    } elseif ($button -eq 'columnVisibility') {
                        $Script:HTMLSchema.Features.DataTablesButtonsColVis = $true
                        $Script:HTMLSchema.Features.DataTablesButtonsColVis = $true
                        $ButtonOutput = [ordered] @{
                            extend           = 'colvis'
                            title            = $Title
                            collectionLayout = 'dropdown columns'
                            collectionTitle  = 'Visibility control'
                        }
                    } elseif ($button -eq 'toggleView') {
                        # Set initial button text based on starting mode
                        if ($ToggleViewDefaultViewMode -eq 'scrollx') {
                            $ButtonText = 'Switch to Responsive'
                        } else {
                            $ButtonText = 'Switch to ScrollX'
                        }
                        $ButtonOutput = [ordered] @{
                            extend          = 'toggleView'
                            title           = $Title
                            text            = $ButtonText
                            defaultViewMode = $ToggleViewDefaultViewMode
                        }
                    } else {
                        $ButtonOutput = [ordered] @{
                            extend = $button
                            title  = $Title
                        }
                    }
                    if ($ButtonOutput) {
                        Remove-EmptyValue -Hashtable $ButtonOutput
                        $ButtonOutput
                    }
                }
            }
        )
    } else {
        $Options['buttons'] = @()
    }
}
