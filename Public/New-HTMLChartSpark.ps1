function New-HTMLChartSpark {
    [CmdletBinding()]
    param(
        [nullable[int]] $Height = 350,
        [nullable[int]] $Width,
        <#
        [string] $Type = 'radialBar',
        [bool] $Horizontal = $true,
        [bool] $DataLabelsEnabled = $true,
        [int] $DataLabelsOffsetX = -6,
        [string] $DataLabelsFontSize = '12px',
        [RGBColors] $DataLabelsColor,

        [Array] $DataNames = @(),
        [Array] $DataCategories = @(),
        [ValidateSet('datetime', 'category', 'numeric')][string] $DataCategoriesType = 'category',

        [ValidateSet('center', 'left', 'right', '')][string] $TitleAlignment = '',


        [bool] $LineShow = $true,
        [ValidateSet('straight', 'smooth')] $LineCurve = 'straight',
        $LineWidth = 2,
        [RGBColors[]] $LineColor,
        #>
        [ValidateSet('', 'central')][string] $Positioning,

        [Array] $Data,
        [string] $TitleText,
        [string] $SubTitleText,
        [int] $FontSizeTitle = 24,
        [int] $FontSizeSubtitle = 14,
        [nullable[RGBColors]] $Color
    )
    $Script:HTMLSchema.Features.ChartsApex = $true


    $ID = "ChartID-" + (Get-RandomStringName -Size 8)

    $Div = New-HTMLTag -Tag 'div' -Attributes @{ id = $ID; class = $Positioning }
    $Script = New-HTMLTag -Tag 'script' -Value {

        $Options = [ordered] @{}
        Get-ChartSpark -Options $Options -Color $Color -Title $TitleText -SubTitle $SubTitleText -FontSizeTitle $FontSizeTitle -FontSizeSubtitle $FontSizeSubtitle -Values $Data
        Get-ChartSize -Options $Options -Height $Height -Width $Width
        Get-ChartToolbar -Options $Options

        # Convert Dictionary to JSON and return chart within SCRIPT tag
        # Make sure to return with additional empty string
        $JSON = $Options | ConvertTo-Json -Depth 5
        "var options = $JSON"
        ""
        "var chart = new ApexCharts(document.querySelector('#$ID'),
            options
        );"
        "chart.render();"
    }
    $Div
    # we need to move it to the end of the code therefore using additional vesel
    $Script:HTMLSchema.Charts.Add($Script)
}