---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# Add-HTML
## SYNOPSIS
Adds HTML content to the email body.

## SYNTAX
### __AllParameterSets
```powershell
Add-HTML [[-HTML] <scriptblock>] [<CommonParameters>]
```

## DESCRIPTION
This function adds HTML content to the email body by executing the provided ScriptBlock containing the HTML code.

## EXAMPLES

### EXAMPLE 1
```powershell
$HTMLContent = {
    Set-Tag -HtmlObject @{
        Tag = 'div'
        Attributes = @{
            'class' = 'container'
        }
        Value = 'Hello, World!'
    }
}
```

Add-HTML -HTML $HTMLContent
Adds a <div class="container">Hello, World!</div> to the email body.

### EXAMPLE 2
```powershell
$HTMLContent = {
    Set-Tag -HtmlObject @{
        Tag = 'ul'
        Attributes = @{
            'id' = 'list'
        }
        Value = @(
            @{
                Tag = 'li'
                Value = 'Item 1'
            }
            @{
                Tag = 'li'
                Value = 'Item 2'
            }
        )
    }
}
```

Add-HTML -HTML $HTMLContent
Adds a list with items 'Item 1' and 'Item 2' to the email body.

## PARAMETERS

### -HTML
Specifies the ScriptBlock containing the HTML code to be added to the email body.

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

