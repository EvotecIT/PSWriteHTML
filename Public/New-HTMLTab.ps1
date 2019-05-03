function New-HTMLTab {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "No curly brace?)"),
        [Parameter(Mandatory = $false, Position = 1)][String]$TabHeading,
        [string] $TabIcon = 'fas fa-bomb',
        [alias('Name')][string] $TabName
    )
    $Script:HTMLSchema.Features.Tabs = $true
    $Script:HTMLSchema.Features.JQuery = $true

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
    $Tab.TabIcon = $TabIcon
    $Script:HTMLSchema.TabsHeaders.Add($Tab)
    # End Tab Tracking


    # This is building HTML
    if ($Tab.Active) {
        $Class = 'tabs-content active'
    } else {
        $Class = 'tabs-content'
    }

    New-HTMLTag -Tag 'div' -Attributes @{ id = $Tab.ID; class = $Class } {
        if (-not [string]::IsNullOrWhiteSpace($TabHeading)) {
            New-HTMLTag -Tag 'h7' {
                $TabHeading
            }
        }
        Invoke-Command -ScriptBlock $HtmlData
    }
}