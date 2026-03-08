---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-DiagramEvent
## SYNOPSIS
Allows to connect Diagrams with Tables using Events.

## SYNTAX
### __AllParameterSets
```powershell
New-DiagramEvent [[-ID] <string>] [[-ColumnID] <int>] [<CommonParameters>]
```

## DESCRIPTION
Allows to connect Diagrams with Tables using Events.

## EXAMPLES

### EXAMPLE 1
```powershell
$Processes = Get-Process | Select-Object -First 3 -Property Name, ProcessName, Id, FileVersion, WorkingSet
$TableID = 'RandomID'
```

New-HTML -TitleText 'My Title' -Online -FilePath $PSScriptRoot\Example30-LinkedProcesses.html -ShowHTML {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -DataTableID $TableID
        }
        New-HTMLPanel {
            New-HTMLDiagram {
                New-DiagramEvent -ID $TableID -ColumnID 2
                New-DiagramNode -Label 'Processes' -IconBrands delicious
                foreach ($_ in $Processes) {
                    New-DiagramNode -Label $_.ProcessName -Id $_.Id -To 'Processes'
                }
            }
        }
    }
}

## PARAMETERS

### -ColumnID
Column Number of the table to connect with the diagram.

```yaml
Type: Nullable`1
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -ID
ID of the table to connect with the diagram.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

