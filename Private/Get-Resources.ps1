function Get-Resources {
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
                $Data = Convert-StyleContent -CSS $CSSOutput -ImagesPath "$PSScriptRoot\..\Resources\Images\DataTables" -SearchPath "../images/"
                if ($Data) {
                    $Data
                }
                # CssInLine is should always be processed
                # But since Get-Resources is executed in both times we only add it to Offline section
                $CSSOutput = Add-HTMLStyle -Placement Inline -Resource $Script:CurrentConfiguration.Features.$Feature -CssInline $Script:CurrentConfiguration.Features.$Feature.$Location.'CssInline' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -Replace $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace -AddComment:$AddComment
                $Data = Convert-StyleContent -CSS $CSSOutput -ImagesPath "$PSScriptRoot\..\Resources\Images\DataTables" -SearchPath "../images/"
                if ($Data) {
                    $Data
                }
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
                            $Data = Convert-StyleContent -CSS $CSSOutput -ImagesPath "$PSScriptRoot\..\Resources\Images\DataTables" -SearchPath "../images/"
                            if ($Data) {
                                $Data
                            }
                        }
                        # CssInLine is should always be processed
                        $CSSOutput = Add-HTMLStyle -Placement Inline -Resource $Script:CurrentConfiguration.Features.$Feature -CssInline $Script:CurrentConfiguration.Features.$Feature.$Location.'CssInlineNoScript' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -Replace $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace -AddComment:$AddComment
                        if ($CSSOutput) {
                            $Data = Convert-StyleContent -CSS $CSSOutput -ImagesPath "$PSScriptRoot\..\Resources\Images\DataTables" -SearchPath "../images/"
                            if ($Data) {
                                $Data
                            }
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