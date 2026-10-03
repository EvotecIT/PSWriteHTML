function New-HTMLMarkdown {
    <#
    .SYNOPSIS
    Creates HTML content from Markdown text with customizable options.

    .DESCRIPTION
    The New-HTMLMarkdown function converts Markdown text to HTML content with various customization options such as strikethrough, emojis, code block styling, table of contents, and more.

    .PARAMETER ScriptBlock
    Specifies a script block containing Markdown content to convert.

    .PARAMETER FilePath
    Specifies the path to a file containing Markdown content to convert.

    .PARAMETER Content
    Specifies an array of Markdown content to convert.

    .PARAMETER Id
    Specifies the ID attribute for the HTML container.

    .PARAMETER omitExtraWLInCodeBlocks
    Switch parameter to omit extra whitespace in code blocks.

    .PARAMETER EnableStrikethrough
    Switch parameter to enable strikethrough styling.

    .PARAMETER EnableEmoji
    Switch parameter to enable emoji support.

    .PARAMETER EnableBackslashEscapesHTMLTags
    Switch parameter to enable backslash escapes for HTML tags.

    .PARAMETER EnableMoreStyling
    Switch parameter to enable additional styling options.

    .PARAMETER HeaderLevelStart
    Specifies the starting header level for Markdown content.

    .PARAMETER EnableGithubCodeBlocks
    Switch parameter to enable GitHub-style code blocks.

    .PARAMETER EnableTaskLists
    Switch parameter to enable task lists in Markdown.

    .PARAMETER DisableTables
    Switch parameter to disable table rendering.

    .PARAMETER EnableSimpleLineBreaks
    Switch parameter to enable simple line breaks.

    .PARAMETER EnableRequireSpaceBeforeHeadingText
    Switch parameter to require space before heading text.

    .PARAMETER EnableEncodeEmails
    Switch parameter to enable email encoding.

    .PARAMETER EnableOpenLinksInNewWindow
    Switch parameter to open links in a new window.

    .PARAMETER EnableBackslashEscapes
    Switch parameter to enable backslash escapes.

    .PARAMETER SanitezeHTML
    Switch parameter to sanitize HTML content.

    .PARAMETER EnableTOC
    Switch parameter to enable table of contents generation.

    .PARAMETER Encoding
    Specifies the encoding for reading the Markdown content file. Default is 'UTF8'.

    .PARAMETER ImageBase
    Base directory for relative image files. Defaults to the Markdown file's directory. Files outside this directory and symbolic links are not embedded.

    .PARAMETER EmbedImages
    Embeds local images when reading a file or using ImageBase. Defaults to true. Set to false to retain relative image references.

    .EXAMPLE
    New-HTMLMarkdown -FilePath "C:\Markdown\example.md" -EnableStrikethrough -EnableEmoji -EnableTOC

    Converts the Markdown content from the file "example.md" to HTML with strikethrough, emojis, and a table of contents.

    .EXAMPLE
    $MarkdownContent = @("## Title", "This is a **bold** text.")
    New-HTMLMarkdown -Content $MarkdownContent -EnableMoreStyling -EnableTaskLists

    Converts the Markdown content in the array with additional styling and task list support.
    #>
    [CmdletBinding(DefaultParameterSetName = 'FilePath')]
    param(
        [Parameter(Mandatory, ParameterSetName = 'ScriptBlock', Position = 0)][scriptblock] $ScriptBlock,
        [Parameter(Mandatory, ParameterSetName = 'FilePath')][string] $FilePath,
        [Parameter(Mandatory, ParameterSetName = 'Content')][Array] $Content,
        #[ValidateSet('original', 'vanilla', 'github')][string] $MarkdownFlavor,
        [string] $Id,
        [switch] $omitExtraWLInCodeBlocks,
        [switch] $EnableStrikethrough,
        [switch] $EnableEmoji,
        [switch] $EnableBackslashEscapesHTMLTags,
        [switch] $EnableMoreStyling,
        [int] $HeaderLevelStart,
        [switch] $EnableGithubCodeBlocks,
        [switch] $EnableTaskLists,
        [switch] $DisableTables,
        [switch] $EnableSimpleLineBreaks,
        [switch] $EnableRequireSpaceBeforeHeadingText,
        [switch] $EnableEncodeEmails,
        [switch] $EnableOpenLinksInNewWindow,
        [switch] $EnableBackslashEscapes,
        [switch] $SanitezeHTML,
        [switch] $EnableTOC,
        [string] $Encoding = 'UTF8',
        [string] $ImageBase,
        [bool] $EmbedImages = $true
    )

    $Script:HTMLSchema.Features.MarkdownShowdown = $true
    #$Script:HTMLSchema.Features.CodeBlocksHighlight = $true

    if ($FilePath) {
        [Array] $Content = Get-Content -LiteralPath $FilePath -Encoding $Encoding
    } elseif ($ScriptBlock) {
        [Array]  $Content = & $ScriptBlock
    }
    if (-not $Content) {
        Write-Warning -Message 'New-HTMLMarkdown - No content provided. Skipping'
        return
    }

    if (-not $Id) {
        $Id = "MarkdownContainer$(Get-RandomStringName -Size 8)"
    }

    $JoinedContent = [string]::Join("`n", [string[]]$Content) + "`n"
    if ($EmbedImages -and ($FilePath -or $ImageBase)) {
        if (-not $ImageBase) { $ImageBase = Split-Path -Parent (Convert-Path -LiteralPath $FilePath) }
        $JoinedContent = Resolve-HTMLMarkdownImages -Content $JoinedContent -ImageBase $ImageBase
    }
    if ($EnableTOC) {
        $JoinedContent = $JoinedContent.Replace('[TOC]', '[toc]')
        $JoinedContent = $JoinedContent.Replace('[toc]', '<p>[toc]</p>')
    }

    $VariableOutput = "outputMarkdown$(Get-RandomStringName -Size 8)"
    $ConverterVariable = "converter$(Get-RandomStringName -Size 8)"
    $TextVariable = "text$(Get-RandomStringName -Size 8)"
    $HtmlVariable = "html$(Get-RandomStringName -Size 8)"
    $HtmlMDVariable = "htmlMD$(Get-RandomStringName -Size 8)"

    $Options = [ordered] @{}
    if ($PSBoundParameters.ContainsKey('omitExtraWLInCodeBlocks')) {
        $Options['omitExtraWLInCodeBlocks'] = $true
    }
    if ($PSBoundParameters.ContainsKey('EnableStrikethrough')) {
        $Options['strikethrough'] = $true
    }
    if ($PSBoundParameters.ContainsKey('EnableEmoji')) {
        $Options['emoji'] = $true
    }
    if ($PSBoundParameters.ContainsKey('EnableMoreStyling')) {
        $Options['moreStyling'] = $true
    }
    if ($PSBoundParameters.ContainsKey('HeaderLevelStart')) {
        $Options['headerLevelStart'] = $HeaderLevelStart
    }
    if ($PSBoundParameters.ContainsKey('EnableGithubCodeBlocks')) {
        $Options['ghCodeBlocks'] = $true
    }
    if ($PSBoundParameters.ContainsKey('EnableTaskLists')) {
        $Options['tasklists'] = $true
    }
    if ($PSBoundParameters.ContainsKey('DisableTables')) {
        $Options['tables'] = $false
    } else {
        $Options['tables'] = $true
    }
    if ($PSBoundParameters.ContainsKey('EnableSimpleLineBreaks')) {
        $Options['simpleLineBreaks'] = $true
    }
    if ($PSBoundParameters.ContainsKey('EnableRequireSpaceBeforeHeadingText')) {
        $Options['requireSpaceBeforeHeadingText'] = $true
    }
    if ($PSBoundParameters.ContainsKey('EnableEncodeEmails')) {
        $Options['encodeEmails'] = $true
    }
    if ($PSBoundParameters.ContainsKey('EnableOpenLinksInNewWindow')) {
        $Options['openLinksInNewWindow'] = $true
    }
    if ($PSBoundParameters.ContainsKey('EnableBackslashEscapes')) {
        $Options['backslashEscapesHTMLTags'] = $true
    }

    if ($EnableTOC) {
        $Script:HTMLSchema.Features.MarkdownShowdownTOC = $true
        $Options['extensions'] = @('tocReplaceMe')
    }

    $ContentJSON = ConvertTo-HTMLScriptJson -InputObject $JoinedContent -Compress
    $IdJSON = ConvertTo-HTMLScriptJson -InputObject $Id -Compress
    $OptionsJSON = $Options | ConvertTo-HTMLScriptJson
    $OptionsJSON = $OptionsJSON -replace '"tocReplaceMe"', 'showdownToc()'

    New-HTMLPanel -Invisible {
        New-HTMLTag -Tag 'div' -Attributes @{ class = 'markdown-body'; id = $Id } {}

        $Script = New-HTMLTag -Tag 'script' -Value {
            "let $TextVariable = $ContentJSON;"
            "const $VariableOutput = document.getElementById($IdJSON);"
            "var $ConverterVariable = new showdown.Converter($OptionsJSON),"
            "$HtmlVariable = $ConverterVariable.makeHtml($TextVariable);"

            if ($SanitezeHTML) {
                $Script:HTMLSchema.Features.JSXSS = $true
                "$HtmlMDVariable = filterXSS($HtmlVariable);"
                "$VariableOutput.innerHTML = $HtmlMDVariable;"
            } else {
                "$VariableOutput.innerHTML = $HtmlVariable;"
            }
            if ($MarkdownFlavor) {
                "$ConverterVariable.setFlavor('$MarkdownFlavor');"
            }
        } -NewLine
        $Script
    }
}

<#
<main class="markdown-body" id="output">
    <h3 id="initText">- output</h3>
</main>
<script>
    const textarea = document.getElementById("input"),
        output = document.getElementById("output"),
        initText = document.getElementById("initText").innerText;

    var converter = new showdown.Converter(),
        text = '# hello, markdown!',
        html = converter.makeHtml(text);

    if (text) {
        output.innerHTML = html;
    } else {
        output.innerHTML = `<h3>${initText}</h3>`;
    }
</script>
#>
