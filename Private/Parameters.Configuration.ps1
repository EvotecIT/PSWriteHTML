$Script:Configuration = [ordered] @{
    Features = [ordered] @{
        Inject               = @{
            HeaderAlways = @{
                CssInline = [ordered] @{}
            }
        }

        Default              = @{
            Comment      = 'Always Required Default Visual Settings'
            HeaderAlways = @{
                Css       = "$PSScriptRoot\..\Resources\CSS\default.css"
                CssInline = [ordered] @{
                    'defaultSection'     = [ordered] @{
                        'border'         = '1px solid #bbbbbb'
                        'padding-bottom' = '0px'
                        'margin'         = '5px'
                        'width'          = 'calc(100% - 10px)'
                        'box-shadow'     = '0 4px 8px 0 rgba(0, 0, 0, 0.2)'
                        'transition'     = '0.3s'
                        'border-radius'  = '5px'
                    }
                    'defaultSectionHead' = [ordered] @{
                        'display'          = 'flex'
                        'justify-content'  = 'center'
                        'padding'          = '5px'
                        'margin'           = '0px 0px 0px 0px'
                        'font-weight'      = 'bold'
                        "background-color" = ConvertFrom-Color -Color "DeepSkyBlue"
                        'color'            = ConvertFrom-Color -Color "White"
                    }
                    'defaultSectionText' = [ordered] @{
                        "text-align" = 'center'
                    }
                    'defaultPanel'       = [ordered] @{
                        'box-shadow'    = '0 4px 8px 0 rgba(0, 0, 0, 0.2)'
                        'transition'    = '0.3s'
                        'border-radius' = '5px'
                        'margin'        = '5px'
                    }
                }
            }
        }
        DefaultHeadings      = @{
            Comment      = 'Always Required Default Headings'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\headings.css"
            }
        }
        Accordion            = @{
            Comment      = 'Accordion'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\accordion-1.css"
            }
        }
        CodeBlocks           = @{
            Comment      = 'EnlighterJS CodeBlocks'
            Header       = @{
                CssLink = 'https://evotec.xyz/wp-content/uploads/pswritehtml/enlighterjs30/enlighterjs.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\enlighterjs.min.css"
                JsLink  = 'https://evotec.xyz/wp-content/uploads/pswritehtml/enlighterjs30/enlighterjs.min.js'
                JS      = "$PSScriptRoot\..\Resources\JS\enlighterjs.min.js"
            }
            Footer       = @{

            }
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\enlighterjs.css"
            }
            FooterAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\enlighterjs-footer.js"
            }
        }
        ChartsApex           = @{
            Comment      = 'Apex Charts'
            Header       = @{
                JsLink = @(
                    'https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.min.js' # If you need to make it work with IE11, you need to include these polyfills before including ApexCharts
                    'https://cdn.jsdelivr.net/npm/eligrey-classlist-js-polyfill@1.2.20180112/classList.min.js' # If you need to make it work with IE11, you need to include these polyfills before including ApexCharts
                    'https://cdn.jsdelivr.net/npm/findindex_polyfill_mdn@1.0.0/findIndex.min.js' # You will need this only if you require timeline/rangebar charts
                    'https://unpkg.com/canvg@3.0.4/lib/umd.js' # You will need this only if you require PNG download of your charts
                    'https://cdn.jsdelivr.net/npm/apexcharts@3.18.1/dist/apexcharts.min.js'
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\polyfill.min.js"
                    "$PSScriptRoot\..\Resources\JS\classList.min.js"
                    "$PSScriptRoot\..\Resources\JS\findIndex.min.js"
                    "$PSScriptRoot\..\Resources\JS\umd.js"
                    "$PSScriptRoot\..\Resources\JS\apexcharts.min.js"
                )
            }
            HeaderAlways = @{
                #Css = "$PSScriptRoot\..\Resources\CSS\apexcharts.css"
            }
        }
        ChartsXkcd           = @{
            Header = @{
                JsLink = @(
                    'https://cdn.jsdelivr.net/npm/chart.xkcd@1.1.12/dist/chart.xkcd.min.js'
                )
                Js     = @(
                    "$PSScriptRoot\..\Resources\JS\chart.xkcd.min.js"
                )
            }
        }
        Jquery               = @{
            Comment = 'Jquery'
            Header  = @{
                JsLink = 'https://code.jquery.com/jquery-3.4.1.min.js'
                Js     = "$PSScriptRoot\..\Resources\JS\jquery-3.4.1.min.js"
            }
        }
        DataTablesOld        = @{
            Comment      = 'DataTables'
            HeaderAlways = @{
                Css         = "$PSScriptRoot\..\Resources\CSS\datatables.css"
                CssNoscript = "$PSScriptRoot\..\Resources\CSS\datatables.noscript.css"
            }
            Header       = @{
                CssLink = 'https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.18/af-2.3.2/b-1.5.4/b-colvis-1.5.4/b-html5-1.5.4/b-print-1.5.4/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.5.0/r-2.2.2/rg-1.1.0/rr-1.2.4/sc-1.5.0/sl-1.2.6/datatables.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\datatables.min.css"
                JsLink  = @(
                    "https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.18/af-2.3.2/b-1.5.4/b-colvis-1.5.4/b-html5-1.5.4/b-print-1.5.4/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.5.0/r-2.2.2/rg-1.1.0/rr-1.2.4/sc-1.5.0/sl-1.2.6/datatables.min.js"
                    "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js"
                    "https://cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\datatables.min.js"
                    "$PSScriptRoot\..\Resources\JS\moment.min.js"
                    "$PSScriptRoot\..\Resources\JS\datetime-moment.js"
                )
            }
        }
        DataTablesSearchFade = @{
            Comment = 'DataTables SearchFade'
            Header  = @{
                CssLink = 'https://cdn.datatables.net/plug-ins/preview/searchFade/dataTables.searchFade.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\datatablesSearchFade.css"
                JsLink  = "https://cdn.datatables.net/plug-ins/preview/searchFade/dataTables.searchFade.min.js"
                JS      = "$PSScriptRoot\..\Resources\JS\datatables.SearchFade.min"
            }
        }

        DataTables           = @{
            Comment      = 'DataTables'
            HeaderAlways = @{
                Css         = "$PSScriptRoot\..\Resources\CSS\datatables.css"
                CssNoscript = "$PSScriptRoot\..\Resources\CSS\datatables.noscript.css"
            }
            Header       = @{
                CssLink = @(
                    "https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"
                    "https://cdn.datatables.net/autofill/2.3.4/css/autoFill.dataTables.css"
                    "https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css"
                    "https://cdn.datatables.net/colreorder/1.5.2/css/colReorder.dataTables.min.css"
                    "https://cdn.datatables.net/fixedcolumns/3.3.0/css/fixedColumns.dataTables.min.css"
                    "https://cdn.datatables.net/fixedheader/3.1.6/css/fixedHeader.dataTables.min.css"
                    "https://cdn.datatables.net/keytable/2.5.1/css/keyTable.dataTables.min.css"
                    "https://cdn.datatables.net/responsive/2.2.3/css/responsive.dataTables.min.css"
                    "https://cdn.datatables.net/rowgroup/1.1.1/css/rowGroup.dataTables.min.css"
                    "https://cdn.datatables.net/rowreorder/1.2.6/css/rowReorder.dataTables.min.css"
                    "https://cdn.datatables.net/scroller/2.0.1/css/scroller.dataTables.min.css"
                    "https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\jquery.dataTables.min.css"
                    "$PSScriptRoot\..\Resources\CSS\autoFill.dataTables.css"
                    "$PSScriptRoot\..\Resources\CSS\buttons.dataTables.min.css"
                    "$PSScriptRoot\..\Resources\CSS\colReorder.dataTables.min.css"
                    "$PSScriptRoot\..\Resources\CSS\fixedColumns.dataTables.min.css"
                    "$PSScriptRoot\..\Resources\CSS\fixedHeader.dataTables.min.css"
                    "$PSScriptRoot\..\Resources\CSS\keyTable.dataTables.min.css"
                    "$PSScriptRoot\..\Resources\CSS\responsive.dataTables.min.css"
                    "$PSScriptRoot\..\Resources\CSS\rowGroup.dataTables.min.css"
                    "$PSScriptRoot\..\Resources\CSS\rowReorder.dataTables.min.css"
                    "$PSScriptRoot\..\Resources\CSS\scroller.dataTables.min.css"
                    "$PSScriptRoot\..\Resources\CSS\select.dataTables.min.css"
                )
                JsLink  = @(
                    #"https://code.jquery.com/jquery-3.3.1.min.js"
                    #"https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"
                    #"https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"
                    #"https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"
                    "https://nightly.datatables.net/js/jquery.dataTables.min.js"
                    "https://cdn.datatables.net/autofill/2.3.4/js/dataTables.autoFill.min.js"
                    "https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"
                    "https://cdn.datatables.net/buttons/1.6.1/js/buttons.colVis.min.js"
                    "https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"
                    "https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"
                    "https://cdn.datatables.net/colreorder/1.5.2/js/dataTables.colReorder.min.js"
                    "https://cdn.datatables.net/fixedcolumns/3.3.0/js/dataTables.fixedColumns.min.js"
                    "https://cdn.datatables.net/fixedheader/3.1.6/js/dataTables.fixedHeader.min.js"
                    "https://cdn.datatables.net/keytable/2.5.1/js/dataTables.keyTable.min.js"
                    "https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"
                    "https://cdn.datatables.net/rowgroup/1.1.1/js/dataTables.rowGroup.min.js"
                    "https://cdn.datatables.net/rowreorder/1.2.6/js/dataTables.rowReorder.min.js"
                    "https://cdn.datatables.net/scroller/2.0.1/js/dataTables.scroller.min.js"
                    "https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"
                    "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"
                    "https://cdn.datatables.net/plug-ins/1.10.20/sorting/datetime-moment.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\jquery.dataTables.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.autoFill.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.buttons.min.js"
                    "$PSScriptRoot\..\Resources\JS\buttons.colVis.min.js"
                    "$PSScriptRoot\..\Resources\JS\buttons.html5.min.js"
                    "$PSScriptRoot\..\Resources\JS\buttons.print.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.colReorder.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.fixedColumns.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.fixedHeader.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.keyTable.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.responsive.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.rowGroup.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.rowReorder.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.scroller.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.select.min.js"
                    "$PSScriptRoot\..\Resources\JS\moment.min.js"
                    "$PSScriptRoot\..\Resources\JS\datetime-moment.js"
                )
            }
        }
        DataTablesPDF        = @{
            Comment = 'DataTables PDF Features'
            Header  = @{
                JsLink = @(
                    'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js'
                    'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js'
                )
                Js     = @(
                    "$PSScriptRoot\..\Resources\JS\pdfmake.min.js"
                    "$PSScriptRoot\..\Resources\JS\vfs_fonts.js"
                )
            }
        }
        DataTablesExcel      = @{
            Comment = 'DataTables Excel Features'
            Header  = @{
                JsLink = @(
                    'https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js'
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\jszip.min.js"
                )
            }
        }
        DataTablesSimplify   = @{
            Comment      = 'DataTables (not really) - Simplified'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\datatables.simplify.css"
            }
        }
        D3Mitch              = @{
            Comment      = 'D3Mitch Feature'
            Header       = @{
                JsLink  = @(
                    #'https://cdn.jsdelivr.net/npm/d3-mitch-tree@1.0.5/lib/d3-mitch-tree.min.js'
                    'https://cdn.jsdelivr.net/gh/deltoss/d3-mitch-tree@1.0.2/dist/js/d3-mitch-tree.min.js'
                )
                CssLink = @(
                    'https://cdn.jsdelivr.net/gh/deltoss/d3-mitch-tree@1.0.2/dist/css/d3-mitch-tree.min.css'
                    'https://cdn.jsdelivr.net/gh/deltoss/d3-mitch-tree@1.0.2/dist/css/d3-mitch-tree-theme-default.min.css'
                )
            }
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\hierarchicalTree.css"
            }
        }
        Fonts                = @{
            Comment      = 'Default fonts'
            HeaderAlways = @{
                CssLink = 'https://fonts.googleapis.com/css?family=Roboto|Hammersmith+One|Questrial|Oswald'
            }
        }
        FontsAwesome         = @{
            Comment      = 'Default fonts icons'
            HeaderAlways = @{
                CssLink = 'https://use.fontawesome.com/releases/v5.13.0/css/all.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\all.css"
            }
            Other        = @{
                Link = 'https://use.fontawesome.com/releases/v5.13.0/svgs/'
            }
        }
        FullCalendar         = @{
            Comment      = 'FullCalendar Basic'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\calendar.css"
                Js  = "$PSScriptRoot\..\Resources\JS\fullCalendarTracker.js"
            }
            Header       = @{
                JSLink  = 'https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/main.min.js'
                CssLink = 'https://cdn.jsdelivr.net/npm/fullcalendar@5.1.0/main.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\fullCalendar.css"
                JS      = "$PSScriptRoot\..\Resources\JS\fullCalendar.js"
            }
        }
        HideSection          = @{
            Comment      = 'Hide Section Code'
            HeaderAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\HideSection.js"
            }
        }
        FancyTree            = @{
            Header = @{
                JSLink  = @(
                    'https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.33.0/jquery.fancytree-all-deps.min.js'
                )
                CSSLink = @(
                    'https://cdn.jsdelivr.net/npm/jquery.fancytree@2.33/dist/skin-win8/ui.fancytree.min.css'
                )
            }
        }
        JustGage             = @{
            Comment = 'Just Gage Library'
            Header  = @{
                JSLink = @(
                    'https://cdnjs.cloudflare.com/ajax/libs/raphael/2.3.0/raphael.min.js'
                    'https://cdnjs.cloudflare.com/ajax/libs/justgage/1.3.5/justgage.min.js'
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\raphael.min.js"
                    "$PSScriptRoot\..\Resources\JS\justgage.min.js"
                )
            }
        }
        <#
        JsTree                  = @{
            Header = @{
                JSLink = @(
                    'https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js'
                )
                CSSLink = @(
                    'https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css'
                )
                JS = @(
                    "$PSScriptRoot\..\Resources\JS\stree.min.js"
                )
                CSS = @(
                    "$PSScriptRoot\..\Resources\CSS\style.min.css"
                )
            }
        }
        #>
        Popper               = @{
            Comment      = 'Popper and Tooltip for FullCalendar'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\popper.css"
            }
            Header       = @{
                JSLink = @(
                    'https://unpkg.com/popper.js/dist/umd/popper.min.js'
                    'https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\popper.js"
                    "$PSScriptRoot\..\Resources\JS\tooltip.js"
                )
            }
        }
        <#
        Tabs                 = @{
            Comment              = 'Elastic Tabs'
            HeaderAlways         = @{
                Css = "$PSScriptRoot\..\Resources\CSS\tabs-elastic.css"
            }
            FooterAlways         = @{
                JS = "$PSScriptRoot\..\Resources\JS\tabs-elastic.js"
            }
            CustomActionsReplace = @{
                'ColorSelector' = ConvertFrom-Color -Color "DodgerBlue"
                'ColorTarget'   = ConvertFrom-Color -Color "MediumSlateBlue"
            }
        }
        #>
        Tabbis               = @{
            Comment      = 'Elastic Tabbis'
            HeaderAlways = @{
                #Css       = "$PSScriptRoot\..\Resources\CSS\tabbis.css"
                CssInline = [ordered] @{
                    ".tabsWrapper"         = [ordered]@{
                        'text-align'     = 'center'
                        #'margin'         = "10px auto"
                        'font-family'    = "'Roboto', sans-serif !important"
                        'text-transform' = 'uppercase'
                        'font-size'      = '15px'
                    }
                    '[data-tabs]'          = [ordered]@{
                        'display'         = 'flex'
                        #'margin-top'      = '10px'
                        'margin'          = '5px 5px 5px 5px'
                        'padding'         = '0px'
                        'box-shadow'      = '0px 5px 20px rgba(0, 0, 0, 0.1)'
                        'border-radius'   = '5px'
                        'justify-content' = 'center'
                        'flex-wrap'       = 'wrap'
                    }
                    # https://css-tricks.com/snippets/css/a-guide-to-flexbox/
                    '[data-tabs]>*'        = [ordered]@{
                        'cursor'      = 'pointer'
                        'padding'     = '10px 20px'
                        'flex-grow'   = 1
                        'flex-shrink' = 1
                        'flex-basis'  = 'auto'
                    }
                    '[data-tabs] .active'  = [ordered]@{
                        'background'    = '#1e90ff' # DodgerBlue
                        'color'         = '#fff'
                        'border-radius' = '5px'
                    }
                    '[data-panes]>*'       = [ordered]@{
                        'display' = 'none'
                    }
                    '[data-panes]>.active' = [ordered]@{
                        'display' = 'block'
                    }
                }
            }
            FooterAlways = @{
                JS = @(
                    "$PSScriptRoot\..\Resources\JS\tabbis.js"
                    "$PSScriptRoot\..\Resources\JS\tabbisAdditional.js"
                )
            }
        }
        TimeLine             = @{
            Comment      = 'Timeline Simple'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\timeline-simple.css"
            }
        }
        Toasts               = @{
            Comment      = 'Toasts Looking Messages'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\Toasts.css"
            }
        }
        StatusButtonical     = @{
            Comment      = 'Status Buttonical'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\status.css"
            }
        }
        TuiGrid              = @{
            Comment = 'Tui Grid'
            Header  = @{
                Css     = "$PSScriptRoot\..\Resources\CSS\tuigrid.css"
                CssLink = 'https://cdn.jsdelivr.net/npm/tui-grid@3.5.0/dist/tui-grid.css'
            }
        }
        VisNetwork           = @{
            Comment      = 'VIS Network Dynamic, browser based visualization libraries'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\vis-network.diagram.css"
            }
            Header       = @{
                JsLink  = 'https://unpkg.com/vis-network@7.5.2/dist/vis-network.min.js'
                Js      = "$PSScriptRoot\..\Resources\JS\vis-network.min.js"
                Css     = "$PSScriptRoot\..\Resources\CSS\vis-network.min.css"
                CssLink = 'https://unpkg.com/vis-network@7.5.2/dist/vis-network.min.css'
            }
            FooterAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\vis-networkFunctions.js"
            }
        }
    }
}

