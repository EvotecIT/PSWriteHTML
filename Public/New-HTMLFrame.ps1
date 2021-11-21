function New-HTMLFrame {
    <#
    .SYNOPSIS
    Allows to inline other HTML files into the current HTML file.

    .DESCRIPTION
    Allows to inline other HTML files into the current HTML file. This can be useful if we want to display content from another file.

    .PARAMETER Id
    ID of the HTML element. By default it's auto-generated.

    .PARAMETER SourcePath
    Path to a file with HTML file to display within iFrame

    .PARAMETER Height
    Set the height of the iFrame to static value. This should be used when not using iFrameResizer.

    .PARAMETER Scrolling
    The HTML <iframe> scrolling Attribute is used to specify that whether the scrollbar will be displayed or not in the <Iframe> Element. Basically the scrollbar is used when the content is large than the Iframe Element.
    Available options are:
    - auto: It has a default value. The scrollbar appears when needed.
    - yes: This value shows the scrollbar in the Iframe Element.
    - no: This value does not show the scrollbar in the Iframe Element.

    .PARAMETER FrameBorder
    Set the frameborder attribute of the <iframe> element. This attribute specifies whether the frame should have a border. The default value is 0.

    .PARAMETER UseiFrameResizer
    Forces HTML inline feature to use iFrameResizer instead of native functionality. For fully functional feature it requires modifying the source HTML file.

    .PARAMETER EnableLogging
    Enable logging to Console for debugging purposes when using iFrameResizer (requires UseiFrameResizer).

    .EXAMPLE
    New-HTML {
        New-HTMLSection {
            New-HTMLFrame -SourcePath "$PSSCriptRoot\GPOZaurr.html" -Scrolling Auto
        } -HeaderText 'Test'
        New-HTMLSection {
            New-HTMLFrame -SourcePath "$PSSCriptRoot\GPOZaurr.html" -Scrolling Auto -Height 1500px
        } -HeaderText 'Test'
        New-HTMLSection {
            New-HTMLFrame -SourcePath "C:\Support\GitHub\PSWriteHTML\Examples\Example-Maps\Example-Maps.html"
        } -HeaderText 'Test' -Height 100vh
    } -Online -TitleText 'Test Inline' -ShowHTML -FilePath "$PSScriptRoot\Example-InlineHTML01.html" -AddComment

    .NOTES
    General notes
    #>
    [CmdletBinding()]
    param(
        [string] $Id,
        [string] $SourcePath,
        [validateSet('No', 'Yes', 'Auto')][string] $Scrolling = 'auto',
        [object] $Height,
        [object] $FrameBorder = 0,
        [switch] $UseiFrameResizer,
        [switch] $EnableLogging
    )
    $Script:HTMLSchema.Features.iFrame = $true
    if ($UseiFrameResizer) {
        $Script:HTMLSchema.Features.iFrameResizer = $true
    }

    if (-not $ID) {
        $ID = "Inline-$(Get-RandomStringName -Size 8 -LettersOnly)"
    }

    $Attributes = [ordered] @{
        id          = $Id
        src         = $SourcePath
        height      = ConvertFrom-Size -Size $Height
        frameborder = ConvertFrom-Size -Size $FrameBorder
        scrolling   = $Scrolling.ToLower()
    }
    Remove-EmptyValue -Hashtable $Attributes

    New-HTMLTag -Tag 'iframe' -Attributes $Attributes {

    }
    if ($UseiFrameResizer) {
        $InlineScript = @{
            log = $EnableLogging.IsPresent
        }
        $InlineScriptBody = $InlineScript | ConvertTo-Json -Depth 100
        $Script = New-HTMLTag -Tag 'script' -Value {
            # https://github.com/davidjbradshaw/iframe-resizer/blob/master/docs/parent_page/options.md
            # We should go thru options and add them to the script
            "iFrameResize($InlineScriptBody, '#$Id')"
        } -NewLine
        $Script
    }
}