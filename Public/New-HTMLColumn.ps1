Function New-HTMLColumn {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false, Position = 0)][ValidateNotNull()][ScriptBlock] $Content = $(Throw "Open curly brace with Content"),
        [int]$ColumnNumber = 1,
        [int]$ColumnCount = 1
    )
    Begin {
        $HTML = New-GenericList -Type [string]
    }
    Process {
        $ColumnItem = [string]$ColumnNumber + "of" + [string]$ColumnCount
        Write-Verbose $ColumnItem
        $ColumnItem = $ColumnItem.replace('1', 'one').replace('2', 'two').replace('3', 'three').replace('4', 'four').replace('5', 'five').replace('6', 'six')
        Write-Verbose $ColumnItem
        $HTML.Add('<div class="' + $ColumnItem + ' column">')

        $HTML.Add((Invoke-Command -ScriptBlock $Content))
    }
    End {
        $HTML.Add('</div>')
        return $HTML
    }
}