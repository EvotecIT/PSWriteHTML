<#
data-enlighter-language (string) - The language of the codeblock - overrides the global default setting | Block+Inline Content option
data-enlighter-theme (string) - The theme of the codeblock - overrides the global default setting | Block+Inline Content option
data-enlighter-group (string) - The identifier of the codegroup where the codeblock belongs to | Block Content option
data-enlighter-title (string) - The title/name of the tab | Block Content option
data-enlighter-linenumbers (boolean) - Show/Hide the linenumbers of a codeblock (Values: "true", "false") | Block Content option
data-enlighter-highlight (string) - A List of lines to point out, comma seperated (ranges are supported) e.g. "2,3,6-10" | Block Content option
data-enlighter-lineoffset (number) - Start value of line-numbering e.g. "5" to start with line 5 - attribute start of the ol tag is set | Block Content option
#>

Function New-HTMLCodeBlock {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $true)][String] $Code,
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            'assembly',
            'asm',
            'avrassembly',
            'avrasm',
            'c',
            'cpp',
            'c++',
            'csharp',
            'css',
            'cython',
            'cordpro',
            'diff',
            'docker',
            'dockerfile',
            'generic',
            'standard',
            'groovy',
            'go',
            'golang',
            'html',
            'ini',
            'conf',
            'java',
            'js',
            'javascript',
            'jquery',
            'mootools',
            'ext.js',
            'json',
            'kotlin',
            'less',
            'lua',
            'gfm',
            'md',
            'markdown',
            'octave',
            'matlab',
            'nsis',
            'php',
            'powershell',
            'prolog',
            'py',
            'python',
            'raw',
            'ruby',
            'rust',
            'scss',
            'sass',
            'shell',
            'bash',
            'sql',
            'squirrel',
            'swift',
            'typescript',
            'vhdl',
            'visualbasic',
            'vb',
            'xml',
            'yaml'
        )]

        [String] $Style = 'powershell',
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            'enlighter',
            'standard',
            'classic',
            'bootstrap4',
            'beyond',
            'godzilla',
            'eclipse',
            'mootwo',
            'droide',
            'minimal',
            'atomic',
            'dracula',
            'rowhammer'
        )][String] $Theme,
        [Parameter(Mandatory = $false)][String] $Group,
        [Parameter(Mandatory = $false)][String] $Title,
        [Parameter(Mandatory = $false)][String] $Highlight,
        [Parameter(Mandatory = $false)][nullable[bool]] $ShowLineNumbers,
        [Parameter(Mandatory = $false)][String] $LineOffset
    )

    [System.Collections.IDictionary] $Builder = [Ordered] @{
        Tag        = 'pre'
        Attributes = [ordered]@{
            'data-enlighter-language'    = "$Style".ToLower()
            'data-enlighter-theme'       = "$Theme".ToLower()
            'data-enlighter-group'       = "$Group".ToLower()
            'data-enlighter-title'       = "$Title"
            'data-enlighter-linenumbers' = "$ShowLineNumbers"
            'data-enlighter-highlight'   = "$Highlight"
            'data-enlighter-lineoffset'  = "$LineOffset".ToLower()
        }
        Value      = $Code
    }
    $HTML = Set-Tag -HtmlObject $Builder

    return $HTML
}