function Save-Resource {
    [cmdletBinding()]
    param(
        [uri[]] $ResourceLinks,
        [string[]] $Target,
        [ValidateSet('CSS', 'JS')][string] $Type
    )

    $Output = for ($i = 0; $i -lt $ResourceLinks.Count; $i++) {
        if ($Target) {
            # If target given means we replace something
            Write-Verbose "Downloading $($ResourceLinks[$i].OriginalString) to $($Target[$i])"
            Invoke-WebRequest -Uri $ResourceLinks[$i] -OutFile $Target[$i]
            #$Target[$i]
        } else {
            $Splitted = $ResourceLinks[$i].OriginalString -split '/'
            $FileName = $Splitted[ - 1]
            $FilePath = [IO.Path]::Combine('C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Resources', $Type, $FileName)
            $FilePathScriptRoot = -Join ('"', '$PSScriptRoot\..\Resources\', "$Type", '\', $FileName, '"')
            $FilePathScriptRoot
            Invoke-WebRequest -Uri $ResourceLinks[$i] -OutFile $FilePath
        }
    }
    $Output
}

#$Script:CurrentConfiguration = Copy-Dictionary -Dictionary $Script:Configuration

#Save-Resource -ResourceLinks $($Script:Configuration).Features.Fonts.HeaderAlways.JsLink -Type 'JS'
#Save-Resource -ResourceLinks $($Script:Configuration).Features.Fonts.HeaderAlways.CssLink -Type 'CSS'

#Save-Resource -ResourceLinks $($Script:Configuration).Features.DataTables.Header.JsLink -Type 'JS'
#Save-Resource -ResourceLinks $($Script:Configuration).Features.DataTables.Header.CssLink -Type 'CSS'

#Save-Resource -ResourceLinks $($Script:Configuration).Features.VisNetwork.Header.JsLink -Type 'JS'
#Save-Resource -ResourceLinks $($Script:Configuration).Features.VisNetwork.Header.CssLink -Type 'CSS'

#Save-Resource -ResourceLinks $($Script:Configuration).Features.FontsAwesome.HeaderAlways.JsLink -Type 'JS'
#Save-Resource -ResourceLinks $($Script:Configuration).Features.FontsAwesome.HeaderAlways.CssLink -Type 'CSS'

#Save-Resource -ResourceLinks $($Script:Configuration).Features.Jquery.Header.JsLink -Type 'JS'
#Save-Resource -ResourceLinks $($Script:Configuration).Features.Jquery.Header.CssLink -Type 'CSS'
#Save-Resource -ResourceLinks $($Script:Configuration).Features.ChartsApex.Header.JsLink -Type 'JS'
#Save-Resource -ResourceLinks $($Script:Configuration).Features.ChartsApex.Header.CssLink -Type 'CSS'

#Save-Resource -ResourceLinks $($Script:Configuration).Features.JustGage.Header.JsLink -Type 'JS' -Target $($Script:Configuration).Features.JustGage.Header.Js -Verbose
#Save-Resource -ResourceLinks $($Script:Configuration).Features.JustGage.Header.CssLink -Type 'CSS' -Target $($Script:Configuration).Features.JustGage.Header.Css -Verbose