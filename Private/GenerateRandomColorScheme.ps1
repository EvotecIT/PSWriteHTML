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