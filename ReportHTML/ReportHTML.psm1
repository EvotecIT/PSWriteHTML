#region Included Base64 Sources

$Script:SAMPLE_LOGO_SOURCE=@"
data:image/jpeg;base64,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
"@

$Script:CORPORATE_LOGO_SOURCE=@"
data:image/jpeg;base64,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
"@

$Script:ALTERNATE_LOGO_SOURCE=@'
data:image/jpeg;base64,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
'@

#endregion

#region Report Options

Function New-HTMLReportOptions
{
    [CmdletBinding(DefaultParameterSetName='NoSave')]
    param
    (
        [Parameter(Mandatory=$false,ParameterSetName='NoSave')]
        [Parameter(Mandatory=$false,ParameterSetName='Save')]
        [System.Collections.Hashtable]
		$LogoSources,
		[Parameter(Mandatory=$false,ParameterSetName='NoSave')]
        [Parameter(Mandatory=$false,ParameterSetName='Save')]
        [System.Collections.Hashtable]
        $ColorSchemes,
        [Parameter(Mandatory=$false,ParameterSetName='NoSave')]
        [Parameter(Mandatory=$false,ParameterSetName='Save')]
        $CSSName = "default",
        [Parameter(Mandatory=$false,ParameterSetName='NoSave')]
        [Parameter(Mandatory=$false,ParameterSetName='Save')]
        [String]
        $CSSPath,
        [Parameter(Mandatory=$false,ParameterSetName='NoSave')]
        [Parameter(Mandatory=$false,ParameterSetName='Save')]
        [String]
        $ScriptPath,
        [Parameter(Mandatory=$false,ParameterSetName='NoSave')]
        [Parameter(Mandatory=$false,ParameterSetName='Save')]
        [String]
        $ColorSchemePath,
        [Parameter(Mandatory=$false,ParameterSetName='NoSave')]
        [Parameter(Mandatory=$false,ParameterSetName='Save')]
        [String]
        $LogoPath,
        [Parameter(Mandatory=$false,ParameterSetName='Save')]
        [String]$SaveOptionsPath,
		[Parameter(Mandatory=$false,ParameterSetName='NoSave')]
		[Parameter(Mandatory=$false,ParameterSetName='Save')]
        [String]
		$ReportPath
    )
	if($ColorSchemes -eq $null)
    {
		$ColorSchemes=Get-HTMLColorSchemes -SchemePath $ColorSchemePath
	}
    if ($LogoSources -eq $null)
	{
		$LogoSources = Get-HTMLLogos -LogoPath $LogoPath
	}
	$ScriptHeaderContent=Get-HTMLJavaScripts -ScriptPath $ScriptPath

	$StyleHeaderContent = Get-HTMLCSS -Builtin

	$StyleHeaderContent += Get-HTMLCSS -CSSPath $CSSPath -CSSName $CSSName

    $Options= [PSCustomObject] @{
        Logos= $LogoSources;
        ScriptContent=$ScriptHeaderContent;
        StyleContent=$StyleHeaderContent;
        ColorSchemes=$ColorSchemes;
    }
	set-variable -Name GlobalColorSchemes -Value $ColorSchemes -Scope Global
    if ([string]::IsNullOrEmpty($SaveOptionsPath)) {
		Write-Output $Options
	} else {
        Write-Verbose "Saving Report CSS to $SaveOptionsPath"
        $StyleHeaderContent|Set-Content -Path (Join-Path $SaveOptionsPath default.css)
        Write-Verbose "Saving Report Color Schemes to $SaveOptionsPath"
        foreach ($SchemeName in $ColorSchemes.Keys)
        {
			$ColorSchemes[$SchemeName]| ConvertTo-Csv  -NoTypeInformation -Delimiter ';' | % {$_.Replace('"','')} | Out-File (Join-Path $SaveOptionsPath "$schemeName.rcs")
        }
		foreach ($LogoSource in $LogoSources.keys)
		{
			[IO.File]::WriteAllBytes((Join-Path $SaveOptionsPath "$LogoSource.jpg"), [Convert]::FromBase64String($LogoSources[$LogoSource].split(',')[1]))
		}
		foreach ($CSSFile in $CSSFiles)
		{
			get-content $CSSFile.FullName | set-content (Join-Path $SaveOptionsPath $CSSFile.name)
		}

    }
}


Function Get-HTMLLogos
{
	<#
	 	.SYNOPSIS
		    Get Base64 HTML

	#>
 	[CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false)]
        [String] $LogoPath
    )
	if([String]::IsNullOrEmpty($LogoPath))
	{
	    if([string]::IsNullOrEmpty($PSScriptRoot))
	    {
	        $LogoPath=$PSCmdlet.SessionState.Path.CurrentLocation.Path
	    }
	    else
	    {
	        $LogoPath = $PSScriptRoot
			#$LogoPath = 'C:\Users\matt.quickenden\Documents\GitHub\AzureFieldNotes\ReportHTML\ReportHTML'
        }
    }

	$LogoSources = @{}
    $ImageFiles = Get-ChildItem -Path (join-path $LogoPath '\*') -Include *.jpg,*.png,*.bmp
    foreach ($ImageFile in $ImageFiles)
    {
		if ($ImageFile.Extension -eq '.jpg') {
			$FileType = 'jpeg'
		} else {
			$FileType = $ImageFile.Extension.Replace('.','')
		}
		Write-Verbose "Converting $($ImageFile.FullName) to base64 ($FileType)"
		$LogoSources.Add($ImageFile.BaseName,"data:image/$FileType;base64," + [Convert]::ToBase64String((Get-Content $ImageFile.FullName -Encoding Byte)))
    }
	Write-Output $LogoSources

}

Function Get-HTMLCSS
{
    <#
	    .SYNOPSIS
		    Get's HTML Cascading Style Sheet
        .PARAMETER CSSName
		    Name of the CSS
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false)]
        [String]
        $CSSPath,
		[Parameter(Mandatory=$false)]
        [String]
		$CSSName,

		[switch] $Builtin
	)

	if ($Builtin) {
		$CSSPath="$PSScriptRoot\CSS\StylesAlways"
	} else {
		if([String]::IsNullOrEmpty($CSSPath))
		{
			$CSSPath="$PSScriptRoot\CSS\Styles"
		}
	}
    Write-Verbose "Retrieving *.css from $CSSPath"


	$CSSFiles = @((get-childitem $CSSPath -Filter '*.css'))

	if (-not $Builtin) {
		$CssFiles =	$CSSFiles | Where-Object { $_.BaseName -eq $CSSName }
	}
	#if ([string]::IsNullOrEmpty($CSSName))
	#{
#		Write-Verbose "CSS - 2Load $($CssFiles -join ',') "
#		Write-Output $CSSFiles
#	}
#	Else
#	{
#		Write-Verbose "CSS - 1Load $($CSSFiles | ? {$_.basename -eq $CSSName}).fullname) "
#		get-content ($CSSFiles | ? {$_.basename -eq $CSSName}).fullname

#	}
	$CSSHeaders = @()
	foreach ($CssFile in $CSSFiles) {
		#$CSSHeaders += "`r`n" + '<script type="text/javascript">  '+ "`r`n"
		$CSSHeaders += '<style type="text/css">'
		if ($CssFile -like '*.min.*') {
			Write-Verbose "Generating Style Header from - $($CssFile.FullName) (minified file)"

			$CSSHeaders += Get-Content -Path $CssFile.FullName #-Delimiter "`r`n"

		} else {
			Write-Verbose "Generating Style Header from - $($CssFile.FullName) (from non-minified file (adding delimiter))"
			$CSSHeaders += Get-Content -Path $CssFile.FullName -Delimiter "`r`n"
		}
		$CSSHeaders += '</style>'
		#$CSSHeaders += '</script> '
	}
	Write-Output $CSSHeaders



	#get-content ($CSSFiles | ? {$_.name -eq "$CSSName.css"}).fullname | ForEach-Object{$StyleHeaderContent  += "`r`n" + $_  }
}

