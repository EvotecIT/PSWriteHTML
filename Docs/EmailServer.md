---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# EmailServer
## SYNOPSIS
Defines the email server configuration for sending emails.

## SYNTAX
### __AllParameterSets
```powershell
EmailServer [[-Server] <string>] [[-Port] <int>] [[-UserName] <string>] [[-Password] <string>] [-PasswordAsSecure] [-PasswordFromFile] [-SSL] [-UseDefaultCredential] [<CommonParameters>]
```

## DESCRIPTION
This function sets up the email server configuration including server address, port, authentication credentials, and SSL settings.

## EXAMPLES

### EXAMPLE 1
```powershell
EmailServer -Server "mail.example.com" -Port 587 -UserName "user@example.com" -Password "P@ssw0rd" -SSL
Configures the email server with the specified server address, port, username, password, and SSL enabled.
```

## PARAMETERS

### -Password
Specifies the password for authentication with the email server.

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

### -PasswordAsSecure
Indicates that the password should be treated as a secure string.

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

### -PasswordFromFile
Indicates that the password should be read from a file.

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

### -Port
Specifies the port number of the email server. Default is 587.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: 1
Default value: 587
Accept pipeline input: False
Accept wildcard characters: True
```

### -Server
Specifies the address of the email server.

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

### -SSL
Indicates whether SSL should be used for the connection.

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

### -UseDefaultCredential
Specifies whether to use default credentials for authentication.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: UseDefaultCredentials
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -UserName
Specifies the username for authentication with the email server.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

- `None`

## OUTPUTS

- `None`

## RELATED LINKS

- None

