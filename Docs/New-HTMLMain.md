---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# New-HTMLMain
## SYNOPSIS
Defines the body HTML content. By default this is not required, but can be useful when header and footer are used to explicitly define the main content.

## SYNTAX
### __AllParameterSets
```powershell
New-HTMLMain [[-HTMLContent] <scriptblock>] [[-BackgroundColor] <string>] [[-Color] <string>] [[-FontFamily] <string>] [[-FontSize] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Defines the body HTML content. By default this is not required, but can be useful when header and footer are used to explicitly define the main content.

## EXAMPLES

### EXAMPLE 1
```powershell
New-HTML -TitleText 'My title' -Online -FilePath $PSScriptRoot\Example40-Body.html -Show {
    New-HTMLMain {
        New-HTMLTabStyle -SlimTabs `
            -BorderBottomStyleActive solid -BorderBottomColorActive LightSkyBlue -BackgroundColorActive none `
            -TextColorActive Black -Align left -BorderRadius 0px -RemoveShadow -TextColor Grey -TextTransform capitalize #-FontSize 10pt
```

New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor Grey
        New-HTMLTab -Name 'First Level Tab - Test 1' -IconBrands acquisitions-incorporated {
            New-HTMLTab -Name '2nd Level Tab - Test 4/1' -IconBrands app-store {
                New-HTMLSection -HeaderText 'Default Section Style' {
                    New-HTMLTableStyle -Type Header -TextAlign right -TextColor Blue
                    New-HTMLTableStyle -Type Row -TextAlign left -TextColor Grey
                    New-HTMLTable -DataTable $Test1 {
                        New-HTMLTableHeader -Names 'ID', 'HandleCount'
                    } -Filtering #-HideFooter -FilteringLocation Both
                } -CanCollapse
            }
        }
        New-HTMLTab -Name 'Next' {

        }
    } -BackgroundColor Yellow -Color Red -FontSize 12px #-FontFamily 'Arial'
}

### EXAMPLE 2
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

### -BackgroundColor
Define a background color of the body element. You can choose from 800 defined colors or provide your own hex color

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Color
Choose a color of the body element. You can choose from 800 defined colors or provide your own hex color

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontFamily
Choose a FontFamily for the body content

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FontSize
Choose a FontSize for the body content

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -HTMLContent
Provides ability to specify one or more elements within HTML. Using New-HTMLMain without it, makes no larger sense, as the content will be empty.

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

