function Get-Resources {
    [CmdLetBinding()]
    param(
        [switch] $Online,
        [switch] $NoScript,
        [ValidateSet('Header', 'Footer', 'HeaderAlways', 'FooterAlways')][string] $Location,
        [string[]] $Features
    )
    Process {
        foreach ($Feature in $Features) {

            Write-Verbose "Get-Resources - Location: $Location - Feature: $Feature Online: $Online"
            if ($Online) {
                Add-HTMLStyle -Placement Inline -Link $Script:CurrentConfiguration.Features.$Feature.$Location.'CssLink' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment
            } else {
                $CSSOutput = Add-HTMLStyle -Placement Inline -FilePath $Script:CurrentConfiguration.Features.$Feature.$Location.'Css' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -Replace $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace
                Convert-StyleContent -CSS $CSSOutput -ImagesPath "$PSScriptRoot\..\Resources\Images\DataTables" -SearchPath "../images/"
                $CSSOutput = Add-HTMLStyle -Placement Inline -CssInline $Script:CurrentConfiguration.Features.$Feature.$Location.'CssInline' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -Replace $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace
                Convert-StyleContent -CSS $CSSOutput -ImagesPath "$PSScriptRoot\..\Resources\Images\DataTables" -SearchPath "../images/"
            }
            if ($Online) {
                Add-HTMLScript -Placement Inline -Link $Script:CurrentConfiguration.Features.$Feature.$Location.'JsLink' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment
            } else {
                Add-HTMLScript -Placement Inline -FilePath $Script:CurrentConfiguration.Features.$Feature.$Location.'Js' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -ReplaceData $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace
            }

            if ($NoScript) {
                [Array] $Output = @(
                    if ($Online) {
                        Add-HTMLStyle -Placement Inline -Link $Script:CurrentConfiguration.Features.$Feature.$Location.'CssLinkNoScript' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment
                    } else {
                        $CSSOutput = Add-HTMLStyle -Placement Inline -FilePath $Script:CurrentConfiguration.Features.$Feature.$Location.'CssNoScript' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -ReplaceData $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace
                        Convert-StyleContent -CSS $CSSOutput -ImagesPath "$PSScriptRoot\..\Resources\Images\DataTables" -SearchPath "../images/"
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