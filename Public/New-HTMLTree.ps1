function New-HTMLTree {
    [CmdletBinding()]
    param(
        [scriptblock] $Nodes,
        [ValidateSet('none', 'checkbox', 'radio')][string] $Checkbox = 'none',
        [ValidateSet('none', '1', '2', '3')] $SelectMode = '2'
    )
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.Jquery = $true
    $Script:HTMLSchema.Features.FancyTree = $true

    [string] $ID = "FancyTree" + (Get-RandomStringName -Size 8)

    $FancyTree = @{

    }

    $FancyTree['extensions'] = @("edit", "filter")

    if ($Checkbox -eq 'none') {
        #$FancyTree['checkbox'] = $Checkbox # true/false/radio
    } elseif ($Checkbox -eq 'radio') {
        $FancyTree['checkbox'] = 'radio'
    } else {
        $FancyTree['checkbox'] = $true
    }
    <#
    Fancytree supports three modes:

    selectMode: 1: single selection, Only one node is selected at any time.
    selectMode: 2: multiple selection (default), Every node may be selected independently.
    selectMode: 3: hierarchical selection, (De)selecting a node will propagate to all descendants. Mixed states will be displayed as partially selected using a tri-state checkbox.
    #>
    if ($SelectMode -ne 'none') {
        $FancyTree['selectMode'] = $SelectMode # 3, // 1, 2, 3
    }

    [Array] $Source = & $Nodes
    if ($Source.Count -gt 0) {
        $FancyTree['source'] = $Source
    }
    Remove-EmptyValue -Hashtable $FancyTree -Rerun 1 -Recursive

    # Build HTML
    $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = $ID; class = 'fancyTree' }

    $Script = New-HTMLTag -Tag 'script' -Value {
        $DivID = -join ('#', $ID)
        # Convert Dictionary to JSON and return chart within SCRIPT tag
        # Make sure to return with additional empty string
        $FancyTreeJSON = $FancyTree | ConvertTo-Json -Depth 100 | ForEach-Object { [System.Text.RegularExpressions.Regex]::Unescape($_) }

        '$(function(){  // on page load'
        "`$(`"$DivID`").fancytree("
        $FancyTreeJSON
        ');'
        '});'
    } -NewLine

    # Return Data
    $Div
    $Script
}