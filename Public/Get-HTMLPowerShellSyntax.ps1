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