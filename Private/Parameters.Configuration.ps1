$Script:Configuration = [ordered] @{
    Features = [ordered] @{
        Default                 = @{
            Comment      = 'Always Required Default Visual Settings'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\default.css"
            }
        }
        DefaultHeadings         = @{
            Comment      = 'Always Required Default Headings'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\headings.css"
            }
        }
        Accordion               = @{
            Comment      = 'Accordion'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\accordion-1.css"
            }
        }
        CodeBlocks              = @{
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
        ChartsApex              = @{
            Comment      = 'Apex Charts'
            Header       = @{
                JsLink = 'https://cdn.jsdelivr.net/npm/apexcharts@latest'
                JS     = "$PSScriptRoot\..\Resources\JS\apexcharts.min.js"
            }
            HeaderAlways = @{
                #Css = "$PSScriptRoot\..\Resources\CSS\apexcharts.css"
            }
        }
        Jquery                  = @{
            Comment = 'Jquery'
            Header  = @{
                JsLink = 'https://code.jquery.com/jquery-3.3.1.min.js'
                Js     = "$PSScriptRoot\..\Resources\JS\jquery-3.3.1.min.js"
            }
        }
        DataTables              = @{
            Comment      = 'DataTables'
            HeaderAlways = @{
                Css         = "$PSScriptRoot\..\Resources\CSS\datatables.css"
                CssNoscript = "$PSScriptRoot\..\Resources\CSS\datatables.noscript.css"
            }
            Header       = @{
                CssLink = 'https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.18/af-2.3.2/b-1.5.4/b-colvis-1.5.4/b-html5-1.5.4/b-print-1.5.4/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.5.0/r-2.2.2/rg-1.1.0/rr-1.2.4/sc-1.5.0/sl-1.2.6/datatables.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\datatables.min.css"
                JsLink  = "https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.18/af-2.3.2/b-1.5.4/b-colvis-1.5.4/b-html5-1.5.4/b-print-1.5.4/cr-1.5.0/fc-3.2.5/fh-3.1.4/kt-2.5.0/r-2.2.2/rg-1.1.0/rr-1.2.4/sc-1.5.0/sl-1.2.6/datatables.min.js", "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.4/moment.min.js", "https://cdn.datatables.net/plug-ins/1.10.19/sorting/datetime-moment.js"
                JS      = "$PSScriptRoot\..\Resources\JS\datatables.min.js", "$PSScriptRoot\..\Resources\JS\moment.min.js", "$PSScriptRoot\..\Resources\JS\datetime-moment.js"
            }
        }
        DataTablesSearchFade    = @{
            Comment = 'DataTables SearchFade'
            Header  = @{
                CssLink = 'https://cdn.datatables.net/plug-ins/preview/searchFade/dataTables.searchFade.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\datatablesSearchFade.css"
                JsLink  = "https://cdn.datatables.net/plug-ins/preview/searchFade/dataTables.searchFade.min.js"
                JS      = "$PSScriptRoot\..\Resources\JS\datatables.SearchFade.min"
            }
        }

        <# Those links need to be added instead of Datatables as above
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/jquery.dataTables.min.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/autofill/2.3.3/css/autoFill.dataTables.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/colreorder/1.5.0/css/colReorder.dataTables.min.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedcolumns/3.2.5/css/fixedColumns.dataTables.min.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/fixedheader/3.1.4/css/fixedHeader.dataTables.min.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/keytable/2.5.0/css/keyTable.dataTables.min.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.2/css/responsive.dataTables.min.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowgroup/1.1.0/css/rowGroup.dataTables.min.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/rowreorder/1.2.4/css/rowReorder.dataTables.min.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/scroller/2.0.0/css/scroller.dataTables.min.css"/>
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.0/css/select.dataTables.min.css"/>

            <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/autofill/2.3.3/js/dataTables.autoFill.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.colVis.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.html5.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.print.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/colreorder/1.5.0/js/dataTables.colReorder.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.2.5/js/dataTables.fixedColumns.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/fixedheader/3.1.4/js/dataTables.fixedHeader.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/keytable/2.5.0/js/dataTables.keyTable.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.2/js/dataTables.responsive.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/rowgroup/1.1.0/js/dataTables.rowGroup.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/rowreorder/1.2.4/js/dataTables.rowReorder.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/scroller/2.0.0/js/dataTables.scroller.min.js"></script>
            <script type="text/javascript" src="https://cdn.datatables.net/select/1.3.0/js/dataTables.select.min.js"></script>
        #>

        ## Not used yet - START
        DataTablesExperimental  = @{
            Comment = 'DataTables 1.10.19'
            Header  = @{
                JsLink  = 'https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js'
                Js      = ""
                Css     = ""
                CssLink = 'https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css'
            }
        }
        DataTablesColReorder    = @{
            Comment = 'DataTables ColReorder'
            Header  = @{
                JsLink  = 'https://cdn.datatables.net/colreorder/1.5.0/js/dataTables.colReorder.min.js'
                Js      = "$PSScriptRoot\..\Resources\JS\dataTables.colReorder.min.js"
                Css     = "$PSScriptRoot\..\Resources\CSS\colReorder.dataTables.min.css"
                CssLink = 'https://cdn.datatables.net/colreorder/1.5.0/css/colReorder.dataTables.min.css'
            }
        }
        ## Not used yet - END


        DataTablesPDF           = @{
            Comment = 'DataTables PDF Features'
            Header  = @{
                JsLink = 'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js', 'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js'
                Js     = "$PSScriptRoot\..\Resources\JS\pdfmake.min.js", "$PSScriptRoot\..\Resources\JS\vfs_fonts.min.js"
            }
        }
        DataTablesExcel         = @{
            Comment = 'DataTables Excel Features'
            Header  = @{
                JsLink = 'https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js'
                JS     = "$PSScriptRoot\..\Resources\JS\jszip.min.js"
            }
        }
        DataTablesSimplify      = @{
            Comment      = 'DataTables (not really) - Simplified'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\datatables.simplify.css"
            }
        }
        D3Mitch                 = @{
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
        Fonts                   = @{
            Comment      = 'Default fonts'
            HeaderAlways = @{
                CssLink = 'https://fonts.googleapis.com/css?family=Roboto|Hammersmith+One|Questrial|Oswald'
            }
        }
        FontsAwesome            = @{
            Comment      = 'Default fonts icons'
            HeaderAlways = @{
                CssLink = 'https://use.fontawesome.com/releases/v5.11.2/css/all.css'
            }
            Other        = @{
                Link = 'https://use.fontawesome.com/releases/v5.11.2/svgs/'
            }
        }
        FullCalendar            = @{
            Comment      = 'FullCalendar Basic'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\calendar.css"
            }
        }
        FullCalendarCore        = @{
            Comment = 'FullCalendar Core'
            Header  = @{
                CssLink = 'https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.3.1/main.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\fullCalendarCore.css"
                JSLink  = 'https://cdn.jsdelivr.net/npm/@fullcalendar/core@4.3.1/main.min.js'
                JS      = "$PSScriptRoot\..\Resources\JS\fullCalendarCore.js"
            }

        }
        FullCalendarDayGrid     = @{
            Comment = 'FullCalendar DayGrid'
            Header  = @{
                CssLink = 'https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4.3.0/main.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\fullCalendarDayGrid.css"
                JSLink  = 'https://cdn.jsdelivr.net/npm/@fullcalendar/daygrid@4.3.0/main.min.js'
                JS      = "$PSScriptRoot\..\Resources\JS\fullCalendarDayGrid.js"
            }

        }
        FullCalendarInteraction = @{
            Comment = 'FullCalendar Interaction'
            Header  = @{
                JSLink = 'https://cdn.jsdelivr.net/npm/@fullcalendar/interaction@4.3.0/main.min.js'
                JS     = "$PSScriptRoot\..\Resources\JS\FullCalendarInteraction.js"
            }

        }
        FullCalendarList        = @{
            Comment = 'FullCalendar List'
            Header  = @{
                CssLink = 'https://cdn.jsdelivr.net/npm/@fullcalendar/list@4.3.0/main.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\fullCalendarList.css"
                JSLink  = 'https://cdn.jsdelivr.net/npm/@fullcalendar/list@4.3.0/main.min.js'
                JS      = "$PSScriptRoot\..\Resources\JS\fullCalendarList.js"
            }

        }
        FullCalendarRRule       = @{
            Comment = 'FullCalendar RRule'
            Header  = @{
                JSLink = 'https://cdn.jsdelivr.net/npm/@fullcalendar/rrule'
                JS     = "$PSScriptRoot\..\Resources\JS\fullCalendarRRule.js"
                #https://cdn.jsdelivr.net/npm/@fullcalendar/rrule@4.3.0/main.min.js
            }
        }
        FullCalendarTimeGrid    = @{
            Comment = 'FullCalendar TimeGrid'
            Header  = @{
                CssLink = 'https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@4.3.0/main.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\fullCalendarTimeGrid.css"
                JSLink  = 'https://cdn.jsdelivr.net/npm/@fullcalendar/timegrid@4.3.0/main.min.js'
                JS      = "$PSScriptRoot\..\Resources\JS\fullCalendarTimeGrid.js"
            }
        }
        FullCalendarTimeLine    = @{
            Comment = 'FullCalendar TimeLine'
            Header  = @{
                CssLink = 'https://cdn.jsdelivr.net/npm/@fullcalendar/timeline@4.3.0/main.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\fullCalendarTimeLine.css"
                JSLink  = 'https://cdn.jsdelivr.net/npm/@fullcalendar/timeline@4.3.0/main.min.js'
                JS      = "$PSScriptRoot\..\Resources\JS\fullCalendarTimeLine.js"
            }

        }
        HideSection             = @{
            Comment      = 'Hide Section Code'
            HeaderAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\HideSection.js"
            }
        }
        Popper                  = @{
            Comment      = 'Popper and Tooltip for FullCalendar'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\popper.css"
            }
            Header       = @{
                JSLink = @(
                    'https://unpkg.com/popper.js/dist/umd/popper.min.js'
                    'https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'
                )
                JS = @(
                    "$PSScriptRoot\..\Resources\JS\popper.js"
                    "$PSScriptRoot\..\Resources\JS\tooltip.js"
                )
            }
        }
        Tabs                    = @{
            Comment              = 'Elastic Tabs'
            HeaderAlways         = @{
                Css = "$PSScriptRoot\..\Resources\CSS\tabs-elastic.css"
            }
            FooterAlways         = @{
                JS = "$PSScriptRoot\..\Resources\JS\tabs-elastic.js"
            }
            CustomActionsReplace = @{
                'ColorSelector' = ConvertFrom-Color -Color ("DodgerBlue")
                'ColorTarget'   = ConvertFrom-Color -Color ("MediumSlateBlue")
            }
        }
        Tabbis                  = @{
            Comment              = 'Elastic Tabbis'
            HeaderAlways         = @{
                Css = "$PSScriptRoot\..\Resources\CSS\tabbis.css"
            }
            FooterAlways         = @{
                JS = @(
                    "$PSScriptRoot\..\Resources\JS\tabbis.js"
                    "$PSScriptRoot\..\Resources\JS\tabbisAdditional.js"
                )
            }
            CustomActionsReplace = @{
                'ColorSelector' = ConvertFrom-Color -Color ("DodgerBlue")
                'ColorTarget'   = ConvertFrom-Color -Color ("MediumSlateBlue")
            }
        }
        TabbisGradient          = @{
            Comment              = 'Elastic Tabs Gradient'
            FooterAlways         = @{
                Css = "$PSScriptRoot\..\Resources\CSS\tabs-elastic.gradient.css"
            }
            CustomActionsReplace = @{
                'ColorSelector' = ConvertFrom-Color -Color ("DodgerBlue")
                'ColorTarget'   = ConvertFrom-Color -Color ("MediumSlateBlue")
            }
        }
        TabbisTransition        = @{
            Comment      = 'Elastic Tabs Transition'
            FooterAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\tabs-elastic.transition.css"
            }
        }
        TimeLine                = @{
            Comment      = 'Timeline Simple'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\timeline-simple.css"
            }
        }
        Toasts                  = @{
            Comment      = 'Toasts Looking Messages'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\Toasts.css"
            }
        }
        StatusButtonical        = @{
            Comment      = 'Status Buttonical'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\status.css"
            }
        }
        TuiGrid                 = @{
            Comment = 'Tui Grid'
            Header  = @{
                Css     = "$PSScriptRoot\..\Resources\CSS\tuigrid.css"
                CssLink = 'https://cdn.jsdelivr.net/npm/tui-grid@3.5.0/dist/tui-grid.css'
            }
        }
        VisNetwork              = @{
            Comment      = 'VIS Network Dynamic, browser based visualization libraries'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\vis-network.diagram.css"
            }
            Header       = @{
                JsLink  = 'https://unpkg.com/vis-network@latest/dist/vis-network.min.js'
                Js      = "$PSScriptRoot\..\Resources\JS\vis-network.min.js"
                Css     = "$PSScriptRoot\..\Resources\CSS\vis-network.min"
                CssLink = 'https://unpkg.com/vis-network@latest/dist/vis-network.min.css'
            }
            FooterAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\vis-networkFunctions.js"
            }
        }
    }
}