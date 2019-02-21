function New-HTMLTab {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "No curly brace?)"),
        [alias('TabName')][Parameter(Mandatory, Position = 1)][String] $Name,
        [Parameter(Mandatory = $false, Position = 2)][String]$TabHeading
    )
    <#
    $Script:HTMLSchema.Tabs.Add($Name)

    $TabInformation = foreach ($Tab in $Script:HTMLSchema.TabsHeaders) {
        if ($Tab.Name -eq $Name) {          
            if ($Tab.Number -eq 0) {
                $Class = 'tab-pane active'
            } else {
                $Class = 'tab-pane'
            }
            $Tab
            $Script:HTMLSchema.TabsCurrent = $Tab
            break           
        }
    }
    #>
    # $Script:HTMLSchema.TabsHeaders.Count
    $Script:HTMLSchema.TabsHeaders | ForEach-Object { $_.Current = $false }
    [Array] $Tabs = ($Script:HTMLSchema.TabsHeaders | Where-Object { $_.Used -eq $false })
    #Write-Color "Tabs count ", $Tabs.Count
    #Write-COlor $Tabs[0].Name, ' ', $Tabs[0].Used, ' ', $Tabs[0].Active, ' ', $Tabs[0].Current
    #$Tabs[0] | Format-Stream
    $Tabs[0].Used = $true
    $Tabs[0].Current = $true
    if ($Tabs[0].Active) {
        $Class = 'tab-pane active'
    } else {
        $Class = 'tab-pane'
    }


    #Write-Verbose 

    # This is building HTML
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'tab-content' } {
        New-HTMLTag -Tag 'div' -Attributes @{ id = $Tabs[0].ID; class = $Class } {
            #New-HTMLTag -Tag 'div' -Attributes @{ id = $Name; class = 'insideTab' } {
            if (-not [string]::IsNullOrWhiteSpace($TabHeading)) {
                New-HTMLTag -Tag 'h7' {
                    $TabHeading
                }
            }
            Invoke-Command -ScriptBlock $HtmlData
        }
    }
    
    <#
    New-HTMLResourceJS -Content {
        #// Get the element with id="defaultOpen" and click on it
        'document.getElementById("defaultOpen").click();'
    } 
    #>  
}