Function Get-HTMLJavaScripts
{
<#
	.SYNOPSIS
		Get's Script File from module directory
#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false)]
        [String]
        $ScriptPath
    )
    if([String]::IsNullOrEmpty($ScriptPath))
    {
        if([string]::IsNullOrEmpty($PSScriptRoot))
        {
            $ScriptPath=$PSCmdlet.SessionState.Path.CurrentLocation.Path
        }
        else
        {
            $ScriptPath=$PSScriptRoot
        }
    }
    Write-Verbose "Retrieving *.js from $ScriptPath"
	$ScriptFiles = @((get-childitem $ScriptPath -Filter '*.js' ).Fullname)
	$ScriptHeaders = @()
	foreach ($ScriptFile in $ScriptFiles) {
		$ScriptHeaders += "`r`n" + '<script type="text/javascript">  '+ "`r`n"
		if ($ScriptFile -like '*.min.*') {
			Write-Verbose "Generating Script Header from minified file - $ScriptFile"
			$ScriptHeaders += Get-Content -Path $ScriptFile #-Delimiter "`r`n"
		} else {
			Write-Verbose "Generating Script Header from non-minified file (adding delimiter) $ScriptFile"
			$ScriptHeaders += Get-Content -Path $ScriptFile -Delimiter "`r`n"
		}
		$ScriptHeaders += '</script> '
	}
	Write-Output $ScriptHeaders
}

Function Get-HTMLColorSchemes
{
    [CmdletBinding()]
	param
    (
        [Parameter(Mandatory=$false)]
        [String]$SchemePath
    )
    if([String]::IsNullOrEmpty($SchemePath))
    {
        if([string]::IsNullOrEmpty($PSScriptRoot))
        {
            $SchemePath=$PSCmdlet.SessionState.Path.CurrentLocation.Path
        }
        else
        {
            $SchemePath=$PSScriptRoot
        }
    }
    $Schemes=@{}
    Write-Verbose "Retrieving *.rcs from $SchemePath"
    $SchemeFiles = @(get-childitem $SchemePath -Filter '*.rcs' )
    foreach ($SchemeFile in $SchemeFiles)
    {
        $SchemeContent=Import-Csv -Delimiter ';' -Path $SchemeFile.FullName
        $Schemes.Add($SchemeFile.BaseName,$SchemeContent)
    }
    $Schemes.add('Generated1',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated2',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated3',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated4',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated5',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated6',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated7',(GenerateRandomColorScheme -NumberOfSchemes 80))
	$Schemes.add('Generated8',(GenerateRandomColorScheme -NumberOfSchemes 80))
	Write-Output $Schemes
}

Function Connect-HTMLToAzure
{

	[CmdletBinding()]
	Param
	(
		$connectionName = "AzureRunAsConnection"
	)
	Write-Output ("Prepare Azure Connection")

	try
	{
	    # Get the connection "AzureRunAsConnection "
	    $servicePrincipalConnection=Get-AutomationConnection -Name $connectionName

	    #"Logging in to Azure..."
	    Add-AzureRmAccount `
	        -ServicePrincipal `
	        -TenantId $servicePrincipalConnection.TenantId `
	        -ApplicationId $servicePrincipalConnection.ApplicationId `
	        -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint | Out-Null
	}
	catch {
	    if (!$servicePrincipalConnection)
	    {
	        $ErrorMessage = "Connection $connectionName not found."
	        throw $ErrorMessage
	    } else{
	        Write-Error -Message $_.Exception
	        throw $_.Exception
	    }
	}
}

#endregion

#region Internal Functions

Function Get-Functions
{
	PAram ($pattern, $path="$pwd\*", [switch]$Recurse = $false)
      $parser = [System.Management.Automation.PSParser]
      Get-ChildItem (join-Path $path '\*') -Recurse:$Recurse -Include *.ps1, *.psm1 | ForEach {
            $content = [IO.File]::ReadAllText($_.FullName)
            $tokens = $parser::Tokenize($content, [ref] $null)
            $count = $tokens.Count
            $(
                  for($idx=0; $idx -lt $count; $idx += 1) {
                        if($tokens[$idx].Content -eq 'function') {
                              $targetToken = $tokens[$idx+1]
                              New-Object PSObject -Property @{
                                    FileName = $_.FullName
                                    FunctionName = $targetToken.Content

                              Line = $targetToken.StartLine
                              } | Select FunctionName, FileName, Line
                        }
                  }
            ) #| Where {$_.FunctionName -match $pattern}
      }
}

function Get-Parameters
{
	Param ( $Cmdlet, [switch]$ShowCommon, [switch]$Full )
      $command = Get-Command $Cmdlet -ea silentlycontinue

      # resolve aliases (an alias can point to another alias)
      while ($command.CommandType -eq "Alias") {
            $command = Get-Command ($command.definition)
      }
      if (-not $command) { return }

      foreach ($paramset in $command.ParameterSets){
            $Output = @()
            foreach ($param in $paramset.Parameters) {
                  if ( ! $ShowCommon ) {
                        if ($param.aliases -match "vb|db|ea|wa|ev|wv|ov|ob|wi|cf") { continue }
                  }
                  $process = "" | Select-Object Name, Type, ParameterSet, Aliases, Position, IsMandatory,
                  Pipeline, PipelineByPropertyName
                  $process.Name = $param.Name
                  if ( $param.ParameterType.Name -eq "SwitchParameter" ) {
                        $process.Type = "Boolean"
                  }
                  else {
                        switch -regex ( $param.ParameterType ) {
                              "Nullable``1\[(.+)\]" { $process.Type = $matches[1].Split('.')[-1] + " (nullable)" ; break }
                              default { $process.Type = $param.ParameterType.Name }
                        }
                  }
                  if ( $paramset.name -eq "__AllParameterSets" ) { $process.ParameterSet = "Default" }
                  else { $process.ParameterSet = $paramset.Name }
                  $process.Aliases = $param.aliases
                  if ( $param.Position -lt 0 ) { $process.Position = $null }
                  else { $process.Position = $param.Position }
                  $process.IsMandatory = $param.IsMandatory
                  $process.Pipeline = $param.ValueFromPipeline
                  $process.PipelineByPropertyName = $param.ValueFromPipelineByPropertyName
                  $output += $process
            }
            if ( ! $Full ) {
                  $Output | Select-Object Name, Type, ParameterSet, IsMandatory, Pipeline
            }
            else { Write-Output $Output }
      }
}

Function grc
{
<#
.SYNOPSIS
	Random colour Function
#>
	param(
		[int]$Min =0,
		[int]$max =255
	)
	Write-Output ([string](Get-Random -Maximum $max -Minimum $Min) + ',' )
}

Function GenerateRandomColorScheme
{
<#
.SYNOPSIS
	Generate a colour scheme
.PARAMETER $NumberOfSchemes
#>
	param
	(
		[Parameter(Mandatory=$false)]
		[int]
		$NumberOfSchemes =1
	)

	$Hover = '0.3)'
	$color = '0.6)'
	$border = '1)'
	$background =  '0.7)'
	$ColorSwing = 8

	$ColorReference  = Get-Random -Minimum 1 -Maximum 3
	$BaseColor = (Get-Random -Maximum (200 - $ColorSwing) -Minimum (50 + $ColorSwing))
	$BCMax = $BaseColor + $ColorSwing
	$BCMin = $BaseColor - $ColorSwing

	$ColorScheme = @()
	$i = 0
	while ($i -ne $NumberOfSchemes ) {
		switch ($ColorReference)
		{
			1 {$base = 'rgba('+ (grc -min  $BCMin -max $BCMax) + (grc) + (grc) }
			2 {$base = 'rgba('+ (grc) + (grc -min  $BCMin -max $BCMax) + (grc) }
			3 {$base = 'rgba('+ (grc) + (grc) + (grc -min  $BCMin -max $BCMax) }
		}

		$Scheme = '' | select Colour,Background, Hover ,Border
		$Scheme.Background 	= $base + $background
		$Scheme.Border 		= $base + $border
		$Scheme.Colour 		= $base + $color
		$Scheme.Hover 		= $base + $Hover
		$ColorScheme += $Scheme
		$i++
	}

	Write-Output $ColorScheme
}


#endregion

#Region HTML Functions

