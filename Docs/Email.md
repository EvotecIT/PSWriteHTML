---
external help file: PSWriteHTML-help.xml
Module Name: PSWriteHTML
online version: https://github.com/EvotecIT/PSWriteHTML
schema: 2.0.0
---
# Email
## SYNOPSIS
Sends an email with specified parameters.

## SYNTAX
### __AllParameterSets
```powershell
Email [[-Email] <scriptblock>] [-To <string[]>] [-CC <string[]>] [-BCC <string[]>] [-ReplyTo <string>] [-From <string>] [-Subject <string>] [-AttachSelf] [-AttachSelfName <string>] [-Server <string>] [-Username <string>] [-Port <int>] [-Password <string>] [-PasswordFromFile] [-PasswordAsSecure] [-SSL] [-Priority <string>] [-DeliveryNotifications <Object>] [-Encoding <string>] [-FilePath <string>] [-Suppress <bool>] [-Online] [-OutputHTML] [-WhatIf] [<CommonParameters>]
```

## DESCRIPTION
This function sends an email with the provided parameters including recipients, subject, content, and server settings.

## EXAMPLES

### EXAMPLE 1
```powershell
Email -FilePath 'C:\Path'
```

## PARAMETERS

### -AttachSelf
Switch parameter to attach the email to itself.

```yaml
Type: SwitchParameter
Parameter Sets: __AllParameterSets
Aliases: SelfAttach
Possible values: 

Required: False
Position: named
Default value: False
Accept pipeline input: False
Accept wildcard characters: True
```

### -AttachSelfName
Specifies the name of the attached email.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -BCC
Specifies the email addresses of the blind carbon copy recipients.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -CC
Specifies the email addresses of the carbon copy recipients.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -DeliveryNotifications
Specifies the type of delivery notifications. Valid values are 'None', 'OnSuccess', 'OnFailure', 'Delay', or 'Never'. Default is 'None'.

```yaml
Type: Object
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: None, OnSuccess, OnFailure, Delay, Never

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Email
Specifies the ScriptBlock containing the email content and additional parameters.

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

### -Encoding
[Obsolete] Deprecated parameter. Encoding is set to UTF8 to prevent errors.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -FilePath
Specifies the file path for attachments.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -From
Specifies the email address of the sender.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Online
Switch parameter to send the email online without saving it.

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

### -OutputHTML
Switch parameter to output the email content as HTML.

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

### -Password
Specifies the password for authentication with the SMTP server.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -PasswordAsSecure
Switch parameter to treat the password as a secure string.

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
Switch parameter to indicate that the password is read from a file.

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
Specifies the port number for the SMTP server. Default is 587.

```yaml
Type: Int32
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: 587
Accept pipeline input: False
Accept wildcard characters: True
```

### -Priority
Specifies the priority of the email. Valid values are 'Low', 'Normal', or 'High'. Default is 'Normal'.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: Low, Normal, High

Required: False
Position: named
Default value: Normal
Accept pipeline input: False
Accept wildcard characters: True
```

### -ReplyTo
Specifies the email address to set as the reply-to address.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Server
Specifies the SMTP server for sending the email.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -SSL
Switch parameter to enable SSL for the SMTP connection.

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

### -Subject
Specifies the subject of the email.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Suppress
Switch parameter to suppress sending the email.

```yaml
Type: Boolean
Parameter Sets: __AllParameterSets
Aliases: Supress
Possible values: 

Required: False
Position: named
Default value: True
Accept pipeline input: False
Accept wildcard characters: True
```

### -To
Specifies the email addresses of the primary recipients.

```yaml
Type: String[]
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### -Username
Specifies the username for authentication with the SMTP server.

```yaml
Type: String
Parameter Sets: __AllParameterSets
Aliases: 
Possible values: 

Required: False
Position: named
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

