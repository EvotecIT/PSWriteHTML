function New-HTMLTab {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $HtmlData = $(Throw "No curly brace?)"),
        [alias('TabName')][Parameter(Mandatory, Position = 1)][String] $Name,
        [Parameter(Mandatory = $false, Position = 2)][String]$TabHeading
    )
    # This tracks everything, especially needed for DataTables
    if ($Script:HTMLSchema.Tabs.Count -eq 0) {
        #   $Class = 'tab-pane active'
    } else {
        #  $Class = 'tab-pane'
    }
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

 
    # This is building HTML
    New-HTMLTag -Tag 'div' -Attributes @{ class = 'tab-content' } {
        New-HTMLTag -Tag 'div' -Attributes @{ id = $TabInformation.ID; class = $Class } {
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