function Get-Resources {
    <#
    .SYNOPSIS
    Retrieves and adds resources (stylesheets and scripts) to the HTML page based on the specified features and location.

    .DESCRIPTION
    The Get-Resources function retrieves resources such as CSS and JavaScript files and adds them to the HTML page. It allows customization based on the specified features and location. Online and offline modes are supported.

    .PARAMETER Online
    Indicates whether the resources should be added for online use. If specified, resources will be linked directly. Default is offline mode.

    .PARAMETER NoScript
    Indicates whether resources for scripts should be excluded. If specified, script-related resources will not be added.

    .PARAMETER Location
    Specifies the location where the resources should be added. Valid values are 'Header', 'Footer', 'HeaderAlways', 'FooterAlways', 'Body', 'BodyAlways'.

    .PARAMETER Features
    Specifies an array of features for which resources should be retrieved and added.

    .PARAMETER AddComment
    Indicates whether comments should be added to the resources. Default is false.

    .EXAMPLE
    Get-Resources -Online -Location 'Header' -Features 'Feature1', 'Feature2' -AddComment
    Retrieves resources for 'Feature1' and 'Feature2' in online mode, adds them to the header section of the HTML page, and includes comments.

    .EXAMPLE
    Get-Resources -Location 'Footer' -Features 'Feature3' -NoScript
    Retrieves resources for 'Feature3' in offline mode, adds them to the footer section of the HTML page, and excludes script-related resources.

    #>
    [CmdLetBinding()]
    param(
        [switch] $Online,
        [switch] $NoScript,
        [ValidateSet('Header', 'Footer', 'HeaderAlways', 'FooterAlways', 'Body', 'BodyAlways')][string] $Location,
        [string[]] $Features,
        [switch] $AddComment
    )
    Process {
        foreach ($Feature in $Features) {
            Write-Verbose "Get-Resources - Location: $Location - Feature: $Feature Online: $Online AddComment: $($AddComment.IsPresent)"
            if ($Online) {
                Add-HTMLStyle -Placement Inline -Resource $Script:CurrentConfiguration.Features.$Feature -Link $Script:CurrentConfiguration.Features.$Feature.$Location.'CssLink' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -AddComment:$AddComment
            } else {
                $CSSOutput = Add-HTMLStyle -Placement Inline -Resource $Script:CurrentConfiguration.Features.$Feature -FilePath $Script:CurrentConfiguration.Features.$Feature.$Location.'Css' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -Replace $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace -AddComment:$AddComment
                $CSSOutput
                # CssInLine is should always be processed
                # But since Get-Resources is executed in both times we only add it to Offline section
                $CSSOutput = Add-HTMLStyle -Placement Inline -Resource $Script:CurrentConfiguration.Features.$Feature -CssInline $Script:CurrentConfiguration.Features.$Feature.$Location.'CssInline' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -Replace $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace -AddComment:$AddComment
                $CSSOutput
            }
            if ($Online) {
                $Data = Add-HTMLScript -Placement Inline -Resource $Script:CurrentConfiguration.Features.$Feature -Link $Script:CurrentConfiguration.Features.$Feature.$Location.'JsLink' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -AddComment:$AddComment
                if ($Data) {
                    $Data
                }
            } else {
                $Data = Add-HTMLScript -Placement Inline -Resource $Script:CurrentConfiguration.Features.$Feature -FilePath $Script:CurrentConfiguration.Features.$Feature.$Location.'Js' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -ReplaceData $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace -AddComment:$AddComment
                if ($Data) {
                    $Data
                }
                $Data = Add-HTMLScript -Placement Inline -Resource $Script:CurrentConfiguration.Features.$Feature -Content $Script:CurrentConfiguration.Features.$Feature.$Location.'JsInLine' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -AddComment:$AddComment
                if ($Data) {
                    $Data
                }
            }

            if ($NoScript) {
                [Array] $Output = @(
                    if ($Online) {
                        Add-HTMLStyle -Placement Inline -Resource $Script:CurrentConfiguration.Features.$Feature -Link $Script:CurrentConfiguration.Features.$Feature.$Location.'CssLinkNoScript' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -AddComment:$AddComment
                    } else {
                        $CSSOutput = Add-HTMLStyle -Placement Inline -Resource $Script:CurrentConfiguration.Features.$Feature -FilePath $Script:CurrentConfiguration.Features.$Feature.$Location.'CssNoScript' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -ReplaceData $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace -AddComment:$AddComment
                        if ($CSSOutput) {
                            $CSSOutput
                        }
                        # CssInLine is should always be processed
                        $CSSOutput = Add-HTMLStyle -Placement Inline -Resource $Script:CurrentConfiguration.Features.$Feature -CssInline $Script:CurrentConfiguration.Features.$Feature.$Location.'CssInlineNoScript' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -Replace $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace -AddComment:$AddComment
                        if ($CSSOutput) {
                            $CSSOutput
                        }
                    }
                )
                if (($Output.Count -gt 0) -and ($null -ne $Output[0])) {
                    New-HTMLTag -Tag 'noscript' {
                        $Output
                    }
                }
            }
        }
    }
}

$Script:ScriptBlockConfiguration = {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    $Script:CurrentConfiguration.Features.Keys | Where-Object { $_ -like "*$wordToComplete*" }
}
Register-ArgumentCompleter -CommandName Get-Resources -ParameterName Color -ScriptBlock $Script:ScriptBlockConfiguration