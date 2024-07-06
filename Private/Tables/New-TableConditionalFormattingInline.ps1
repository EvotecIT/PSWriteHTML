function New-TableConditionalFormattingInline {
    <#
    .SYNOPSIS
    Creates conditional formatting for a table based on specified criteria.

    .DESCRIPTION
    This function applies conditional formatting to a table based on the provided criteria. It supports formatting based on numeric values and dates.

    .PARAMETER HeaderNames
    Specifies the names of the headers in the table.

    .PARAMETER ConditionalFormatting
    Specifies the criteria for conditional formatting. It includes the type of formatting (number or date), the operator (e.g., 'between', 'betweenInclusive'), and the value(s) to compare against.

    .PARAMETER RowData
    Specifies the data of a row in the table.

    .PARAMETER ColumnCount
    Specifies the number of columns in the table.

    .PARAMETER RowCount
    Specifies the number of rows in the table.

    .PARAMETER ColumnIndexHeader
    Specifies the index of the column header.

    .EXAMPLE
    $headerNames = @("Name", "Age", "Date")
    $conditionalFormatting = [PSCustomObject]@{
        Type = 'number'
        Operator = 'between'
        Value = @(20, 30)
    }
    $rowData = @("John", 25, "01/01/1990")
    $columnCount = 3
    $rowCount = 1
    $columnIndexHeader = 2

    New-TableConditionalFormattingInline -HeaderNames $headerNames -ConditionalFormatting $conditionalFormatting -RowData $rowData -ColumnCount $columnCount -RowCount $rowCount -ColumnIndexHeader $columnIndexHeader

    #>
    [CmdletBinding()]
    param(
        [string[]] $HeaderNames,
        [PSCustomObject] $ConditionalFormatting,
        [Array] $RowData,
        [int] $ColumnCount,
        [int] $RowCount,
        [int] $ColumnIndexHeader
    )
    [bool] $Pass = $false
    if ($ConditionalFormatting.Type -eq 'number') {
        if ($ConditionalFormatting.operator -in 'between', 'betweenInclusive') {
            [decimal] $returnedValueLeft = 0
            [bool] $resultLeft = [decimal]::TryParse($RowData[$ColumnCount], [ref]$returnedValueLeft)
            [bool] $resultRight = $false
            [Array] $returnedValueRight = foreach ($Value in $ConditionalFormatting.Value) {
                [decimal]$returnedValue = 0
                $resultRight = [decimal]::TryParse($Value, [ref]$returnedValue)
                if ($resultRight) {
                    $returnedValue
                } else {
                    break
                }
            }
        } else {
            [decimal] $returnedValueLeft = 0
            [bool]$resultLeft = [decimal]::TryParse($RowData[$ColumnCount], [ref]$returnedValueLeft)

            [decimal]$returnedValueRight = 0
            [bool]$resultRight = [decimal]::TryParse($ConditionalFormatting.Value, [ref]$returnedValueRight)
        }
        if ($resultLeft -and $resultRight) {
            $SideLeft = $returnedValueLeft
            $SideRight = $returnedValueRight
        } else {
            $SideLeft = $RowData[$ColumnCount]
            $SideRight = $ConditionalFormatting.Value
        }
    } elseif ($ConditionalFormatting.Type -eq 'date') {
        try {
            if ($ConditionalFormatting.DateTimeFormat) {
                $SideLeft = [DateTime]::ParseExact($RowData[$ColumnCount], $ConditionalFormatting.DateTimeFormat, $null)
            } else {
                $SideLeft = [DateTime]::Parse($RowData[$ColumnCount])
            }
        } catch {
            $SideLeft = $RowData[$ColumnCount]
            #Write-Warning "Table Condition $($RowData[$ColumnCount]) couldn't be converted to DateTime. Skipping."
        }
        $SideRight = $ConditionalFormatting.Value
    } else {
        $SideLeft = $RowData[$ColumnCount]
        $SideRight = $ConditionalFormatting.Value
    }
    if ($ConditionalFormatting.ReverseCondition) {
        $TempSide = $SideLeft
        $SideLeft = $SideRight
        $SideRight = $TempSide
    }
    if ($ConditionalFormatting.Operator -eq 'gt') {
        $Pass = $SideLeft -gt $SideRight
    } elseif ($ConditionalFormatting.Operator -eq 'lt') {
        $Pass = $SideLeft -lt $SideRight
    } elseif ($ConditionalFormatting.Operator -eq 'eq') {
        $Pass = $SideLeft -eq $SideRight
    } elseif ($ConditionalFormatting.Operator -eq 'le') {
        $Pass = $SideLeft -le $SideRight
    } elseif ($ConditionalFormatting.Operator -eq 'ge') {
        $Pass = $SideLeft -ge $SideRight
    } elseif ($ConditionalFormatting.Operator -eq 'ne') {
        $Pass = $SideLeft -ne $SideRight
    } elseif ($ConditionalFormatting.Operator -eq 'in') {
        $Pass = $SideLeft -in $SideRight
    } elseif ($ConditionalFormatting.Operator -eq 'notin') {
        $Pass = $SideLeft -notin $SideRight
    } elseif ($ConditionalFormatting.Operator -eq 'like') {
        $Pass = $SideLeft -like $SideRight
    } elseif ($ConditionalFormatting.Operator -eq 'contains') {
        $Pass = $SideLeft -contains $SideRight
    } elseif ($ConditionalFormatting.Operator -eq 'betweenInclusive') {
        $Pass = $SideLeft -ge $SideRight[0] -and $SideLeft -le $SideRight[1]
    } elseif ($ConditionalFormatting.Operator -eq 'between') {
        $Pass = $SideLeft -gt $SideRight[0] -and $SideLeft -lt $SideRight[1]
    }
    $Pass
}