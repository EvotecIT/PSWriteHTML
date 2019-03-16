function Get-Resources {
    [CmdLetBinding()]
    param(
        [switch] $UseCssLinks,
        [switch] $UseJavaScriptLinks, 
        [ValidateSet('Header', 'Footer', 'HeaderAlways', 'FooterAlways')][string] $Location
    )
    DynamicParam {
        # Defines Features Parameter Dynamically
        $Names = $Script:Configuration.Features.Keys
        $ParamAttrib = New-Object System.Management.Automation.ParameterAttribute
        $ParamAttrib.Mandatory = $true
        $ParamAttrib.ParameterSetName = '__AllParameterSets'

        $ReportAttrib = New-Object  System.Collections.ObjectModel.Collection[System.Attribute]
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
            
            Write-Verbose "Get-Resources - Location: $Location - Feature: $Feature UseCssLinks: $UseCssLinks UseJavaScriptLinks: $UseJavaScriptLinks"
            if ($UseCssLinks) {
                New-HTMLResourceCSS -Link $Script:Configuration.Features.$Feature.$Location.'CssLink' -ResourceComment $Script:Configuration.Features.$Feature.Comment
            } else {
                $CSSOutput = New-HTMLResourceCSS -FilePath $Script:Configuration.Features.$Feature.$Location.'Css' -ResourceComment $Script:Configuration.Features.$Feature.Comment 
                Convert-StyleContent -CSS $CSSOutput -ImagesPath "$PSScriptRoot\..\Resources\Images\DataTables" -SearchPath "DataTables-1.10.18/images/"
            }
            if ($UseJavaScriptLinks) {
                New-HTMLResourceJS -Link $Script:Configuration.Features.$Feature.$Location.'JsLink' -ResourceComment $Script:Configuration.Features.$Feature.Comment 
            } else {
                New-HTMLResourceJS -FilePath $Script:Configuration.Features.$Feature.$Location.'Js' -ResourceComment $Script:Configuration.Features.$Feature.Comment 
            }
        }
        
    }

}