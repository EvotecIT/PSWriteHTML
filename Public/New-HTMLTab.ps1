function New-HTMLTab {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "No curly brace?)"),
        [Parameter(Mandatory = $false, Position = 1)][String]$TabHeading,
        [alias('Name')][string] $TabName
    )
    <#
    if ($TabName -ne '') {
        # Start - Just in case you prefer to use old way - can be useful with tabs created out of order
        [Array] $Tabs = ($Script:HTMLSchema.TabsHeaders | Where-Object { $_.Name -eq $TabName})
        if ($Tabs.Count -gt 0) {
            $Tab = $Tabs[0]
            $Tab.Used = $true
            $Tab.Current = $true
        } else {
            Write-Warning "New-HTMLTab - Tab name $TabName is not defined in TabHeaders. Terminating!"
            Exit
        }
        # End
    } else {
        # Start Tabs Tracking - This code gets tab names from TabHeaders and uses its data. No need to define Tab Names for New-HTMLTab
        $Script:HTMLSchema.TabsHeaders | ForEach-Object { $_.Current = $false }
        [Array] $Tabs = ($Script:HTMLSchema.TabsHeaders | Where-Object { $_.Used -eq $false })
        if ($Tabs.Count -gt 0) {
            $Tab = $Tabs[0]
            $Tab.Used = $true
            $Tab.Current = $true
        } else {
            Write-Warning "New-HTMLTab - There are no unused tabs. Either TableHeaders are not defined or there are not enough of them. Terminating!"
            Exit
        }
        # End Tabs Tracking
    }
    #>

    # Reset all Tabs Headers to make sure there are no Current Tab Set
    # This is required for New-HTMLTable
    foreach ($Tab in $Script:HTMLSchema.TabsHeaders) {
        $Tab.Current = $false
    }

    # Start Tab Tracking
    $Tab = @{}
    $Tab.ID = "Tab-$(Get-RandomStringName -Size 8)"
    $Tab.Name = $TabName
    #$Tab.Used = $true
    $Tab.Current = $true
    if ($Script:HTMLSchema.TabsHeaders | Where-Object { $_.Active -eq $true }) {
        $Tab.Active = $false
    } else {
        $Tab.Active = $true
    }
    $Script:HTMLSchema.TabsHeaders.Add($Tab)
    # End Tab Tracking


    # This is building HTML
    if ($Tab.Active) {
        $Class = 'tab-pane active'
    } else {
        $Class = 'tab-pane'
    }
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'tab-content' } {
        New-HTMLTag -Tag 'div' -Attributes @{ id = $Tab.ID; class = $Class } {
            if (-not [string]::IsNullOrWhiteSpace($TabHeading)) {
                New-HTMLTag -Tag 'h7' {
                    $TabHeading
                }
            }
            Invoke-Command -ScriptBlock $HtmlData
        }
    }
}