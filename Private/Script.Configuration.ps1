$Script:Configuration = [ordered] @{
    Features = [ordered] @{
        Default          = @{
            HeaderLocal = @{
                Css = "$PSScriptRoot\..\Resources\CSS\Styles\default.css"   
            }
        }
        Accordion        = @{
            Header = @{
                Css = "$PSScriptRoot\..\Resources\CSS\Styles\accordion-1.css"
            }
        }
        Bulma            = @{
            Header = @{
                CssLink = 'https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.4/css/bulma.min.css'
            }
        }
        CodeBlocks       = @{
            Header      = @{
                CssLink = 'https://evotec.xyz/wp-content/uploads/pswritehtml/enlighterjs.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\StylesAlways\enlighterjs.min.css"
                JsLink  = 'https://evotec.xyz/wp-content/uploads/pswritehtml/enlighterjs.min.js'
            }
            Footer      = @{

            }
            HeaderLocal = @{
                
            }
            FooterLocal = @{
                JS = "$PSScriptRoot\..\Resources\JS\Static\Enlighter-Footer.js"
            }
        }
        Charts           = @{
            Header = @{
                JsLink = 'https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js'
            }
        }
        ChartsApex       = @{

            Header = @{
                JsLink = 'https://cdn.jsdelivr.net/npm/apexcharts@latest'
                Css    = "$PSScriptRoot\..\Resources\CSS\StylesAlways\apexcharts.css"
            }
        }
        DataTables       = @{
            Header = @{
                CssLink = 'https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.18/af-2.3.2/b-1.5.4/b-colvis-1.5.4/b-html5-1.5.4/b-print-1.5.4/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.5.0/r-2.2.2/rg-1.1.0/rr-1.2.4/sc-1.5.0/sl-1.2.6/datatables.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\StylesAlways\datatables.min.css"
            }
        }
        DataTablesPDF    = @{
            Header = @{
                JsLink = 'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js', 'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js'
            }
        }
        DataTablesExcel  = @{
            Header = @{
                JsLink = 'https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js'
            }
        }
        Tabs             = @{
            Comment = 'Elastic Tabs'
            Header  = @{
                Css = "$PSScriptRoot\..\Resources\CSS\Styles\tabs-elastic.css"
            }
            Footer  = @{
                JSLink = "$PSScriptRoot\..\Resources\JS\Other\tabs-elastic.js"
            }
        }
        TimeLine         = @{
            
            Comment = 'Timeline Simple'
            Header  = @{
                Css = "$PSScriptRoot\..\Resources\CSS\Styles\timeline-simple.css"
            }
        }
        StatusButtonical = @{
            Comment = 'Status Buttonical'
            Header  = @{
                Css = "$PSScriptRoot\..\Resources\CSS\Styles\status.css"
            }
        }
        Toast            = @{
            Comment = 'Toasts Looking Messages'
            Header  = @{
                Css = "$PSScriptRoot\..\Resources\CSS\Styles\toasts.css"
            }
        }
        TuiGrid          = @{
            Header = @{
                CssLink = 'https://cdn.jsdelivr.net/npm/tui-grid@3.5.0/dist/tui-grid.css'
            }
        }
    }
}

function Get-Resources {
    [CmdLetBinding()]
    param(
        [switch] $UseCssLinks,
        [switch] $UseJavaScriptLinks, 
        [ValidateSet('Header', 'Footer', 'HeaderLocal', 'FooterLocal')][string] $Loocation
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
            
            # $Script:Configuration.Features.$Feature.$Location


            if ($UseCssLinks) {

            } else {

            }
            if ($UseJavaScriptLinks) {

            } else {

            }
        }
    }
}

Get-Resources -Features Accordion, Bulma