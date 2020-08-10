function Get-Resources {
    [CmdLetBinding()]
    param(
        [switch] $Online,
        [switch] $NoScript,
        [ValidateSet('Header', 'Footer', 'HeaderAlways', 'FooterAlways')][string] $Location
    )
    DynamicParam {
        # Defines Features Parameter Dynamically
        $Names = $Script:CurrentConfiguration.Features.Keys
        $ParamAttrib = New-Object System.Management.Automation.ParameterAttribute
        $ParamAttrib.Mandatory = $true
        $ParamAttrib.ParameterSetName = '__AllParameterSets'

        $ReportAttrib = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $ReportAttrib.Add($ParamAttrib)
        $ReportAttrib.Add((New-Object System.Management.Automation.ValidateSetAttribute($Names)))
        $ReportRuntimeParam = New-Object System.Management.Automation.RuntimeDefinedParameter('Features', [string[]], $ReportAttrib)
        $RuntimeParamDic = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
        $RuntimeParamDic.Add('Features', $ReportRuntimeParam)
        return $RuntimeParamDic
    }
    Process {
        [string[]] $Features = $PSBoundParameters.Features

        foreach ($Feature in $Features) {

            Write-Verbose "Get-Resources - Location: $Location - Feature: $Feature Online: $Online"
            if ($Online) {
                New-HTMLResourceCSS -Link $Script:CurrentConfiguration.Features.$Feature.$Location.'CssLink' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment
            } else {
                $CSSOutput = New-HTMLResourceCSS `
                    -FilePath $Script:CurrentConfiguration.Features.$Feature.$Location.'Css' `
                    -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment `
                    -Replace $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace
                Convert-StyleContent -CSS $CSSOutput -ImagesPath "$PSScriptRoot\..\Resources\Images\DataTables" -SearchPath "../images/"

                $CSSOutput = New-HTMLResourceCSS `
                    -CssInline $Script:CurrentConfiguration.Features.$Feature.$Location.'CssInline' `
                    -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment `
                    -Replace $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace
                Convert-StyleContent -CSS $CSSOutput -ImagesPath "$PSScriptRoot\..\Resources\Images\DataTables" -SearchPath "../images/"
            }
            if ($Online) {
                New-HTMLResourceJS -Link $Script:CurrentConfiguration.Features.$Feature.$Location.'JsLink' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment
            } else {
                New-HTMLResourceJS -FilePath $Script:CurrentConfiguration.Features.$Feature.$Location.'Js' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -ReplaceData $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace
            }

            if ($NoScript) {
                [Array] $Output = @(
                    if ($Online) {
                        New-HTMLResourceCSS -Link $Script:CurrentConfiguration.Features.$Feature.$Location.'CssLinkNoScript' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment
                    } else {
                        $CSSOutput = New-HTMLResourceCSS -FilePath $Script:CurrentConfiguration.Features.$Feature.$Location.'CssNoScript' -ResourceComment $Script:CurrentConfiguration.Features.$Feature.Comment -ReplaceData $Script:CurrentConfiguration.Features.$Feature.CustomActionsReplace
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