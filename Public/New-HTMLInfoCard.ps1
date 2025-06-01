function New-HTMLInfoCard {
    <#
    .SYNOPSIS
    Creates a dashboard info card with customizable styling options.

    .DESCRIPTION
    The New-HTMLInfoCard function creates modern, responsive dashboard cards displaying key metrics or information.
    It supports multiple styles including standard, compact, fixed layout (multiline-safe), and classic designs.

    .PARAMETER Title
    The main title/label text for the card.

    .PARAMETER Number
    The primary numeric value or main statistic to display.

    .PARAMETER Subtitle
    Optional subtitle or description text below the number.

    .PARAMETER Icon
    Icon to display on the card. Can be an emoji (like 👥, 🔒, 💪).

    .PARAMETER IconFromDictionary
    Icon name from the pre-defined emoji dictionary.

    .PARAMETER IconSolid
    FontAwesome solid icon name.

    .PARAMETER IconRegular
    FontAwesome regular icon name.

    .PARAMETER IconBrands
    FontAwesome brands icon name.

    .PARAMETER IconColor
    Background color for the icon. Supports color names, hex codes, or RGB values.

    .PARAMETER NumberColor
    Color for the main number/statistic. Defaults to blue (#0078d4).

    .PARAMETER Style
    The visual style of the card. Options:
    - 'Standard' (default): Regular cards with icons on the left
    - 'Compact': Smaller cards with reduced padding
    - 'Fixed': Multiline-safe layout where numbers stay aligned
    - 'Classic': Traditional style with square colored icon backgrounds
    - 'NoIcon': Cards without any icons

    .PARAMETER BackgroundColor
    Background color of the card. Defaults to white.

    .PARAMETER BorderRadius
    Border radius for rounded corners. Defaults to 14px.

    .PARAMETER AnchorName
    Optional anchor name for the card element.

    .EXAMPLE
    New-HTMLInfoCard -Title "Total Users" -Number 47 -Subtitle "21.28% of users" -Icon "👥" -IconColor "#0078d4"

    Creates a standard info card with a user icon and blue background.

    .EXAMPLE
    New-HTMLInfoCard -Title "Sales Today" -Number 132 -Subtitle "12 waiting payments" -Style "Classic" -IconFromDictionary "Money" -IconColor "#21c87a"

    Creates a classic style card using icon from dictionary.

    .EXAMPLE
    New-HTMLInfoCard -Title "Analytics Report" -Number 156 -Subtitle "Reports generated" -IconSolid "chart-bar" -IconColor "#6f42c1"

    Creates a card with FontAwesome solid icon.

    .NOTES
    This function requires the DashboardCards CSS feature to be loaded.
    The cards are responsive and will stack on smaller screens.
    #>
    [alias('InfoCard')]
    [CmdletBinding(DefaultParameterSetName = 'Emoji')]
    param (
        [Parameter(ParameterSetName = "FontAwesomeBrands")]
        [Parameter(ParameterSetName = "FontAwesomeRegular")]
        [Parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(ParameterSetName = "Dictionary")]
        [Parameter(ParameterSetName = "Emoji")]
        [Parameter(Mandatory)][string] $Title,

        [Parameter(ParameterSetName = "FontAwesomeBrands")]
        [Parameter(ParameterSetName = "FontAwesomeRegular")]
        [Parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(ParameterSetName = "Dictionary")]
        [Parameter(ParameterSetName = "Emoji")]
        [Parameter()][string] $Number,

        [Parameter(ParameterSetName = "FontAwesomeBrands")]
        [Parameter(ParameterSetName = "FontAwesomeRegular")]
        [Parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(ParameterSetName = "Dictionary")]
        [Parameter(ParameterSetName = "Emoji")]
        [string] $Subtitle,

        [Parameter(ParameterSetName = "Emoji")]
        [string] $Icon,

        # ICON SOLID
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeSolid.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeSolid.Keys))
            }
        )]
        [Parameter(ParameterSetName = "FontAwesomeSolid")]
        [string] $IconSolid,

        # ICON REGULAR
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeRegular.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeRegular.Keys))
            }
        )]
        [Parameter(ParameterSetName = "FontAwesomeRegular")]
        [string] $IconRegular,

        # ICON BRANDS
        [ArgumentCompleter(
            {
                param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
                ($Global:HTMLIcons.FontAwesomeBrands.Keys)
            }
        )]
        [ValidateScript(
            {
                $_ -in (($Global:HTMLIcons.FontAwesomeBrands.Keys))
            }
        )]
        [Parameter(ParameterSetName = "FontAwesomeBrands")]
        [string] $IconBrands,

        [Parameter(ParameterSetName = "FontAwesomeBrands")]
        [Parameter(ParameterSetName = "FontAwesomeRegular")]
        [Parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(ParameterSetName = "Dictionary")]
        [Parameter(ParameterSetName = "Emoji")]
        [string] $IconColor = '#0078d4',

        [Parameter(ParameterSetName = "FontAwesomeBrands")]
        [Parameter(ParameterSetName = "FontAwesomeRegular")]
        [Parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(ParameterSetName = "Dictionary")]
        [Parameter(ParameterSetName = "Emoji")]
        [string] $NumberColor = '#0078d4',

        [Parameter(ParameterSetName = "FontAwesomeBrands")]
        [Parameter(ParameterSetName = "FontAwesomeRegular")]
        [Parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(ParameterSetName = "Dictionary")]
        [Parameter(ParameterSetName = "Emoji")]
        [ValidateSet('Standard', 'Compact', 'Fixed', 'Classic', 'NoIcon')]
        [string] $Style = 'Standard',

        [Parameter(ParameterSetName = "FontAwesomeBrands")]
        [Parameter(ParameterSetName = "FontAwesomeRegular")]
        [Parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(ParameterSetName = "Dictionary")]
        [Parameter(ParameterSetName = "Emoji")]
        [string] $BackgroundColor = '#ffffff',

        [Parameter(ParameterSetName = "FontAwesomeBrands")]
        [Parameter(ParameterSetName = "FontAwesomeRegular")]
        [Parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(ParameterSetName = "Dictionary")]
        [Parameter(ParameterSetName = "Emoji")]
        [string] $BorderRadius = '14px',

        [Parameter(ParameterSetName = "FontAwesomeBrands")]
        [Parameter(ParameterSetName = "FontAwesomeRegular")]
        [Parameter(ParameterSetName = "FontAwesomeSolid")]
        [Parameter(ParameterSetName = "Dictionary")]
        [Parameter(ParameterSetName = "Emoji")]
        [string] $AnchorName
    )

    # Enable required features
    $Script:HTMLSchema.Features.Main = $true
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.DashboardCards = $true

    # Generate unique anchor name if not provided
    if (-not $AnchorName) {
        $AnchorName = "infocard-$(Get-RandomStringName -Size 7)"
    }

    # Resolve icon based on parameter set
    $ResolvedIcon = $null
    $IconClass = $null

    if ($PSCmdlet.ParameterSetName -eq 'Emoji' -and $Icon) {
        if ($Script:InfoCardIcons[$Icon]) {
            $ResolvedIcon = $Script:InfoCardIcons[$Icon]
        } else {
            $ResolvedIcon = $Icon
        }
        # } elseif ($PSCmdlet.ParameterSetName -eq 'Dictionary' -and $IconFromDictionary) {
        #     $ResolvedIcon = $Script:InfoCardIcons[$IconFromDictionary]
    } elseif ($PSCmdlet.ParameterSetName -eq 'FontAwesomeSolid' -and $IconSolid) {
        $Script:HTMLSchema.Features.FontsAwesome = $true
        $ResolvedIcon = $Global:HTMLIcons.FontAwesomeSolid[$IconSolid]
        $IconClass = 'fas'
    } elseif ($PSCmdlet.ParameterSetName -eq 'FontAwesomeRegular' -and $IconRegular) {
        $Script:HTMLSchema.Features.FontsAwesome = $true
        $ResolvedIcon = $Global:HTMLIcons.FontAwesomeRegular[$IconRegular]
        $IconClass = 'far'
    } elseif ($PSCmdlet.ParameterSetName -eq 'FontAwesomeBrands' -and $IconBrands) {
        $Script:HTMLSchema.Features.FontsAwesome = $true
        $ResolvedIcon = $Global:HTMLIcons.FontAwesomeBrands[$IconBrands]
        $IconClass = 'fab'
    }

    # Card styling
    $CardStyle = [ordered] @{
        'background-color' = ConvertFrom-Color -Color $BackgroundColor
        'border-radius'    = $BorderRadius
    }

    # Number styling
    $NumberStyle = [ordered] @{
        'color' = ConvertFrom-Color -Color $NumberColor
    }

    # Icon styling (if icon is provided and not NoIcon style)
    $IconStyle = $null
    if ($ResolvedIcon -and $Style -ne 'NoIcon') {
        $IconStyle = [ordered] @{
            'background-color' = ConvertFrom-Color -Color $IconColor
        }
    }

    # Determine CSS classes based on style
    $CssClass = 'flexElement dashboard-card'
    if ($Style -ne 'Standard') {
        $CssClass += " $($Style.ToLower())"
    }

    # Build the card HTML as a panel (compatible with New-HTMLPanel)
    New-HTMLTag -Tag 'div' -Attributes @{ id = $AnchorName; class = $CssClass; style = $CardStyle } {

        # Icon section (if provided and not NoIcon style)
        if ($ResolvedIcon -and $Style -ne 'NoIcon') {
            if ($Style -eq 'Classic') {
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'dashboard-card-icon-square'; style = $IconStyle } {
                    if ($IconClass) {
                        New-HTMLTag -Tag 'i' -Attributes @{ class = "$IconClass $ResolvedIcon" }
                    } else {
                        $ResolvedIcon
                    }
                }
            } else {
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'dashboard-card-icon'; style = $IconStyle } {
                    if ($IconClass) {
                        New-HTMLTag -Tag 'i' -Attributes @{ class = "$IconClass $ResolvedIcon" }
                    } else {
                        $ResolvedIcon
                    }
                }
            }
        }

        # Content section
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'dashboard-card-content' } {

            # Title
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'dashboard-card-title' } {
                $Title
            }

            # Number (only for non-classic styles or classic without subtitle)
            if ($Style -ne 'Classic' -or -not $Subtitle) {
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'dashboard-card-number'; style = $NumberStyle } {
                    $Number
                }
            }

            # For classic style, combine number and subtitle differently
            if ($Style -eq 'Classic' -and $Subtitle) {
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'dashboard-card-title' } {
                    $Number
                }
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'dashboard-card-subtitle' } {
                    $Subtitle
                }
            } elseif ($Subtitle -and $Style -ne 'Classic') {
                # Subtitle for non-classic styles
                New-HTMLTag -Tag 'div' -Attributes @{ class = 'dashboard-card-subtitle' } {
                    $Subtitle
                }
            }
        }
    }
}

