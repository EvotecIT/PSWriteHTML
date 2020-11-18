function New-ChartToolTip {
    [CmdletBinding()]
    param(
        [alias('Name')][Array] $Names,
        [alias('Title')][string] $TitleText,
        [ValidateSet('datetime', 'category', 'numeric')][string] $Type = 'category',
        [object] $MinValue,
        [object] $MaxValue,
        [string] $XAxisFormatPattern, #"HH:mm:ss"
        [string] $YAxisFormatPattern = "function (seriesName) { return ''; }"

        #[ValidateSet('top', 'topRight', 'left', 'right', 'bottom', '')][string] $LegendPosition = '',
        # [string[]] $Color
    )

    [PSCustomObject] @{
        ObjectType   = 'ChartToolTip'
        ChartToolTip = @{
            enabled = $true
            y       = @{ title = @{ formatter = "$YAxisFormatPattern" } }
            x       = @{ format = "$XAxisFormatPattern" }
        }
    }
}