Function Get-HTMLOpenPage
{
<#
	.SYNOPSIS
		Get's HTML for the header of the HTML report
    .PARAMETER TitleText
		The title of the report
	.PARAMETER CSSLocation
		Directory containing CSS files. used in conjuction with CSSName
	.PARAMETER CSSName
		If only used with CSSLocation path will search for CSS file with CSSName, otherwise the CSSName can refernce one of the three built in templates.
        This function will Append .css extension
#>

    [CmdletBinding(DefaultParameterSetName='options')]
    param
    (
        [Parameter(Mandatory=$false,ParameterSetName='options')]
        [Parameter(Mandatory=$false,ParameterSetName='explicit')]
        [String]$TitleText,
        [Parameter(Mandatory=$false,ParameterSetName='explicit')]
	    [String]$CSSPath,
        [Parameter(Mandatory=$false,ParameterSetName='explicit')]
	    [String]$CSSName = "default",
	    [Parameter(Mandatory=$false,ParameterSetName='explicit')]
	    [String]$ScriptPath,
        [Parameter(Mandatory=$false,ParameterSetName='explicit')]
	    [String]$ColorSchemePath,
	    [Parameter(Mandatory=$false,ParameterSetName='explicit')]
	    [String]$LogoPath,
		[Parameter(Mandatory=$false,ParameterSetName='explicit')]
	    [string]$LeftLogoName = "Sample",
	    [Parameter(Mandatory=$false,ParameterSetName='explicit')]
        [string]$RightLogoName = "Alternate",
	    [Parameter(Mandatory=$false,ParameterSetName='explicit')]
        [string]$LeftLogoString,
	    [Parameter(Mandatory=$false,ParameterSetName='explicit')]
        [string]$RightLogoString,
        [Parameter(Mandatory=$false,ParameterSetName='options')]
	    [Parameter(Mandatory=$false,ParameterSetName='explicit')]
	    [switch]$HideLogos,
        [Parameter(Mandatory=$false,ParameterSetName='options')]
	    [Parameter(Mandatory=$false,ParameterSetName='explicit')]
	    [switch]$HideTitle,
        [Parameter(Mandatory=$false,ParameterSetName='options')]
	    [Parameter(Mandatory=$false,ParameterSetName='explicit')]
        [switch]$NoScript,
        [Parameter(Mandatory=$false,ParameterSetName='options')]
        [PSobject]$Options,
		[Parameter(Mandatory=$false,ParameterSetName='explicit')]
	    [string]$PrimaryColorHex
    )

    if($PSCmdlet.ParameterSetName -eq 'options')
    {
        if($Options -eq $null)
        {
            $Options=New-HTMLReportOptions
        }
    }
    else
    {
        if([String]::IsNullOrEmpty($RightLogoString) -eq $false -or [String]::IsNullOrEmpty($LeftLogoString) -eq $false)
        {
            $LogoSources=@{}
            if([String]::IsNullOrEmpty($RightLogoString) -eq $false)
            {
                $LogoSources.Add($RightLogoName,$RightLogoString)
            }
            if([String]::IsNullOrEmpty($LeftLogoString) -eq $false)
            {
                $LogoSources.Add($LeftLogoName,$LeftLogoString)
            }
        }
		if(!([String]::IsNullOrEmpty($LogoPath))){
			$LogoSources = Get-HTMLLogos -logopath $LogoPath

		}


        $Options=New-HTMLReportOptions -LogoSources $LogoSources -CSSName $CSSName `
            -CSSPath $CSSPath -ScriptPath $ScriptPath -ColorSchemePath $ColorSchemePath
    }
    if($HideLogos.IsPresent -eq $false)
    {
        $Leftlogo=$Options.Logos[$LeftLogoName]
        $Rightlogo=$Options.Logos[$RightLogoName]
        $LogoContent=@"
            <table><tbody>
            <tr>
                <td class="clientlogo"><img src="$Leftlogo" /></td>
                <td class="MainLogo"><img src="$Rightlogo" /></td>
            </tr>
            </tbody></table>
"@
    }

$HtmlContent=@"
    <!DOCTYPE HTML>
    <!--- This page was autogenerated $CurrentDate By $env:USERNAME -->
    <html>
        <!-- Header -->
        <head>

"@
if ($hideTitle.ispresent -eq $false)
{
$HtmlContent += "        <Title>$TitleText</Title>"
}


# Replace PNG / JPG files in Styles

if ($null -ne $Options.StyleContent) {

	Write-Verbose "Logos: $($Options.Logos.Keys -join ',')"
	foreach ($Logo in $Options.Logos.Keys) {
		$Search = "../images/$Logo.png"
		$Replace = $Options.Logos[$Logo]

		$Options.StyleContent = ($Options.StyleContent).Replace($Search, $Replace)
	}
}


$HtmlContent += @"
            <!-- Styles -->
            $($Options.StyleContent)
            <!-- Scripts -->
            $($Options.ScriptContent)
        </head>
        <!-- Body -->
        <body onload="hide();">
"@
if ($hideTitle.ispresent -eq $false)
{
$HtmlContent += @"

			<!-- Report Header -->
            $LogoContent
            <div class="pageTitle">$TitleText</div>
            <hr />
            <div class="ReportCreated">Report created on $(Get-Date -format "MMM d, yyyy hh:mm tt")</div>

"@
}
    if (!([string]::IsNullOrEmpty($PrimaryColorHex)))
	{
		if ($PrimaryColorHex.Length -eq 7)
		{
			$HtmlContent = $HtmlContent -replace '#337E94', $PrimaryColorHex
		}
		else
		{
			Write-Warning '$PrimaryColorHex must be 7 characters with hash eg "#337E94"'
		}
	}

	Write-Output $HtmlContent
}

Function Get-HTMLClosePage
{
<#
	.SYNOPSIS
		Get's the closing segment for the HTML
	    .PARAMETER ClientLogoType
			The type of logo
		.PARAMETER AdditionalContent
		     Some additional pish
#>
    [CmdletBinding()]
    param(
		[String]$FooterText
	)
if ($FooterText -eq $null)
{
	$Report = @"
<hr />
<!-- FOOTER -->
<div class="footer">Copyright &#169; $([DateTime]::Now.Year) Azure Cloud Enablement. All Rights Reserved.</div>

<!-- END BODY -->
</body>
</html>

"@
}
else
{
$Report = @"
<hr />
<!-- FOOTER -->
<div class="footer">$FooterText</div>

<!-- END BODY -->
</body>
</html>

"@
}
	Write-Output $Report
}

Function Get-HTMLContentOpen
{
<#
	.SYNOPSIS
		Creates a section in HTML
	    .PARAMETER HeaderText
			The heading for the section
		.PARAMETER IsHidden
		    Switch parameter to define if the section can collapse
		.PARAMETER BackgroundShade
		    An int for 1 to 6 that defines background shading
#>
    [CmdletBinding()]
    Param
    (
	    [Parameter(Mandatory=$false)]
        [string]$HeaderText,
	    [Parameter(Mandatory=$false)]
        [switch]$IsHidden,
	    [Parameter(Mandatory=$false)]
        [string]$Anchor,
	    [Parameter(Mandatory=$false)]
        [validateset(1,2,3,4,5,6)]
        [int]$BackgroundShade
    )

    switch ($BackgroundShade)
    {
        1 { $bgColorCode = "#F8F8F8" }
	    2 { $bgColorCode = "#D0D0D0" }
        3 { $bgColorCode = "#A8A8A8" }
        4 { $bgColorCode = "#888888" }
        5 { $bgColorCode = "#585858" }
        6 { $bgColorCode = "#282828" }
        default { $bgColorCode = "#ffffff" }
    }

    if ([String]::IsNullOrEmpty($Anchor)) {
	    $InsertAnchor = 'name="' + $Anchor +'"'
    }

if ($IsHidden) {
	$RandomNumber = Get-Random
	$Report = @"
<div class="section">
<div class="header">
    <a name="$($HeaderText)">$($HeaderText)</a> (<a id="show_$RandomNumber" href="#" onclick="show('$RandomNumber');" style="color: #ffffff;">Show</a><a id="hide_$RandomNumber" href="#" onclick="hide('$RandomNumber');" style="color: #ffffff; display:none;">Hide</a>)
</div>
<div class="content" id="$RandomNumber" style="display:none;background-color:$($bgColorCode);">
"@
}
else {
	$Report = @"
<div class="section">
<div class="header">
    <a name="$($HeaderText)">$($HeaderText)</a>
</div>
<div class="content" style="background-color:$($bgColorCode);">
"@
}
	Return $Report
}

Function Get-HTMLContentClose
{
<#
	.SYNOPSIS
		Closes an HTML section
#>
    [CmdletBinding()]
    param()
	$Report = @"
    </div>
    </div>
"@
	Return $Report
}

Function Get-HTMLContentTable
{
<#
	.SYNOPSIS
		Creates an HTML table from an array of objects
	    .PARAMETER ArrayOfObjects
			An array of objects
		.PARAMETER Fixed
		    fixes the html column width by the number of columns
		.PARAMETER GroupBy
		    The column to group the data.  make sure this is first in the array
		.PARAMETER Column Totals
		    an Array of headers from that exist in the array of objects to be summed up
#>
param(
	[Array]$ArrayOfObjects,
	[String]$GroupBy,
	[Array]$ColumnCounts,
	[Switch]$Fixed,
	[Array]$ColumnAverages,
	[Switch]$NoSortableHeader,
	[Array]$ColumnTotals

)
	if ($GroupBy -eq '') {
		$Report = $ArrayOfObjects | ConvertTo-Html -Fragment
		$Report = $Report -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', ""
		$Report = $Report -replace "<tr>(.*)<td>Green</td></tr>","<tr class=`"green`">`$+</tr>"
		$Report = $Report -replace "<tr>(.*)<td>Yellow</td></tr>","<tr class=`"yellow`">`$+</tr>"
    	$Report = $Report -replace "<tr>(.*)<td>Red</td></tr>","<tr class=`"red`">`$+</tr>"
		$Report = $Report -replace "<tr>(.*)<td>Odd</td></tr>","<tr class=`"odd`">`$+</tr>"
		$Report = $Report -replace "<tr>(.*)<td>Even</td></tr>","<tr class=`"even`">`$+</tr>"
		$Report = $Report -replace "<tr>(.*)<td>None</td></tr>","<tr>`$+</tr>"
		$Report = $Report -replace '<th>RowColor</th>', ''

		if ($Fixed.IsPresent)
		{
			$Report = $Report -replace '<table>', '<table class="fixed">'
		}
		else
		{
			if (!($NoSortableHeader)) {	$Report = $Report -replace '<table>', '<table class="sortable">' }
		}
	}
	else {
		$NumberOfColumns = ($ArrayOfObjects | Get-Member -MemberType NoteProperty  | Select-Object Name).Count
		$Groupings = @()
		$ArrayOfObjects | Select-Object $GroupBy -Unique  | Sort-Object $GroupBy | ForEach-Object { $Groupings += [String]$_.$GroupBy}
		if ($Fixed.IsPresent) {	$Report = '<table class="fixed">' }
		else { $Report = '<table>' }
		$GroupHeader = $ArrayOfObjects | ConvertTo-Html -Fragment
		$GroupHeader = $GroupHeader -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', "" -replace '<table>', "" -replace '</table>', "" -replace "<td>.+?</td>" -replace "<tr></tr>", ""
		$GroupHeader = $GroupHeader -replace '<th>RowColor</th>', ''
		$Report += $GroupHeader
		foreach ($Group in $Groupings) {
			$Report += "<tr><td colspan=`"$NumberOfColumns`" class=`"groupby`">$Group</td></tr>"
			$GroupBody = $ArrayOfObjects | Where-Object { [String]$($_.$GroupBy) -eq $Group } | Select-Object * -ExcludeProperty $GroupBy | ConvertTo-Html -Fragment
			$GroupBody = $GroupBody -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', "" -replace '<table>', "" -replace '</table>', "" -replace "<th>.+?</th>" -replace "<tr></tr>", "" -replace '<tr><td>', "<tr><td></td><td>"
			$GroupBody = $GroupBody -replace "<tr>(.*)<td>Green</td></tr>","<tr class=`"green`">`$+</tr>"
			$GroupBody = $GroupBody -replace "<tr>(.*)<td>Yellow</td></tr>","<tr class=`"yellow`">`$+</tr>"
    		$GroupBody = $GroupBody -replace "<tr>(.*)<td>Red</td></tr>","<tr class=`"red`">`$+</tr>"
			$GroupBody = $GroupBody -replace "<tr>(.*)<td>Odd</td></tr>","<tr class=`"odd`">`$+</tr>"
			$GroupBody = $GroupBody -replace "<tr>(.*)<td>Even</td></tr>","<tr class=`"even`">`$+</tr>"
			$GroupBody = $GroupBody -replace "<tr>(.*)<td>None</td></tr>","<tr>`$+</tr>"
			$Report += $GroupBody
		}

	}
	$Report = $Report -replace 'URL01NEW', '<a target="_blank" href="'
	$Report = $Report -replace 'URL01', '<a href="'
	$Report = $Report -replace 'URL02', '">'
	$Report = $Report -replace 'URL03', '</a>'

	if ($Report -like "*<tr>*" -and $report -like "*odd*" -and $report -like "*even*") {
			$Report = $Report -replace "<tr>",'<tr class="header">'
	}

	if ($ColumnTotals.count -gt 0 -or $ColumnAverages.count -gt 0 -or $ColumnCounts.count -gt 0 ) {
		$Report = $Report -replace "</table>",""
		$TableFooter = $ArrayOfObjects | ConvertTo-Html -Fragment
		$TableFooter = $TableFooter -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', "" -replace '<table>', "" -replace '</table>', "" -replace "<td>.+?</td>" -replace "<tr></tr>", ""
		$TableFooter = $TableFooter -replace '<th>RowColor</th>', ''
		#$ColumnTotal
		foreach ($ColumnTotal in $ColumnTotals)
		{
			$TableFooter = $TableFooter -replace $ColumnTotal,("sum:" + ($arrayofobjects | measure $ColumnTotal -Sum ).sum)
		}
		#ColumnAverage
		foreach ($ColumnAverage in $ColumnAverages)
		{
			$TableFooter = $TableFooter -replace $ColumnAverage,("avg:" +($arrayofobjects | measure $ColumnAverage -Average ).average)
		}
		#ColumnCount
		foreach ($ColumnCount in $ColumnCounts)
		{
			$TableFooter = $TableFooter -replace $ColumnCount,("count:"+ ($arrayofobjects | measure $ColumnCount).count)
		}
		#Cleanup
		foreach ($Column in ($ArrayOfObjects | Get-Member ))
		{
			$TableFooter = $TableFooter -replace ("<th>" + $Column.Name + "</th>"), '<td></td>'
		}

		$TableFooter = $TableFooter -replace '<th>', '<td class="totalrow">' -replace "</th>", '</td>'
		$TableFooter = $TableFooter -replace '<tr>', '<tr class="totalrow">'
		$Report += "<tfoot>"
		$Report += $TableFooter
		$Report += "</tfoot>"
	}


	$Report += "</table>"


	return $Report
}