# Define emoji dictionary for easy icon selection
$Script:InfoCardIcons = @{
    # People & Users
    'Users'     = '👥'
    'User'      = '👤'
    'Admin'     = '👨‍💼'
    'Team'      = '👨‍👩‍👧‍👦'

    # Security
    'Lock'      = '🔒'
    'Unlock'    = '🔓'
    'Key'       = '🔑'
    'Shield'    = '🛡️'
    'Security'  = '🔐'

    # Status & Alerts
    'Success'   = '✅'
    'Warning'   = '⚠️'
    'Error'     = '❌'
    'Info'      = 'ℹ️'
    'Check'     = '✓'

    # Numbers & Analytics
    'Chart'     = '📊'
    'Graph'     = '📈'
    'Trending'  = '📈'
    'Report'    = '📋'
    'Analytics' = '📊'

    # Business
    'Money'     = '💰'
    'Dollar'    = '$'
    'Sales'     = '💵'
    'Revenue'   = '📈'
    'Target'    = '🎯'

    # Technology
    'Server'    = '🖥️'
    'Database'  = '🗄️'
    'Cloud'     = '☁️'
    'Code'      = '💻'
    'Api'       = '🔌'

    # Time & Calendar
    'Clock'     = '⏰'
    'Calendar'  = '📅'
    'Schedule'  = '📆'
    'Timer'     = '⏱️'

    # Actions
    'Download'  = '⬇️'
    'Upload'    = '⬆️'
    'Sync'      = '🔄'
    'Refresh'   = '🔄'
    'Settings'  = '⚙️'
}

# Register argument completers for better PowerShell experience
Register-ArgumentCompleter -CommandName New-HTMLInfoCard -ParameterName Icon -ScriptBlock {
    param($CommandName, $ParameterName, $WordToComplete, $CommandAst, $FakeBoundParameters)
    $Script:InfoCardIcons.Keys | Where-Object { $_ -like "*$WordToComplete*" } | ForEach-Object {
        #"'$_' # $($Script:InfoCardIcons[$_])"
        "$_"
    }
}

Register-ArgumentCompleter -CommandName New-HTMLInfoCard -ParameterName IconColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLInfoCard -ParameterName NumberColor -ScriptBlock $Script:ScriptBlockColors
Register-ArgumentCompleter -CommandName New-HTMLInfoCard -ParameterName BackgroundColor -ScriptBlock $Script:ScriptBlockColors