function New-HTMLMap {
    [cmdletBinding()]
    param(
        [parameter(Mandatory)][ValidateSet('poland', 'usa_states', 'world_countries')][string] $Map,
        [string] $AnchorName
    )
    Enable-HTMLFeature -Feature Raphael, Mapael, Jquery, JQueryMouseWheel, "MapaelMaps_$Map" -Configuration $Script:Configuration.Features
    if (-not $AnchorName) {
        $AnchorName = "MapContainer$(Get-RandomStringName -Size 8)"
    }
    $Options = @{
        map = @{
            name = $Map.ToLower()
        }
    }
    $OptionsJSON = $Options | ConvertTo-JsonLiteral -Depth 2 -AdvancedReplace @{ '.' = '\.'; '$' = '\$' }

    New-HTMLTag -Tag 'script' {
        "`$(function () { `$(`".$AnchorName`").mapael($OptionsJSON); });"
    }

    New-HTMLTag -Tag 'div' -Attributes @{ class = $AnchorName } {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'map' } {
            $AlternateHTML
        }
    }
}