Function Get-HTMLContentTableAdvanced
{
<#
		.SYNOPSIS
			Code borrowed from https://www.powershellgallery.com/packages/EnhancedHTML2


#>
	param(
		[Parameter(Mandatory=$True,ValueFromPipeline=$True)]
		[Array]$ArrayOfObjects
	)

			$out = ''
			$out += "<table>"

	      foreach ($object in $ArrayOfObjects) {
            $datarow = ''
            $headerrow = ''

            $properties = $object | Get-Member -MemberType Properties | Select -ExpandProperty Name

			foreach ($prop in $properties) {
			#$prop = $properties[0]
                $name = $null
                $value = $null

                if ($prop -is [string]) {
                    $name = $Prop
                    $value = $object.($prop)
                } else {
                    Write-Warning "Unhandled property $prop"
                }

               $headerrow += "<th>$name</th>"
               $datarow += "<td>$value</td>"
			}

			if (-not $wrote_first_line ) {
                $out += "<tr>$headerrow</tr><tbody>"
                $wrote_first_line = $true
            }
                $out += "<tr>$datarow</tr>"
        	}

	  $out += "</table>"


   return $out
}

Function Get-HTMLContentDataTable
{
<#
	.SYNOPSIS
		Creates an HTML 5 Data table from an array of objects
	    .PARAMETER ArrayOfObjects
			An array of objects
		.PARAMETER Paging
		.PARAMETER PagingOptions
		.PARAMETER Ordering
		.PARAMETER Info
		.PARAMETER HideFooter

#>
param
(
	[Parameter(Mandatory=$True,ValueFromPipeline=$True)]
	[Array]$ArrayOfObjects,
	[Parameter(Mandatory=$false,ValueFromPipeline=$false)]
	[switch]$DisablePaging,
	[Parameter(Mandatory=$false,ValueFromPipeline=$false)]
	[string]$PagingOptions = '15,25, 50, 100,',
	[Parameter(Mandatory=$false,ValueFromPipeline=$false)]
	[switch]$DisableOrdering,
    [Parameter(Mandatory=$false,ValueFromPipeline=$false)]
	[switch]$DisableInfo,
	[Parameter(Mandatory=$false,ValueFromPipeline=$false)]
	[switch]$HideFooter

)
	if ($DisablePaging -eq $true)	{$Paging = 'false'} 	else {$Paging = 'true'}
	if ($DisableOrdering -eq $true) {$Ordering = 'false'} 	else {$Ordering = 'true'}
	if ($DisableInfo -eq $true) 	{$Info = 'false'} 		else {$Info = 'true'}

	$DTInstance = (-join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})).tolower()

	$TableHeader = @'
