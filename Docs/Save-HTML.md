---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# Save-HTML
## SYNOPSIS
Saves HTML (text) to a file. Can be used with conjucncton with New-HTML.

## SYNTAX
### __AllParameterSets
```powershell
Save-HTML [[-FilePath] <string>] [-HTML] <string> [[-Encoding] <Object>] [[-Suppress] <bool>] [-ShowHTML] [-Format] [-Minify] [<CommonParameters>]
```

## DESCRIPTION
Saves HTML (text) to a file. Can be used with conjucncton with New-HTML, although New-HTML has Save-HTML built-in already when providing FilePath parameter.

## EXAMPLES

### EXAMPLE 1
```powershell
$Company = 'Evotec'
```

$Text = @"
This email is from Evotec. It may contain confidential information. It is intended for the addressee only and may not be copied or disclosed to any third party without our permission. If you are not the intended recipient please contact the sender as soon as possible and delete the material from any computer. If this email has been sent as a personal message to the addressee, the sender is not acting in his/her capacity as an employee or officer of $Company Limited and no liability is accepted for the content of any such email. Outgoing email may be monitored for the purpose of ensuring compliance with our email policy and relevant laws
"@

$HTML = New-HTMLText -FontSize 10 -FontFamily 'Source Sans Pro' -Text $Text
Save-HTML -FilePath $PSScriptRoot\Disclaimer.html -HTML $HTML -ShowHTML

### EXAMPLE 2
```powershell
$Test = EmailBody {
    EmailText -LineBreak
    EmailText -Text 'Z poważaniem' -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray -LineBreak
    EmailText -Text $DisplayName -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
    EmailText -Text $Title -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
    EmailText -Text $Department -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
    EmailText -LineBreak
    if ($Mobile) {
        EmailText -Text "m: $Mobile" -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
    }
    EmailText -Text "e: $Email" -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
    EmailText -LineBreak
    EmailText -Text $CompanyName -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
    EmailText -Text $StreetAddress -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
    EmailText -Text "$PostalCode $City" -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
    EmailText -LineBreak
    EmailText -Text "[www.aliorleasing.pl](https://www.aliorleasing.pl)" -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray
    EmailText -LineBreak
    EmailLayoutRow {
        EmailLayoutColumn {
            EmailImage -Source 'https://aliorleasing.pl/images/logoAL2.jpg' -UrlLink '' -AlternativeText 'Alior Leasing Logo' -Width '134' -Inline -Height '90'
        }
        EmailLayoutColumn {
```

}
        EmailLayoutColumn {
            EmailImage -Source 'https://aliorleasing.pl/images/akcia-nnw.jpg' -UrlLink '' -AlternativeText 'Alior Leasing Logo' -Width '300' -Inline -Height '90'
        }
    }
    EmailText -LineBreak
    EmailText -FontWeight bold, normal -FontSize 8pt -FontFamily 'Verdana,sans-serif' -Color Gray -Text "Alior Leasing", `
        " Spółka z ograniczoną odpowiedzialnością z siedzibą w Warszawie, ul. Łopuszańska 38D, 02-232 Warszawa, wpisana do rejestru przedsiębiorców Krajowego Rejestru Sądowego pod numerem KRS: 0000554171, której dokumentacja przechowywana jest w Sądzie Rejonowym dla M. St. Warszawy w Warszawie, XIV Wydział Gospodarczy Krajowego Rejestru Sądowego, NIP: 5223027866, REGON: 361335353, o kapitale zakładowym i wpłaconym: 15 009 000,00 PLN."
    EmailText -LineBreak
}

Save-HTML -FilePath $PSScriptRoot\Output\TestBody2.html -ShowHTML -HTML $Test

## PARAMETERS

### -Encoding
Provides ability to choose encoding of the HTML file. Not really required to use, as UTF8 is the default. Options available: 'Unknown', 'String', 'Unicode', 'Byte', 'BigEndianUnicode', 'UTF8', 'UTF7', 'UTF32', 'Ascii', 'Default', 'Oem', 'BigEndianUTF32'

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Unknown, String, Unicode, Byte, BigEndianUnicode, UTF8, UTF7, UTF32, Ascii, Default, Oem, BigEndianUTF32

Required: False
Position: 2
Default value: UTF8
Accept pipeline input: False
Accept wildcard characters: True
```

### -FilePath
Provides the path to the file to be created.

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

### -Format
Formats HTML output (including CSS/JS). Requires PSParseHTML to be installed and available.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -HTML
HTML (text) to be saved.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Minify
Minifies HTML output (including CSS/JS). Requires PSParseHTML to be installed and available.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -ShowHTML
Opens HTML in browser when generating of HTML is done. When no filepath is provided it uses temporary path instead. Good for testing.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: Show, Open
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -Suppress
If Suppress is used then no output is shown. If Suppress is set to false then FilePath is returned.

```yaml
Type: Boolean
Parameter Sets: __AllParameterSets
Aliases: Supress
Possible values: 

Required: False
Position: 3
Default value: True
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

