Function New-HTMLCodeBlock {
    <#
    .SYNOPSIS
    Creates a new HTML code block with customizable settings for syntax highlighting.

    .DESCRIPTION
    This function creates a new HTML code block with customizable settings for syntax highlighting. It allows you to specify the code language, theme, group, title, line numbers visibility, highlighted lines, and line numbering offset.

    .PARAMETER Code
    Specifies the code content to be displayed in the code block.

    .PARAMETER Style
    Specifies the language style for syntax highlighting. Default is 'powershell'.

    .PARAMETER Theme
    Specifies the theme for the code block. Available themes include 'enlighter', 'beyond', 'classic', and more.

    .PARAMETER Group
    Specifies the group to which the code block belongs.

    .PARAMETER Title
    Specifies the title of the code block.

    .PARAMETER Highlight
    Specifies specific lines to highlight in the code block.

    .PARAMETER ShowLineNumbers
    Indicates whether line numbers should be displayed in the code block.

    .PARAMETER LineOffset
    Specifies the starting line number offset for line numbering.

    .EXAMPLE
    New-HTMLCodeBlock -Code "function greet() { return 'Hello, World!'; }" -Style 'javascript' -Theme 'monokai' -Group 'Functions' -Title 'Greeting Function' -Highlight 2,4-6 -ShowLineNumbers $true -LineOffset 1

    Creates a new HTML code block displaying a JavaScript function with a custom theme, belonging to the 'Functions' group, titled 'Greeting Function', highlighting lines 2, 4 to 6, showing line numbers, and starting line numbering from 1.

    .EXAMPLE
    New-HTMLCodeBlock -Code "for ($i = 0; $i -lt 5; $i++) { Write-Host $i }" -Style 'powershell' -Group 'Loops' -Title 'For Loop Example' -ShowLineNumbers $false

    Creates a new HTML code block displaying a PowerShell for loop without line numbers, belonging to the 'Loops' group, titled 'For Loop Example'.

    #>
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)][String] $Code,
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            'assembly', 'asm', 'avrassembly', 'avrasm', 'c', 'cpp', 'c++', 'csharp',
            'css', 'cython', 'cordpro', 'diff', 'docker', 'dockerfile', 'generic', 'standard', 'groovy', 'go',
            'golang', 'html', 'ini', 'conf', 'java', 'js', 'javascript', 'jquery', 'mootools', 'ext.js', 'json',
            'kotlin', 'less', 'lua', 'gfm', 'md', 'markdown', 'octave', 'matlab', 'nsis', 'php', 'powershell', 'prolog',
            'py', 'python', 'raw', 'ruby', 'rust', 'scss', 'sass', 'shell', 'bash', 'sql',
            'squirrel', 'swift', 'typescript', 'vhdl', 'visualbasic', 'vb', 'xml', 'yaml'
        )][String] $Style = 'powershell',
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            'enlighter', 'beyond', 'classic', 'godzilla', 'atomic', 'droide',
            'minimal', 'eclipse', 'mowtwo', 'rowhammer', 'bootstrap4', 'dracula', 'monokai'
        )][String] $Theme,
        [Parameter(Mandatory = $false)][String] $Group,
        [Parameter(Mandatory = $false)][String] $Title,
        [Parameter(Mandatory = $false)][String[]] $Highlight,
        [Parameter(Mandatory = $false)][nullable[bool]] $ShowLineNumbers,
        [Parameter(Mandatory = $false)][String] $LineOffset
    )
    $Script:HTMLSchema.Features.Main = $true
    $Script:HTMLSchema.Features.MainFlex = $true
    $Script:HTMLSchema.Features.CodeBlocks = $true
    <# Explanation to fields:
        data-enlighter-language (string) - The language of the codeblock - overrides the global default setting | Block+Inline Content option
        data-enlighter-theme (string) - The theme of the codeblock - overrides the global default setting | Block+Inline Content option
        data-enlighter-group (string) - The identifier of the codegroup where the codeblock belongs to | Block Content option
        data-enlighter-title (string) - The title/name of the tab | Block Content option
        data-enlighter-linenumbers (boolean) - Show/Hide the linenumbers of a codeblock (Values: "true", "false") | Block Content option
        data-enlighter-highlight (string) - A List of lines to point out, comma seperated (ranges are supported) e.g. "2,3,6-10" | Block Content option
        data-enlighter-lineoffset (number) - Start value of line-numbering e.g. "5" to start with line 5 - attribute start of the ol tag is set | Block Content option
    #>

    if ($null -eq $ShowLineNumbers -and $Highlight) {
        $ShowLineNumbers = $true
    }

    $Attributes = [ordered]@{
        'data-enlighter-language'    = "$Style".ToLower()
        'data-enlighter-theme'       = "$Theme".ToLower()
        'data-enlighter-group'       = "$Group".ToLower()
        'data-enlighter-title'       = "$Title"
        'data-enlighter-linenumbers' = "$ShowLineNumbers"
        'data-enlighter-highlight'   = "$Highlight"
        'data-enlighter-lineoffset'  = "$LineOffset".ToLower()
    }

    # Cleanup code (if there are spaces before code it fixes that)
    $ExtraCode = $Code.Split([System.Environment]::NewLine)
    [int] $Length = 5000
    $NewCode = foreach ($Line in $ExtraCode) {
        if ($Line.Trim() -ne '') {
            [int] $TempLength = $Line.Length - (($Line -replace '^(\s+)').Length)
            #$TempLength = ($line -replace '^(\s+).+$', '$1').Length
            if ($TempLength -le $Length) {
                $Length = $TempLength
            }
            $Line
        }
    }
    $FixedCode = foreach ($Line in $NewCode) {
        $Line.Substring($Length)
    }
    $FinalCode = $FixedCode -join [System.Environment]::NewLine
    # Prepare HTML
    New-HTMLTag -Tag 'pre' -Attributes $Attributes {
        $FinalCode
    }
}