<script>
 $(document).ready(function() {
     $('#
'@

	$TableHeader += $DTInstance
	$TableHeader += @"
').DataTable({
		"paging":   $($Paging),
		"pagingType": "full_numbers",
		"lengthMenu": [[$PagingOptions -1], [$PagingOptions "All"]],
        "ordering": $($Ordering),
        "info":     $($Info),
         "columns": [
"@

	$ArraryHeader = $ArrayOfObjects | ConvertTo-Html -Fragment
	$HeadersText =  ($ArraryHeader[2] -replace '<tr>',''  -replace '<th>','' -replace '</tr>','')
	$ColumnHeaders = ($HeadersText.substring(0,$HeadersText.Length-5))  -split '</th>'

	foreach ($ColumnHeader in $ColumnHeaders )
	{
	   $TableHeader += '{ "data": "' + $ColumnHeader + '" },'
	}
	$TableHeader += @'
]
     });
 } );
</script>
'@
	$TableHeader = $TableHeader.Replace(',]',']')

	$NumberOfColumns = ($ArrayOfObjects | Get-Member -MemberType NoteProperty  | Select-Object Name).Count

	$Report = $ArrayOfObjects | ConvertTo-Html -Fragment
	$Report = $Report -replace '<col/>', "" -replace '<colgroup>', "" -replace '</colgroup>', ""
	$Report = $Report -replace '<table>', ('<table id="' + $DTInstance + '" class="display compact"><thead>')
	$Report = $Report -replace '</th></tr>','</th></tr></thead><tbody>'
	$Report = $Report -replace "</table>","LoadFooterHere</tbody>"
	if ($HideFooter -eq $true)
	{
		$Report = $Report -replace "LoadFooterHere",""
	}
	else
	{
		$Footer = '<tfoot><tr>'
		foreach ($Header in $ColumnHeaders){
			$Footer += '<th>' + $Header + '</th>'
		}
		$Footer += '</tr></tfoot>'
		$Report = $Report -replace "LoadFooterHere",$Footer
	}

	$Report = $Report -replace 'URL01NEW', '<a target="_blank" href="'
	$Report = $Report -replace 'URL01', '<a href="'
	$Report = $Report -replace 'URL02', '">'
	$Report = $Report -replace 'URL03', '</a>'

	$Report += "</table>"
	return ($TableHeader + $Report)
}

Function Get-HTMLContentText
{
<#
	.SYNOPSIS
		Creates an HTML entry with heading and detail
	    .PARAMETER Heading
			The type of logo
		.PARAMETER Detail
		     Some additional pish
#>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$false)]
	    [String]
        $Heading,
	    [Parameter(Mandatory=$false)]
        [String]
        $Detail
    )

    $Report = @"
<table><tbody>
	<tr>
	<th class="content">$Heading</th>
	<td class="content">$($Detail)</td>
	</tr>
</tbody></table>
"@
    $Report = $Report -replace 'URL01NEW', '<a target="_blank" href="'
	$Report = $Report -replace 'URL01', '<a href="'
    $Report = $Report -replace 'URL02', '">'
    $Report = $Report -replace 'URL03', '</a>'
    Return $Report
}

Function Set-TableRowColor
{
<#
	.SYNOPSIS
		adds a row colour field to the array of object for processing with htmltable
	    .PARAMETER ArrayOfObjects
			The type of logo
		.PARAMETER Green
		     Some additional pish
		.PARAMETER Yellow
		     Some additional pish
		.PARAMETER Red
		    use $this and an expression to measure the value
		.PARAMETER Alertnating
			a switch the will define Odd and Even Rows in the rowcolor column
#>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$false)]
	    [Object[]]$ArrayOfObjects,
	    [Parameter(Mandatory=$false)]
        [string]$Green = '$this -eq $false',
	    [Parameter(Mandatory=$false)]
        [string]$Yellow = '$this -eq $false',
	    [Parameter(Mandatory=$false)]
        [string]$Red = '$this -eq $false',
	    [Parameter(Mandatory=$false)]
        [switch]$Alternating
    )
	if ($Alternating) {
		$ColoredArray = $ArrayOfObjects | Add-Member -MemberType ScriptProperty -Name RowColor -Value {
		if ((([array]::indexOf($ArrayOfObjects,$this)) % 2) -eq 0) {'Odd'}
		if ((([array]::indexOf($ArrayOfObjects,$this)) % 2) -eq 1) {'Even'}
		} -PassThru -Force | Select-Object *
	} else {
		$ColoredArray = $ArrayOfObjects | Add-Member -MemberType ScriptProperty -Name RowColor -Value {
			if (Invoke-Expression $Green) {'Green'}
			elseif (Invoke-Expression $Red) {'Red'}
			elseif (Invoke-Expression $Yellow) {'Yellow'}
			else {'None'}
			} -PassThru -Force | Select-Object *
	}

	return $ColoredArray
}

Function Get-HTMLColumn1of2
{
<#
	.SYNOPSIS
		adds a row colour field to the array of object for processing with htmltable
	    .PARAMETER PieChartObject
			This is a custom object with Pie chart properties, Create-HTMLPieChartObject
		.PARAMETER PieChartData
			Required an array with the headings Name and Count.  Using Powershell Group-object on an array

#>
    [CmdletBinding()]
    param()
	$report = '<div class="first column">'
	return $report
}

Function Get-HTMLColumn2of2
{
<#
	.SYNOPSIS
		adds a row colour field to the array of object for processing with htmltable
	    .PARAMETER PieChartObject
			This is a custom object with Pie chart properties, Create-HTMLPieChartObject
		.PARAMETER PieChartData
			Required an array with the headings Name and Count.  Using Powershell Group-object on an array

#>
    [CmdletBinding()]
    param()
	$report = '<div class="second column">'
	return $report
}

Function Get-HTMLColumnClose
{
<#
	.SYNOPSIS
		Closing Div Tag
#>
    [CmdletBinding()]
    param()
	$report = '</div>'
	return $report
}

Function Get-HTMLColumnOpen
{
<#
	.SYNOPSIS
		Dynamic Column Creation
	    .PARAMETER NumberOf
			This is a current column number
		.PARAMETER ColumnTotal
			Total Number of columns

#>
    [CmdletBinding()]
    param
	(
		[Parameter(Mandatory=$true)]
		[int]$ColumnNumber,
		[Parameter(Mandatory=$true)]
		[int]$ColumnCount
	)

	$ColumnItem = [string]$ColumnNumber + "of" + [string]$ColumnCount
	Write-Verbose $ColumnItem
	$ColumnItem = $ColumnItem.replace('1','one').replace('2','two').replace('3','three').replace('4','four').replace('5','five').replace('6','six')
	Write-Verbose $ColumnItem
	$report = '<div class="' + $ColumnItem + ' column">'
	return $report
}

Function Get-HTMLAnchorLink
{
<#
	.SYNOPSIS
		creates Hyperlink for an Anchor
		.PARAMETER AnchorName
			The Actual name of the Anchor (Hidden)
		.PARAMETER AnchorText
			The HyperLink text.  Will default to $AnchorNname if not specified
#>
    [CmdletBinding()]
	Param
    (
		[Parameter(Mandatory=$false)]
        [String]
        $AnchorName,
		[Parameter(Mandatory=$true)]
        [String]
        $AnchorText
	)
	if ($AnchorText -eq $null -or $AnchorText -eq '') {$AnchorText=$AnchorName}
	$report = '<a class="alink" href="#' + $AnchorName + '">' +  $AnchorText +'</a>'

	Write-Output $report
}

