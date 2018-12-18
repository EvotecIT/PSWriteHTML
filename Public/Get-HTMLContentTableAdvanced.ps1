Function Get-HTMLContentTableAdvanced {
    <#
		.SYNOPSIS
			Code borrowed from https://www.powershellgallery.com/packages/EnhancedHTML2


#>
    param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True)]
        [Array]$ArrayOfObjects
    )

    $out = ''
    $out += "<table>"

    foreach ($object in $ArrayOfObjects) {
        $datarow = ''
        $headerrow = ''

        $properties = $object | Get-Member -MemberType Properties | Select-Object -ExpandProperty Name

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