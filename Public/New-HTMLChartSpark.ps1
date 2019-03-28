function New-HTMLChartSpark {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        [ValidateSet('', 'central')][string] $Positioning,

        # Data to display in Spark
        [Array] $Data,
        [string] $TitleText,
        [string] $SubTitleText,
        [int] $FontSizeTitle = 24,
        [int] $FontSizeSubtitle = 14,
        [nullable[RGBColors]] $Color
    )

    $Options = [ordered] @{}
    New-ChartSpark -Options $Options -Color $Color -Title $TitleText -SubTitle $SubTitleText -FontSizeTitle $FontSizeTitle -FontSizeSubtitle $FontSizeSubtitle -Values $Data
    New-ChartSize -Options $Options -Height $Height -Width $Width
    New-ChartToolbar -Options $Options

    New-ApexChart -Positioning $Positioning -Options $Options
}


function New-ChartRadial {
    [CmdletBinding()]
    param(
        [System.Collections.IDictionary] $Options,
        [Array] $Values,
        [Array] $Names,
        $Type
    )
    # Chart defintion type, size
    $Options.chart = @{
        type = 'radialBar'
    }

    if ($Type -eq '1') {
        New-ChartRadialType1 -Options $Options
    } elseif ($Type -eq '2') {
        New-ChartRadialType2 -Options $Options
    }

    $Options.series = @($Values)
    $Options.labels = @($Names)


}