Function Get-HTMLAnchor
{
<#
	.SYNOPSIS
		creates an Anchor
		.PARAMETER AnchorName
			The Actual Anchor
#>
    [CmdletBinding()]
    Param
    (
	    [Parameter(Mandatory=$true)]
        [String]
        $AnchorName
    )

	$Anchor = '<a name="' + $AnchorName + '"></a>'
	Write-Output $Anchor
}

Function Get-HTMLTabHeader
{
	[CmdletBinding()]
	Param
	(
		[Parameter(Mandatory=$true)]
        [Array]
        $TabNames
	)

	$TabHeader = @()
	$TabHeader += '<ul class="tab">'
	$FirstTab = $true
  	Foreach ($TabName in $TabNames) {
		if ($FirstTab)
		{
			$TabHeader += '		<li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, ''' + $TabName + ''')" id="defaultOpen">' + $TabName + '</a></li>'
			$FirstTab = $false
		}
		else
		{
			$TabHeader += '		<li><a href="javascript:void(0)" class="tablinks" onclick="openTab(event, ''' + $TabName + ''')">' + $TabName + '</a></li>'
		}

  	}
	$TabHeader += '</ul>'
	Set-Variable -Scope global -Name TabHeaderCreated -Value $true
	Write-output $TabHeader
}

Function Get-HTMLTabContentOpen
{
	[CmdletBinding()]
	Param
	(
		[Parameter(Mandatory=$true)]
        [String]
        $TabName,
		[Parameter(Mandatory=$true)]
        [String]
        $TabHeading
	)
	$TabContent  = @()
	$TabContent  += '<div id="' + $TabName +'" class="tabcontent">'

		$TabContent  += "<h7>$TabHeading</h7>"
 	write-output $TabContent
}

Function Get-HTMLTabContentClose
{
	$tabclose = @()
	$tabclose += "</p>"
	$tabclose += '</div>'
	$tabclose += @"
<script>
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
"@
	write-output $tabclose
}

Function Get-HTMLCodeBlock
{
	[CmdletBinding()]
	Param
	(
		[Parameter(Mandatory=$true)]
        [String]
        $Code,
		[Parameter(Mandatory=$false)]
        [String]
        $Style = 'PowerShell'
	)
	$CodeBlock = @()
	switch ($Style) {
		'PowerShell'
		{
			$CodeBlock += '<pre class="PowerShell">'
		}
		'othercodestyleneedsACSSStyle'
		{
			$CodeBlock += '<pre class="PowerShell">'
		}
		default
		{
			$CodeBlock += '<pre>'
		}
	}

	$CodeBlock  += $Code
	$CodeBlock  += '</pre>'
	[string]$CodeBlock = $CodeBlock
	Write-Output $CodeBlock
}

function Get-HTMLSpan
{
	Param (
		$block,
		$tokenColor
	)
#
# Original Author: Lee Holmes, http://www.leeholmes.com/blog/MorePowerShellSyntaxHighlighting.aspx
#
# Modified by: Helge Klein, http://blogs.sepago.de/helge/
#

	if (($tokenColor -eq 'NewLine') -or ($tokenColor -eq 'LineContinuation'))
	{
		if($tokenColor -eq 'LineContinuation')
		{
			$null = $codeBuilder.Append('`')
		}

		$null = $codeBuilder.Append("<br />`r`n")
	}
	else
	{
		$block = [System.Web.HttpUtility]::HtmlEncode($block)
		if (-not $block.Trim())
		{
			$block = $block.Replace(' ', '&nbsp;')
		}

		$htmlColor = $tokenColours[$tokenColor].ToString().Replace('#FF', '#')

		if($tokenColor -eq 'String')
		{
			$lines = $block -split "`r`n"
			$block = ""

			$multipleLines = $false
			foreach($line in $lines)
			{
				if($multipleLines)
				{
					$block += "<BR />`r`n"
				}

				$newText = $line.TrimStart()
				$newText = "&nbsp;" * ($line.Length - $newText.Length) + $newText
				$block += $newText
				$multipleLines = $true
			}
		}

		$null = $codeBuilder.Append("<span style='color:$htmlColor'>$block</span>")
	}
}

Function Get-HTMLPowerShellSyntax
{
	[CmdletBinding()]
	Param (
		$PowerShellFilePath
	)
#
# Original Author: Lee Holmes, http://www.leeholmes.com/blog/MorePowerShellSyntaxHighlighting.aspx
#
# Modified by: Helge Klein, http://blogs.sepago.de/helge/
#

#
# Syntax highlights a PowerShell script.
#
# Usage: Supply the script to syntax hightligh as first and only parameter
#
# Output: Copy of original script with extension ".html"
#
# Example: .\Highlight-Syntax.ps1 .\Get-AppVPackageDependencies.ps1
#
# Version history:
#
# 1.1:
#
#		- Loading the required assembly System.Web now. This was missing earlier.
#
# 1.0: Initial version
#


$path = $PowerShellFilePath

# Load required assemblies
[void] [System.Reflection.Assembly]::Load("System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a")

$tokenColours = @{
    'Attribute' = '#FFADD8E6'
    'Command' = '#FF0000FF'
    'CommandArgument' = '#FF8A2BE2'
    'CommandParameter' = '#FF000080'
    'Comment' = '#FF006400'
    'GroupEnd' = '#FF000000'
    'GroupStart' = '#FF000000'
    'Keyword' = '#FF00008B'
    'LineContinuation' = '#FF000000'
    'LoopLabel' = '#FF00008B'
    'Member' = '#FF000000'
    'NewLine' = '#FF000000'
    'Number' = '#FF800080'
    'Operator' = '#FFA9A9A9'
    'Position' = '#FF000000'
    'StatementSeparator' = '#FF000000'
    'String' = '#FF8B0000'
    'Type' = '#FF008080'
    'Unknown' = '#FF000000'
    'Variable' = '#FFFF4500'
}

# Generate an HTML span and append it to HTML string builder
$currentLine = 1

	$text = $null

	if($path)
	{
		$text = (Get-Content $path) -join "`r`n"
	}
	else
	{
		Write-Error 'Please supply the path to the PowerShell script to syntax highlight as first (and only) parameter.'
		return
	}

	trap { break }

	# Do syntax parsing.
	$errors = $null
	$tokens = [system.management.automation.psparser]::Tokenize($Text, [ref] $errors)

	# Initialize HTML builder.
	$codeBuilder = new-object system.text.stringbuilder

	# Iterate over the tokens and set the colors appropriately.
	$position = 0
	foreach ($token in $tokens)
	{
		if ($position -lt $token.Start)
		{
			$block = $text.Substring($position, ($token.Start - $position))
			$tokenColor = 'Unknown'
			Get-HtmlSpan $block $tokenColor
		}

		$block = $text.Substring($token.Start, $token.Length)
		$tokenColor = $token.Type.ToString()
		Get-HtmlSpan $block $tokenColor

		$position = $token.Start + $token.Length
	}

	# Build the entire syntax-highlighted script
	$code = $codeBuilder.ToString()

	# Replace tabs with three blanks
	$code	= $code -replace "\t","   "

	if ($WriteToPath)
	{
		# Write the HTML to a file
		$code | set-content -path "$path.html"
	}
	else
	{
		write-output $code
	}
}

Function Get-HTMLHeading
{
	Param
	(
		[string]$headingText,
		[int]$headerSize
	)

	$headerString = "<h$headerSize>$headingText</h$headerSize>"
	return $headerString
}

#endregion

#Region Chart JS Functions

Function Get-HTMLBarChartObject
{
<#
	.SYNOPSIS
		create a Bar chart object for use with Get-HTMLBarChart
#>
    [CmdletBinding()]
    param(
		[Parameter(Mandatory=$false)]
		$ColorScheme
	)


	$ChartSize = New-Object PSObject -Property @{`
		Width = 500
		Height = 400
	}

	$DataDefinition = New-Object PSObject -Property @{`
		DataSetName = "Data"
		AxisXTitle = ""
		AxisYTitle = ""
		DataNameColumnName = "name"
		DataValueColumnName = "count"

	}

	if ($ColorScheme -eq "Generated") {$thisColorScheme = 'Generated' + [string](Get-Random -Minimum 1 -Maximum 8)}
	elseif ($ColorScheme -eq "Random") {$thisColorScheme = 'Random' }
	else {$thisColorScheme = 'ColorScheme1'}

	$ChartStyle = New-Object PSObject -Property @{`
		ChartType = "bar"
		ColorSchemeName = "$thisColorScheme"
		Showlabels= $true
		borderWidth = "1"
		responsive = 'false'
		legendPosition = 'bottom'

	}

	$ChartObject = New-Object PSObject -Property @{`
		ObjectName = -join ((65..90) + (97..122) | Get-Random -Count 12 | ForEach-Object {[char]$_})
		Title = ""
		Size = $ChartSize
		DataDefinition = $DataDefinition
		ChartStyle = $ChartStyle
	}

	return $ChartObject
}

Function Get-HTMLBarChart
{
<#
	.SYNOPSIS

#>
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory=$true)]
		$ChartObject,
		[Parameter(Mandatory=$true)]
		[Array]
		$DataSet,
		[Parameter(Mandatory=$false)]
        $Options
	)

	$DataCount = $DataSet.Count
	Write-Verbose "Data Set counnt is $DataCount"
	if ($ChartObject.ChartStyle.ColorSchemeName -ne 'Random')
	{
		if ($Options -eq $null) {
			#Write-Verbose "Default Colour Schemes selected, selecting $($ChartObject.ChartStyle.ColorSchemeName)"
			#$ColorSchemes =	Get-HTMLColorSchemes
			$ChartColorScheme = $GlobalColorSchemes.($ChartObject.ChartStyle.ColorSchemeName) | select -First $DataCount
		} else {
			Write-Verbose "Options Colour Schemes selected, selecting $($ChartObject.ChartStyle.ColorSchemeName)"
			$ChartColorScheme = $Options.ColorSchemes.($ChartObject.ChartStyle.ColorSchemeName) | select -First $DataCount
		}
		if ($ChartColorScheme.Count -lt $DataCount) {
			Write-Warning ("Colorscheme " +  $ChartObject.ChartStyle.ColorSchemeName + " only has " + $ChartColorScheme.Count + " schemes, you have $DataCount Records. Generating one for you" )
			$ChartColorScheme = GenerateRandomColorScheme -numberofschemes $DataCount
		}
	}
	else
	{
		$ChartColorScheme = GenerateRandomColorScheme -numberofschemes $DataCount
	}

	$ofs = ','
	$CJSHeader  = @()
	$CJSHeader += '<canvas id="' + $ChartObject.ObjectName + '" width="'+ $ChartObject.Size.Width + '" height="' + $ChartObject.Size.Height +'"></canvas>'
	$CJSHeader += '<script>'
	$CJSHeader += 'var ctx = document.getElementById("' + $ChartObject.ObjectName + '");'
	$CJSHeader += 'var ' + $ChartObject.ObjectName + ' = new Chart(ctx, {'
	$CJSHeader += "	type: '$($ChartObject.ChartStyle.ChartType)',"


	$CJSData = @()
	$CJSData = "	data:	{"+ "`n"
	if ($ChartObject.ChartStyle.Showlabels) {
		$ofs ='","'
		$CJSData += '		labels: ["' +"$($DataSet.($ChartObject.DataDefinition.DataNameColumnName))" + '"],' + "`n"
	}

	$CJSData += "		datasets: [{" + "`n"
	$CJSData += "			label: '$($chartobject.DataDefinition.datasetname)'," + "`n"
	$ofs =","
	$CJSData += "			data: [" + "$($DataSet | % {$_.($ChartObject.DataDefinition.DataValueColumnName)})" +"]," + "`n"
	$ofs ="','"
	$CJSData += "			backgroundColor: ['" + "$($ChartColorScheme.Background)" + "']," + "`n"
	$CJSData += "			borderColor:  ['" + "$($ChartColorScheme.border)" + "']," + "`n"
	$CJSData += "			hoverBackgroundColor:  ['" + "$($ChartColorScheme.border)" + "']," + "`n"
	$CJSData += "			borderWidth: $($ChartObject.ChartStyle.borderWidth)" + "`n"
	$CJSData += "		}]"+ "`n"
	$CJSData += "	},"
	$ofs =""

	$CJSOptions = @()
	$cjsOptions += '	options: {'
	#responsive
	$cjsOptions += "		responsive: $($ChartObject.ChartStyle.responsive),"
	#legend
	$cjsOptions += "		legend: {
                position: '$($ChartObject.ChartStyle.legendposition)',
            },"
	#title
	if ($ChartObject.Title -ne '') {
		$cjsOptions += "		title: {
				display: true,
				text: '$($ChartObject.Title)'
			},"
	}
	#scale & Labels
	$XAxisLabel = $ChartObject.DataDefinition.AxisXTitle
	if ([string]::IsNullOrEmpty($XAxisLabel))
	{
		$displayXAxisLabel = 'false'
	}
	else
	{
		$displayXAxisLabel = 'true'
	}

	$YAxisLabel = $ChartObject.DataDefinition.AxisYTitle
	if ([string]::IsNullOrEmpty($YAxisLabel))
	{
		$displayYAxisLabel = 'false'
	}
	else
	{
		$displayYAxisLabel = 'true'
	}

	$CJSOptions += "scales: {
                        xAxes: [{
                            display: $displayXAxisLabel,
                            scaleLabel: {
                                display: $displayXAxisLabel,
                                labelString: '$XAxisLabel'
                            }
                        }],
                        yAxes: [{
                            display: $displayYAxisLabel,
                            scaleLabel: {
                                display: $displayYAxisLabel,
                                labelString: '$YAxisLabel'
                            },
							ticks: {
								beginAtZero:true
							}
                        }]
                    },

	"

	$cjsOptions += "	}" +"`n"
	$CJSOptions += "});	"

	$CJSFooter = " </script>"



	$CJS  = @()
	$CJS += $CJSHeader
	$CJS += $CJSData
	$CJS += $CJSOptions
	$CJS += $CJSFooter

	write-output $CJS
}

Function Get-HTMLPieChartObject
{
<#
	.SYNOPSIS
		create a Bar chart object for use with Get-HTMLBarChart
#>
    [CmdletBinding()]
    param(
		[ValidateSet("pie","doughnut")]
		[String]
		$ChartType = 'pie',
		[Parameter(Mandatory=$false)]
		$ColorScheme
	)

	$ChartSize = New-Object PSObject -Property @{`
		Width = 500
		Height = 400
	}

	$DataDefinition = New-Object PSObject -Property @{`
		DataSetName = "Data"
		DataNameColumnName = "name"
		DataValueColumnName = "count"
	}

	if ($ColorScheme -eq "Generated") {$thisColorScheme = 'Generated' + [string](Get-Random -Minimum 1 -Maximum 8)}
	elseif ($ColorScheme -eq "Random") {$thisColorScheme = 'Random' }
	else {$thisColorScheme = 'ColorScheme2'}

	$ChartStyle = New-Object PSObject -Property @{`
		ChartType = $ChartType
		ColorSchemeName = "$thisColorScheme"
		Showlabels= $true
		borderWidth = "1"
		responsive = 'false'
		animateScale = 'true'
        animateRotate = 'true'
		legendPosition = 'bottom'
	}

	$ChartObject = New-Object PSObject -Property @{`
		ObjectName = -join ((65..90) + (97..122) | Get-Random -Count 12 | ForEach-Object {[char]$_})
		Title = ""
		Size = $ChartSize
		DataDefinition = $DataDefinition
		ChartStyle = $ChartStyle
	}

	return $ChartObject
}

Function Get-HTMLPieChart
{
<#
	.SYNOPSIS

#>
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory=$true)]
		$ChartObject,
		[Parameter(Mandatory=$true)]
		[Array]
		$DataSet,
		[Parameter(Mandatory=$false)]
        $Options
	)

	$DataCount = $DataSet.Count
	Write-Verbose "Data Set counnt is $DataCount"

	if ($ChartObject.ChartStyle.ColorSchemeName -ne 'Random')
	{
		if ($Options -eq $null) {
			#Write-Verbose "Default Colour Schemes selected, selecting $($ChartObject.ChartStyle.ColorSchemeName)"
			#$ColorSchemes =	Get-HTMLColorSchemes
			$ChartColorScheme = $GlobalColorSchemes.($ChartObject.ChartStyle.ColorSchemeName) | select -First $DataCount
		} else {
			Write-Verbose "Options Colour Schemes selected, selecting $($ChartObject.ChartStyle.ColorSchemeName)"
			$ChartColorScheme = $Options.ColorSchemes.($ChartObject.ChartStyle.ColorSchemeName) | select -First $DataCount
		}
		if ($ChartColorScheme.Count -lt $DataCount) {
			Write-Warning ("Colorscheme " +  $ChartObject.ChartStyle.ColorSchemeName + " only has " + $ChartColorScheme.Count + " schemes, you have $DataCount Records. Generating one for you" )
			$ChartColorScheme = GenerateRandomColorScheme -numberofschemes $DataCount
		}
	}
	else
	{
		$ChartColorScheme = GenerateRandomColorScheme -numberofschemes $DataCount
	}

	$ofs = ','
	$CJSHeader  = @()
	$CJSHeader += '<canvas id="' + $ChartObject.ObjectName + '" width="'+ $ChartObject.Size.Width + '" height="' + $ChartObject.Size.Height +'"></canvas>'
	$CJSHeader += '<script>'
	$CJSHeader += 'var ctx = document.getElementById("' + $ChartObject.ObjectName + '");'
	$CJSHeader += 'var ' + $ChartObject.ObjectName + ' = new Chart(ctx, {'
	$CJSHeader += "	type: '$($ChartObject.ChartStyle.ChartType)',"


	$CJSData = @()
	$CJSData = "	data:	{"+ "`n"
	if ($ChartObject.ChartStyle.Showlabels) {
		$ofs ='","'
		$CJSData += '		labels: ["' +"$($DataSet.($ChartObject.DataDefinition.DataNameColumnName))" + '"],' + "`n"
	}

	$CJSData += "		datasets: [{" + "`n"
	$CJSData += "			label: '$($chartobject.DataDefinition.datasetname)'," + "`n"
	$ofs =","
	$CJSData += "			data: [" + "$($DataSet | % {$_.($ChartObject.DataDefinition.DataValueColumnName)})" +"]," + "`n"
	$ofs ="','"
	$CJSData += "			backgroundColor: ['" + "$($ChartColorScheme.Background)" + "']," + "`n"
	$CJSData += "			hoverBackgroundColor:  ['" + "$($ChartColorScheme.border)" + "']," + "`n"
	$CJSData += "			borderWidth: $($ChartObject.ChartStyle.borderWidth)" + "`n"
	$CJSData += "		}]"+ "`n"
	$CJSData += "	},"
	$ofs =""


	$CJSOptions = @()
	$cjsOptions += '	options: {'
	#responsive
	$cjsOptions += "		responsive: $($ChartObject.ChartStyle.responsive),"
	#legend
	$cjsOptions += "		legend: {
                position: '$($ChartObject.ChartStyle.legendposition)',
            },"
	#Title
	if ($ChartObject.Title -ne '') {
		$cjsOptions += "		title: {
				display: true,
				text: '$($ChartObject.Title)'
			},"
	}
	$cjsOptions += "	},"
	#animation
	$cjsOptions += "	animation: {
                animateScale: $($ChartObject.ChartStyle.animateScale),
                animateRotate: $($ChartObject.ChartStyle.animateRotate)
            }"
	$CJSOptions += "});	"



	$CJSFooter = " </script>"



	$CJS  = @()
	$CJS += $CJSHeader
	$CJS += $CJSData
	$CJS += $CJSOptions
	$CJS += $CJSFooter

	write-output $CJS
}



#Endregion

#Region Output Functions

Function Save-HTMLReport
{
<#
	.SYNOPSIS
		generation of  report and invokes the file to open
	.PARAMETER ReportName
		with generate a random file name if noone is specified
	.PARAMETER ReportPath
		specifiy test directory, will use %TEMP% by default
	.PARAMETER ReportContent
		This should be the complete HTML code
#>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$false)]
	    [string]$ReportName,
	    [Parameter(Mandatory=$false)]
        [string]$ReportPath,
	    [Parameter(Mandatory=$true)]
        [Array]$ReportContent,
        [Parameter(Mandatory=$false)]
	    [switch]$ShowReport
    )

	if ([string]::IsNullOrEmpty($ReportPath))
	{
		Write-Warning "ReportPath parameter $ReportPath is empty,using Temp"
		$ReportPath = $env:temp
	}
	else {
		if ((Test-Path $ReportPath) -eq $false )
		{
			Write-Warning "ReportPath parameter $ReportPath is not valid or can't be accessed,using Temp"
			$ReportPath = $env:temp
		}
	}


	$ReportName = $ReportName.replace('.html','')
	if ($ReportName -eq $null -or $ReportName -eq ""){
        $ReportName = -join ((65..90) + (97..122) | Get-Random -Count 12 | ForEach-Object {[char]$_})
	}
	$rptFile = join-path $ReportPath ($ReportName.replace(" ","") + ".html")
    Write-Verbose "Generating Report File at $rptFile"


    $ReportContent | Set-Content -Path $rptFile -Force
	Write-Verbose $rptFile
    if ($ShowReport) {
		Start-Sleep -Seconds 1
		Invoke-Item $rptFile
	}
	Write-Output $rptFile
}

Function Save-HTMLToBlobStorage
{
<#
	.SYNOPSIS
		generation of  report and invokes the file to open
#>
	 [CmdletBinding()]
	 Param
	 (
		[Parameter(Mandatory=$true)]
		[Array]
		$ReportContent,
		[Parameter(Mandatory=$true)]
		[string]
		$resourceGroupName = "",
		[Parameter(Mandatory=$true)]
		[string]
		$storageAccountName = "",
		[Parameter(Mandatory=$true)]
		[string]
		$storageContainerName = "",
		[Parameter(Mandatory=$false)]
		[string]
		$ReportPrefix = "HTMLReport"
	)

	$localFileName ="{0}\report.html" -f $env:TEMP
	$ReportContent | Set-Content -Path $localFileName
	$blobFileName = $ReportPrefix + "-{0}" -f [guid]::NewGuid() + ".html"

	Write-Output ("Saving the report to storage")
	Write-Output ("Resource Group: {0}" -f $resourceGroupName)
	Write-Output ("Storage Account: {0}" -f $storageAccountName)
	Write-Output ("Storage Container: {0}" -f $storageContainerName)
	Write-Output ("Blob: {0}" -f $blobFileName)

	Set-AzureRmCurrentStorageAccount   -ResourceGroupName $resourceGroupName  -Name $storageAccountName | Out-Null

	$storageAccount = Get-AzureRmStorageAccount `
	    -ResourceGroupName $resourceGroupName `
	    -Name $storageAccountName

	$storageAccountContainer = Get-AzureStorageContainer `
	    -Name $storageContainerName

	$blob = Set-AzureStorageBlobContent `
	    -Container $storageContainerName `
	    -Blob $blobFileName `
	    -File $localFileName

	Write-Output ("Click the link below to view the report")
	$url = "https://{0}.blob.core.windows.net/{1}/{2}" -f $storageAccountName, $storageContainerName, $blob.Name
	$hash = @{
	    type = "hyperlink";
	    name = "Report: {0}" -f $blob.Name;
	    value = $url
	}
	Write-Output($hash)
}

function Send-HTMLReport
{
	<#
	.SYNOPSIS
		rudimentary send report via email function.  Suggest finding more comprehensive function it must already exist :)
	.PARAMETER To
	.PARAMETER From
	.PARAMETER SMTPServer
	.PARAMETER SMTPPort
#>
	[CmdletBinding()]
	Param (
		[string]$ReportName,
		[string]$To,
		[string]$From,
		[string]$SMTPServer = "smtp.gmail.com",
		[string]$SMTPPort = "587",
		[string]$Body = 'HTML Report Attached',
		$Rptfile,
		[System.Management.Automation.PSCredential]
		$Credentials,
		[hashtable]
		$StoredReport
	)

	Write-Warning "...this is in development, mainly as a placeholder.  Expect Breaking changes."
	sleep 3
	Send-MailMessage -From $From -to $To -Subject $ReportName `
		-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential $Credentials -Attachments $Rptfile

}

#Endregion

#region Alias's
New-Alias -name Get-HTMLPageClose -value Get-HTMLClosePage -Force
New-Alias -name Get-HTMLPageOpen -value Get-HTMLOpenPage -force
#endregion
