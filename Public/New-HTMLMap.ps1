function New-HTMLMap {
    <#
    .SYNOPSIS
    Creates a new HTML map with specified settings.

    .DESCRIPTION
    This function creates a new HTML map with customizable settings such as map type, legend options, colors, and titles.

    .PARAMETER MapSettings
    A script block containing custom map settings to be applied.

    .PARAMETER Map
    Specifies the type of map to be displayed. Valid values are 'Poland', 'Usa_States', 'World_Countries', or 'European_Union'.

    .PARAMETER AnchorName
    Specifies the name of the HTML anchor element where the map will be rendered.

    .PARAMETER ShowAreaLegend
    Switch parameter to indicate whether to display the area legend on the map.

    .PARAMETER AreaTitle
    Specifies the title for the area legend.

    .PARAMETER PlotTitle
    Specifies the title for the plot legend.

    .PARAMETER ShowPlotLegend
    Switch parameter to indicate whether to display the plot legend on the map.

    .PARAMETER FillColor
    Specifies the color to fill the map areas.

    .PARAMETER StrokeColor
    Specifies the color of the map area borders.

    .PARAMETER StrokeWidth
    Specifies the width of the map area borders.

    .EXAMPLE
    New-HTMLMap -Map 'World_Countries' -AnchorName 'Map1' -ShowAreaLegend -AreaTitle 'Country Population' -PlotTitle 'Population Density' -FillColor 'blue' -StrokeColor 'black' -StrokeWidth 2

    Creates a new HTML map displaying world countries with area legend showing country population and plot legend showing population density. The map areas are filled with blue color, have black borders, and a border width of 2.

    .EXAMPLE
    $CustomSettings = {
        # Custom map settings here
    }
    New-HTMLMap -Map 'Usa_States' -AnchorName 'Map2' -ShowPlotLegend -PlotTitle 'Economic Data' -FillColor 'green' -StrokeColor 'gray' -StrokeWidth 1 -MapSettings $CustomSettings

    Creates a new HTML map displaying USA states with plot legend showing economic data. The map areas are filled with green color, have gray borders, and a border width of 1. Custom map settings are applied using the script block $CustomSettings.

    #>
    [cmdletBinding()]
    param(
        [scriptblock] $MapSettings,
        [parameter(Mandatory)][ValidateSet('Poland', 'Usa_States', 'World_Countries', 'European_Union')][string] $Map,
        [string] $AnchorName,
        [switch] $ShowAreaLegend,
        [string] $AreaTitle,
        [string] $PlotTitle,
        [switch] $ShowPlotLegend,
        [alias('SliceColor')][string] $FillColor,
        [string] $StrokeColor,
        [nullable[int]] $StrokeWidth
    )
    Enable-HTMLFeature -Feature Raphael, Mapael, Jquery, JQueryMouseWheel, "MapaelMaps_$Map"
    if (-not $AnchorName) {
        $AnchorName = "MapContainer$(Get-RandomStringName -Size 8)"
    }
    $Options = [ordered] @{
        map    = [ordered] @{
            name        = $Map.ToLower()
            defaultArea = [ordered]@{
                attrs = [ordered]@{
                    fill           = ConvertFrom-Color -Color $FillColor
                    stroke         = ConvertFrom-Color -Color $StrokeColor
                    'stroke-width' = $StrokeWidth
                }
            }
        }
        legend = [ordered] @{
            area = [ordered] @{
                title  = $AreaTitle
                slices = [System.Collections.Generic.List[System.Collections.IDictionary]]::new()
            }
            plot = [ordered] @{
                title  = $PlotTitle
                slices = [System.Collections.Generic.List[System.Collections.IDictionary]]::new()
            }
        }
        areas  = [ordered] @{}
        plots  = [ordered] @{}
    }

    if ($MapSettings) {
        $ExecutedData = $MapSettings.Invoke()
        foreach ($Setting in $ExecutedData) {
            if ($Setting.Type -eq 'MapArea') {
                foreach ($MapArea in $Setting.Configuration.Keys ) {
                    $Options.areas[$MapArea] = $Setting.Configuration[$MapArea]
                }
            } elseif ($Setting.Type -eq 'MapPlot') {
                foreach ($MapPlot in $Setting.Configuration.Keys ) {
                    $Options.plots[$MapPlot] = $Setting.Configuration[$MapPlot]
                }
            } elseif ($Setting.Type -eq 'MapLegendOption') {
                if ($Setting.Configuration.default) {
                    foreach ($Option in $Setting.Configuration.default.Keys) {
                        $Options.legend.default[$Option] = $Setting.Configuration.default[$Option]
                    }
                }
                if ($Setting.Configuration.area) {
                    foreach ($Option in $Setting.Configuration.area.Keys) {
                        $Options.legend.area[$Option] = $Setting.Configuration.area[$Option]
                    }
                }
                if ($Setting.Configuration.plot) {
                    foreach ($Option in $Setting.Configuration.plot.Keys) {
                        $Options.legend.plot[$Option] = $Setting.Configuration.plot[$Option]
                    }
                }
            } elseif ($Setting.Type -eq 'MapLegendAreaSlice') {
                $Options.legend.area.slices.Add($Setting.Configuration)

            } elseif ($Setting.Type -eq 'MapLegendPlotSlice') {
                $Options.legend.plot.slices.Add($Setting.Configuration)
            }
        }
    }

    Remove-EmptyValue -Hashtable $Options -Recursive -Rerun 2

    $OptionsJSON = $Options | ConvertTo-JsonLiteral -Depth 5 -AdvancedReplace @{ '.' = '\.'; '$' = '\$' }

    New-HTMLTag -Tag 'script' {
        "`$(function () { `$(`".$AnchorName`").mapael($OptionsJSON); });"
    }

    New-HTMLTag -Tag 'div' -Attributes @{ class = $AnchorName } {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'map' } {
            $AlternateMapContent
        }
        if ($ShowAreaLegend) {
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'areaLegend' } {
                $AlternateAreaLegendContent
            }
        }
        if ($ShowPlotLegend) {
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'plotLegend' } {
                $AlternatePlotLegendContent
            }
        }
    }
}

Register-ArgumentCompleter -CommandName New-HTMLMap -ParameterName FillColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLMap -ParameterName StrokeColor -ScriptBlock $Script:ScriptBlockColors