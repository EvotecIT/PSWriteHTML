---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLFooter
## SYNOPSIS
Building block for use within New-HTML. Provides ability to define footer.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLFooter [[-HTMLContent] <scriptblock>] [<CommonParameters>]
```

## DESCRIPTION
Building block for use within New-HTML. Provides ability to define footer. Additional way of managing how HTML content is displayed.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example34_01.html" {
    New-HTMLHeader {
        New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
    }
    New-HTMLMain {
        New-HTMLTab -TabName 'Test' {
            New-HTMLSection -HeaderText '0 section' {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter -Simplify
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
            }
        }
        New-HTMLTab -TabName 'Test5' {
            New-HTMLSection -HeaderText '1 section' {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                    # New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
            }
        }
    }
    New-HTMLFooter {
        New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
    }
} -Online -ShowHTML
```

## PARAMETERS

### -HTMLContent
Define one or more HTML elements

```yaml
Type: ScriptBlock
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

