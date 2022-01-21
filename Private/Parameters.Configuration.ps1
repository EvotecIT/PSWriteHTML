$Script:ConfigurationURL = 'https://cdn.jsdelivr.net/gh/evotecit/cdn@0.0.13'
$Script:Configuration = [ordered] @{
    Features = [ordered] @{
        Inject                      = @{
            HeaderAlways = @{
                CssInline = [ordered] @{}
            }
            Default      = $true
            Email        = $false
        }
        Fonts                       = @{
            Comment      = 'Default fonts'
            HeaderAlways = @{
                #CssLink = 'https://fonts.googleapis.com/css?family=Roboto|Hammersmith+One|Questrial|Oswald'
                #CssLink = 'https://fonts.googleapis.com/css?family=Roboto'
                CssLink = 'https://fonts.googleapis.com/css2?family=Roboto+Condensed&display=swap'
            }
            Default      = $true
            Email        = $false
        }
        FontsAwesome                = @{
            Comment         = 'Fonts Awesome icons'
            InternalComment = 'font-awesome'
            Header          = @{
                CssLink = 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\fontsAwesome.min.css"
            }
            Other           = @{
                Link = 'https://use.fontawesome.com/releases/v5.15.3/svgs/'
            }
            Default         = $true
            Email           = $false
            License         = 'SIL OFL 1.1 License'
        }
        FontsMaterialIcon           = @{
            Comment         = 'Material Design Iconic Font and CSS toolkit'
            InternalComment = 'font-materialicon'
            Demos           = 'http://zavoloklom.github.io/material-design-iconic-font/examples.html'
            Header          = @{
                CssLink = 'https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\fontsMaterialDesignIconic.min.css"
            }
            Default         = $true
            Email           = $false
            License         = 'SIL OFL 1.1'
        }
        FontsSimpleIcons            = @{
            Comment         = 'Font Simple Icons'
            InternalComment = 'font-simple-icons'
            Header          = @{
                CssLink = 'https://cdn.jsdelivr.net/npm/simple-icons-font@4.24.0/font/simple-icons.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\fontsSimpleIcons.min.css"
            }
            Default         = $true
            Email           = $false
            License         = 'CC0-1.0 License'
        }
        AnimateToolkit              = @{
            Comment         = 'Animation Toolkit'
            InternalComment = 'animation-toolkit'
            Header          = @{
                CssLink = "https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
                Css     = "$PSScriptRoot\..\Resources\CSS\animate.min.css"
            }
            Default         = $true
            Email           = $false
            License         = 'MIT'
        }
        Main                        = [ordered]@{
            HeaderAlways = [ordered]@{
                CssInline = [ordered]@{
                    'body'          = [ordered]@{
                        # https://fonts.google.com/analytics
                        # https://web3canvas.com/best-fonts-for-web-designers/
                        #   font-family: "Raleway", sans-serif;
                        #'font-family' = 'Roboto Condensed, Helvetica Neue, sans-serif'
                        'font-family' = "'Roboto Condensed', sans-serif"
                        'font-size'   = '8pt'
                        'margin'      = '0px'
                    }
                    'input'         = @{
                        'font-size' = '8pt'
                    }
                    '.main-section' = @{
                        'margin-top' = '0px'
                    }
                    #'table'          = @{
                    #'font-size' = '8pt'
                    #}
                    #'.defaultHeader' = [ordered]@{
                    #    'padding'     = '5px'
                    #    'margin'      = '0px 0px 0px 0px'
                    #    'font-weight' = 'bold'
                    #}
                    #'.defaultFooter' = [ordered]@{
                    #    'padding-right' = '5em'
                    #    'text-align'    = 'right'
                    #}
                    #'.container'     = [ordered]@{
                    #    'padding' = '2px 16px'
                    #}
                    #'.header'        = [ordered]@{
                    #    'background-color' = '#616a6b'
                    #    'color'            = '#f7f9f9'
                    #}
                    #'hr'    = [ordered]@{
                    #    'height'           = '4px'
                    #    'background-color' = '#6Cf'
                    #    'border'           = '0px'
                    #    'width'            = '100%'
                    #}
                    #'.card:hover' = [ordered]@{
                    #    'box-shadow' = '0 8px 16px 0 rgba(0, 0, 0, 0.2)'
                    #}
                    #'.col'        = [ordered]@{
                    #    'padding' = '20px'
                    #    'margin'  = '1%'
                    #    'flex'    = '1'
                    #}
                }
            }
            Default      = $true
            Email        = $false
        }
        MainFlex                    = [ordered] @{
            HeaderAlways = [ordered] @{
                CssInline = [ordered]@{
                    '.overflowHidden'      = [ordered] @{
                        'overflow'   = 'hidden'
                        'overflow-x' = 'hidden'
                        'overflow-y' = 'hidden'
                    }
                    '.flexParent'          = [ordered]@{
                        'display'         = 'flex'
                        'justify-content' = 'space-between'
                        #'padding'         = '2px'
                    }
                    '.flexParentInvisible' = [ordered]@{
                        'display'         = 'flex'
                        'justify-content' = 'space-between'
                    }
                    '.flexElement'         = [ordered]@{
                        'flex-basis' = '100%'
                        'max-width'  = '100%'
                    }
                    '.flexPanel'           = [ordered]@{
                        'flex-basis' = '100%'
                        'max-width'  = '100%'
                    }
                    '.flex-grid'           = [ordered]@{
                        'display' = 'flex'
                    }
                }
            }
            Default      = $true
            Email        = $false
        }
        <# Doesn't seem to be in use
        MainLink                = [ordered]@{
            HeaderAlways = [ordered] @{
                CssInline = [ordered]@{
                    'a.alink:link'      = [ordered]@{
                        'color'           = '#007bff'
                        'text-decoration' = 'none'
                        'font-size'       = '120%'
                    }
                    'a.alink:visited'   = [ordered]@{
                        'color'           = '#ff8400'
                        'text-decoration' = 'none'
                        'font-size'       = '120%'
                    }
                    'a.alink:hover'     = [ordered]@{
                        'text-decoration' = 'underline'
                        'font-size'       = '130%'
                    }
                    'a.paginate_button' = [ordered]@{
                        'color'     = '#000000 !important'
                        'font-size' = '10px'
                    }
                    'a.current'         = [ordered]@{
                        'color' = '#000000 !important'
                    }
                }
            }
        }
        #>
        MainImage                   = [ordered]@{
            HeaderAlways = [ordered] @{
                CssInline = [ordered]@{
                    '.legacyLogo'      = [ordered]@{
                        'display' = 'flex'
                    }
                    '.legacyLeftLogo'  = [ordered]@{
                        'flex-basis'     = '100%'
                        'border'         = '0px'
                        'padding-left'   = '0px'
                        'vertical-align' = 'middle'
                    }
                    '.legacyRightLogo' = [ordered]@{
                        'flex-basis'     = '100%'
                        'border'         = '0px'
                        'padding-right'  = '5em'
                        'text-align'     = 'right'
                        'vertical-align' = 'middle'
                    }
                    '.legacyImg'       = [ordered]@{
                        'border-radius' = '5px 5px 0 0'
                    }
                }
            }
            Default      = $true
            Email        = $false
        }
        <#
        Default                 = @{
            Comment      = 'Always Required Default Visual Settings'
            HeaderAlways = @{
                CssInline = [ordered] @{
                    # Workaround for IE 11
                    '@media all and (-ms-high-contrast:active)' = @{
                        '.defaultSection' = @{
                            'display' = 'flex'
                        }
                    }
                    '.defaultSection'                           = [ordered] @{
                        #'display'        = 'flex' # added to allow diagram to resize properly
                        'flex-direction' = 'column' # added to allow diagram to resize properly
                        #'flex-direction' = 'default' # added to allow diagram to resize properly
                        'border'         = '1px solid #bbbbbb'
                        'padding-bottom' = '0px'
                        'margin'         = '5px'
                        'width'          = 'calc(100% - 10px)'
                        'box-shadow'     = '0 4px 8px 0 rgba(0, 0, 0, 0.2)'
                        'transition'     = '0.3s'
                        'border-radius'  = '5px'
                    }
                    '.defaultSectionHead'                       = [ordered] @{
                        'display'          = 'flex'
                        'justify-content'  = 'center'
                        'padding'          = '5px'
                        'margin'           = '0px 0px 0px 0px'
                        'font-weight'      = 'bold'
                        "background-color" = ConvertFrom-Color -Color "DeepSkyBlue"
                        'color'            = ConvertFrom-Color -Color "White"
                    }
                    '.defaultSectionText'                       = [ordered] @{
                        "text-align" = 'center'
                    }
                    #'.defaultSectionContent'                    = [ordered] @{
                    #'padding-top'   = '5px'
                    #'padding-right' = '5px'
                    #'padding-left'  = '5px'
                    #'padding' = '5px'
                    #}
                    '.defaultPanel'                             = [ordered] @{
                        'box-shadow'    = '0 4px 8px 0 rgba(0, 0, 0, 0.2)'
                        'transition'    = '0.3s'
                        'border-radius' = '5px'
                        'margin'        = '5px'
                    }
                    #'.defaultText'                              = [ordered] @{
                    #    'margin' = '5px'
                    #}
                }
                # We want email to have no margins
                # CssInlineNoScript = @{
                #     '.defaultText' = [ordered] @{
                #         'margin' = '0px !important'
                #    }
                # }
            }
        }
        #>
        DefaultImage                = @{
            Comment      = 'Image Style'
            HeaderAlways = @{
                CssInline = [ordered] @{
                    '.logo' = [ordered] @{
                        'margin' = '5px'
                    }
                }
                # We want email to have no margins
                #CssInlineNoScript = @{
                #    '.logo' = [ordered] @{
                #        'margin' = '0px !important'
                #    }
                #}
            }
            Default      = $true
            Email        = $true
        }
        DefaultPanel                = @{
            Comment      = 'Panel Style'
            HeaderAlways = @{
                CssInline = [ordered] @{
                    '.defaultPanel' = [ordered] @{
                        'box-shadow'    = '0 4px 8px 0 rgba(0, 0, 0, 0.2)'
                        'transition'    = '0.3s'
                        'border-radius' = '5px'
                        'margin'        = '5px'
                    }
                }
            }
            Default      = $true
            Email        = $false
        }
        DefaultSection              = @{
            Comment      = 'Section Style'
            HeaderAlways = @{
                CssInline = [ordered] @{
                    # Workaround for IE 11
                    '@media all and (-ms-high-contrast:active)' = @{
                        '.defaultSection' = @{
                            'display' = 'flex'
                        }
                    }
                    '.defaultSection'                           = [ordered] @{
                        #'display'        = 'flex' # added to allow diagram to resize properly
                        'flex-direction' = 'column' # added to allow diagram to resize properly
                        #'flex-direction' = 'default' # added to allow diagram to resize properly
                        'border'         = '1px solid #bbbbbb'
                        'padding-bottom' = '0px'
                        'margin'         = '5px'
                        #'width'          = 'calc(100% - 10px)'
                        'box-shadow'     = '0 4px 8px 0 rgba(0, 0, 0, 0.2)'
                        'transition'     = '0.3s'
                        'border-radius'  = '5px'
                    }
                    '.defaultSectionHead'                       = [ordered] @{
                        'display'          = 'flex'
                        'justify-content'  = 'center'
                        'padding'          = '5px'
                        'margin'           = '0px 0px 0px 0px'
                        'font-weight'      = 'bold'
                        "background-color" = ConvertFrom-Color -Color "DeepSkyBlue"
                        'color'            = ConvertFrom-Color -Color "White"
                    }
                    #'.defaultSectionContent'                    = [ordered] @{
                    #'padding-top'   = '5px'
                    #'padding-right' = '5px'
                    #'padding-left'  = '5px'
                    #'padding' = '5px'
                    #}
                }
            }
            Default      = $true
            Email        = $false
        }
        DefaultHeadings             = @{
            Comment      = 'Heading Style'
            HeaderAlways = @{
                CssInline = [ordered] @{
                    'h1' = [ordered] @{
                        'margin' = '5px'
                    }
                    'h2' = [ordered] @{
                        'margin' = '5px'
                    }
                    'h3' = [ordered] @{
                        'margin' = '5px'
                    }
                    'h4' = [ordered] @{
                        'margin' = '5px'
                    }
                    'h5' = [ordered] @{
                        'margin' = '5px'
                    }
                    'h6' = [ordered] @{
                        'margin' = '5px'
                    }
                }
                # We want email to have no margins
                # CssInlineNoScript = @{
                # 'h1' = [ordered] @{
                # 'margin' = '0px !important'
                # }
                # 'h2' = [ordered] @{
                # 'margin' = '0px !important'
                # }
                # 'h3' = [ordered] @{
                # 'margin' = '0px !important'
                # }
                # 'h4' = [ordered] @{
                # 'margin' = '0px !important'
                # }
                # 'h5' = [ordered] @{
                # 'margin' = '0px !important'
                # }
                # 'h6' = [ordered] @{
                # 'margin' = '0px !important'
                # }
                # }
            }
            Default      = $true
            Email        = $true
        }
        DefaultText                 = @{
            Comment      = 'Text Style'
            HeaderAlways = @{
                CssInline = [ordered] @{
                    '.defaultText' = [ordered] @{
                        'margin' = '5px'
                    }
                }
                # We want email to have no margins
                #CssInlineNoScript = @{
                #    '.defaultText' = [ordered] @{
                #        'margin' = '0px !important'
                #        #'background' = 'red'
                #    }
                #}
            }
            Default      = $true
            Email        = $true
        }
        EmailLayout                 = @{
            Comment      = 'EmailLayout'
            HeaderAlways = @{
                CssInLine = @{
                    '.layoutTable'                              = @{
                        'border'          = 'none'
                        'border-collapse' = 'collapse'
                        'vertical-align'  = 'top'
                        'padding'         = 0
                        'margin'          = 0
                        'border-spacing'  = '0px'
                    }
                    '.layoutTableRow'                           = @{
                        'border'          = 'none'
                        'border-collapse' = 'collapse'
                        'vertical-align'  = 'top'
                        'padding'         = 0
                        'margin'          = 0
                        'border-spacing'  = '0px'
                    }
                    '.layoutTableColumn'                        = @{
                        'border'          = 'none'
                        'border-collapse' = 'collapse'
                        'vertical-align'  = 'top'
                        'padding'         = 0
                        'margin'          = 0
                        'border-spacing'  = '0px'
                    }
                    'img'                                       = @{
                        'width'   = '100%';
                        'display' = 'block';
                    }
                    '.wrapper'                                  = @{
                        'padding-left'  = '10px';
                        'padding-right' = '10px';
                    }
                    '@media only screen and (max-width: 620px)' = @{
                        '.wrapper .section' = @{
                            'width' = '100%'
                        }
                        '.wrapper .column'  = @{
                            'width'   = '100%'
                            'display' = 'block'
                        }
                    }
                }
            }
            Default      = $false
            Email        = $true
        }
        AccordionFAQ                = @{
            Comment      = 'Accordion FAQ'
            Header       = @{
                CssLink = 'https://unpkg.com/accordion-js@3.0.0/dist/accordion.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\accordion.min.css"
                JsLink  = 'https://unpkg.com/accordion-js@3.0.0/dist/accordion.min.js'
                JS      = "$PSScriptRoot\..\Resources\JS\accordion.min.js"
            }
            HeaderAlways = @{
                CssInline = @{
                    '.accordion-container' = @{
                        margin  = '5px'
                        padding = '0px'
                        color   = '#4d5974'

                    }
                    '.ac'                  = @{
                        # 'border-style' = 'none'
                    }
                    '.ac-header'           = @{
                        #border = 'none' # '1px solid #03b5d2'
                        #'border-style' = 'none'
                    }
                    '.ac-panel'            = @{
                        #border = 'none'
                        #'border-style' = 'none'

                    }
                }
            }
            Default      = $true
            Email        = $false
        }
        AccordionSummary            = @{
            Comment     = 'Accordion Summary'
            Internal    = $true
            Header      = @{
                CssLink = "$($Script:ConfigurationURL)/CSS/accordionSummary.min.css"
                Css     = "$PSScriptRoot\..\Resources\CSS\accordionSummary.css"
                JsLink  = "$($Script:ConfigurationURL)/JS/accordionSummary.min.js"
                JS      = "$PSScriptRoot\..\Resources\JS\accordionSummary.js"
            }
            # HeaderAlways = @{
            #     CssInline = @{

            #     }
            #     Css       = "$PSScriptRoot\..\Resources\CSS\accordionSummary.css"
            #     JS        = "$PSScriptRoot\..\Resources\JS\accordionSummary.js"
            # }
            LicenseLink = ''
            License     = ''
            SourceCodes = 'https://codepen.io/banik/pen/exjLzB'
            Default     = $true
            Email       = $false
        }
        CarouselKineto              = @{
            Comment      = 'Kineto JS Library'
            Header       = @{
                CssLinkOriginal = 'https://cdn.jsdelivr.net/gh/findawayer/kineto@main/dist/kineto.css'
                CssLink         = "$($Script:ConfigurationURL)/CSS/kineto.min.css" #, "$($Script:ConfigurationURL)/CSS/kinetoStyle.min.css"
                Css             = "$PSScriptRoot\..\Resources\CSS\kineto.min.css" #, "$PSScriptRoot\..\Resources\CSS\kinetoStyle.css"
            }
            HeaderAlways = @{
                Css       = "$PSScriptRoot\..\Resources\CSS\kinetoStyle.css"
                CssInLine = [ordered]@{
                    '.slide' = [ordered] @{
                        # height = '300px'
                    }
                }
            }
            Body         = @{
                JSLinkOriginal = "https://cdn.jsdelivr.net/gh/findawayer/kineto@main/dist/kineto.js"
                JSLink         = "$($Script:ConfigurationURL)/JS/kineto.min.js"
                JS             = "$PSScriptRoot\..\Resources\JS\kineto.min.js"
            }
            LicenseLink  = 'https://github.com/findawayer/kineto/blob/main/LICENSE'
            License      = 'MIT'
            SourceCodes  = 'https://github.com/findawayer/kineto'
            Default      = $true
            Email        = $false
        }
        CarouselSlick               = @{
            Comment     = 'Slick JS'
            Header      = @{
                CssLink = 'https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css', 'https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\slick.min.css"
                JSLink  = 'https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js'
                JS      = "$PSScriptRoot\..\Resources\JS\slick.min.css"
            }
            LicenseLink = 'https://github.com/kenwheeler/slick/blob/main/LICENSE'
            License     = 'MIT'
            SourceCodes = 'https://github.com/kenwheeler/slick/'
            Default     = $true
            Email       = $false
        }
        CodeBlocks                  = @{
            Comment      = 'EnlighterJS CodeBlocks'
            Header       = @{
                CssLink = 'https://cdn.jsdelivr.net/npm/enlighterjs@3.4.0/dist/enlighterjs.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\enlighterjs.min.css"
                JsLink  = 'https://cdn.jsdelivr.net/npm/enlighterjs@3.4.0/dist/enlighterjs.min.js'
                JS      = "$PSScriptRoot\..\Resources\JS\enlighterjs.min.js"
            }
            Footer       = @{

            }
            HeaderAlways = @{
                #Css       = "$PSScriptRoot\..\Resources\CSS\enlighterjs.css"
                CssInline = @{
                    'div.enlighter-default' = @{
                        'flex-basis'    = '100%'
                        'margin'        = '5px'
                        'border-radius' = '0px'
                    }
                }
            }
            FooterAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\enlighterjs-footer.js"
            }
            LicenseLink  = 'https://github.com/EnlighterJS/EnlighterJS/blob/master/LICENSE.txt'
            License      = 'Mozilla Public License 2.0'
            SourceCodes  = 'https://github.com/EnlighterJS/EnlighterJS'
            Default      = $true
            Email        = $false
        }
        CodeBlocksHighlight         = @{
            # future / possible use case # https://highlightjs.org/static/demo/
            Comment     = 'HighlightJS CodeBlocks'
            Header      = @{
                CssLink = 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.2/styles/default.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\highlight.min.css"
                JsLink  = 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.2/highlight.min.js'
                JS      = "$PSScriptRoot\..\Resources\JS\highlight.min.js"
            }
            License     = 'BSD 3-Clause "New" or "Revised" License'
            LicenseLink = 'https://github.com/highlightjs/highlight.js/blob/master/LICENSE'
            SourceCodes = 'https://github.com/highlightjs/highlight.js'
            Default     = $true
            Email       = $false
        }
        ChartsApex                  = @{
            Comment = 'Apex Charts'
            Header  = @{
                JsLink = @(
                    'https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.min.js' # If you need to make it work with IE11, you need to include these polyfills before including ApexCharts
                    'https://cdn.jsdelivr.net/npm/eligrey-classlist-js-polyfill@1.2.20180112/classList.min.js' # If you need to make it work with IE11, you need to include these polyfills before including ApexCharts
                    'https://cdn.jsdelivr.net/npm/findindex_polyfill_mdn@1.0.0/findIndex.min.js' # You will need this only if you require timeline/rangebar charts
                    #'https://unpkg.com/canvg@3.0.4/lib/umd.js' # You will need this only if you require PNG download of your charts
                    'https://cdn.jsdelivr.net/npm/apexcharts@3.27.0/dist/apexcharts.min.js'
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\polyfill.min.js"
                    "$PSScriptRoot\..\Resources\JS\classList.min.js"
                    "$PSScriptRoot\..\Resources\JS\findIndex.min.js"
                    #"$PSScriptRoot\..\Resources\JS\umd.min.js"
                    "$PSScriptRoot\..\Resources\JS\apexcharts.min.js"
                )
            }
            Default = $true
            Email   = $false
        }
        ChartsEvents                = [ordered] @{
            HeaderAlways = @{
                Js        = "$PSScriptRoot\..\Resources\JS\apexchartsEvents.js"
                JsInLine  = "var dataTablesChartsEvents = {}; var count = 0;"
                CssInline = @{
                    'td.highlight' = @{
                        'background-color' = 'yellow';
                    }
                }
            }
            Default      = $true
            Email        = $false
        }
        ChartsOrg                   = [ordered] @{
            Comment      = 'OrgChart'
            Header       = @{
                CssLink = 'https://cdnjs.cloudflare.com/ajax/libs/orgchart/3.1.0/css/jquery.orgchart.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\jquery.orgchart.min.css"
                JsLink  = 'https://cdnjs.cloudflare.com/ajax/libs/orgchart/3.1.0/js/jquery.orgchart.min.js'
                Js      = "$PSScriptRoot\..\Resources\JS\jquery.orgchart.min.js"
            }
            HeaderAlways = [ordered] @{
                CssInline = [ordered] @{

                    '.orgchartWrapper' = @{
                        'min-height'    = '420px'
                        'border'        = '1px dashed #aaa'
                        'border-radius' = '0px'
                        'text-align'    = 'center'
                        'margin'        = '5px'
                        #background      = '#fff';

                        'display'       = 'flex'
                        'flex-basis'    = '100%'
                        'overflow'      = 'hidden'
                    }

                    '.orgchart'        = @{
                        'background-image' = 'none'
                        'min-height'       = '420px'
                        'border'           = '1px dashed #aaa'
                        #'border-radius' = '0px'
                        #'text-align'    = 'center'
                        #'margin'        = '5px'
                        'flex-basis'       = '100%'
                    }
                    #".oc-export-btn"   = @{
                    #    'flex-basis' = '100%'
                    #}
                    <#
                    '.orgchart .lines .topLine'   = @{
                        'border-top-width' = '2px'
                        'border-top-style' = 'solid'
                        'border-top-color' = 'blue'
                    }
                    '.orgchart .lines .rightLine' = @{
                        'border-right-width' = '1px'
                        'border-right-style' = 'solid'
                        'border-right-color' = 'blue'
                    }
                    '.orgchart .lines .leftLine'  = @{
                        'border-left-width' = '1px'
                        'border-left-style' = 'solid'
                        'border-left-color' = 'blue'
                    }
                    '.orgchart .lines .downLine'  = @{
                        'background-color' = 'blue'
                    }
                    #>
                }
            }
            Default      = $true
            Email        = $false
            License      = 'MIT'
            LicenseLink  = 'https://github.com/dabeng/OrgChart/blob/master/LICENSE'
            SourceCodes  = 'https://github.com/dabeng/OrgChart'
            Demo         = 'https://codepen.io/collection/AWxGVb/', 'https://dabeng.github.io/OrgChart/'
        }
        ChartsOrgExportPDF          = @{
            Comment = 'OrgChartExport'
            Header  = @{
                JsLink = 'https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js'
                Js     = "$PSScriptRoot\..\Resources\JS\jspdf.min.js"
            }
            Default = $true
            Email   = $false
        }
        ChartsOrgExportPNG          = @{
            Comment = 'OrgChartExport'
            Header  = @{
                JsLink = 'https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.min.js'
                Js     = "$PSScriptRoot\..\Resources\JS\html2canvas.min.js"
            }
            Default = $true
            Email   = $false
        }
        ChartsXkcd                  = @{
            Header      = @{
                JsLink = @(
                    'https://cdn.jsdelivr.net/npm/chart.xkcd@1.1.12/dist/chart.xkcd.min.js'
                )
                Js     = @(
                    "$PSScriptRoot\..\Resources\JS\chart.xkcd.min.js"
                )
            }
            LicenseLink = 'https://github.com/timqian/chart.xkcd/blob/master/LICENSE'
            License     = 'MIT'
            SourceCodes = 'https://github.com/timqian/chart.xkcd'
            Default     = $true
            Email       = $false
        }
        ES6Promise                  = @{
            Comment = 'ES6Promise'
            Header  = @{
                JSLink = "https://cdn.jsdelivr.net/npm/es6-promise@4/dist/es6-promise.auto.min.js"
                Js     = "$PSScriptRoot\..\Resources\JS\es6-promise.auto.min.js"

            }
            Default = $true
            Email   = $false
        }
        Jquery                      = @{
            Comment         = 'Jquery'
            InternalComment = 'jquery'
            Header          = @{
                JsLink = 'https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js' # 'https://code.jquery.com/jquery-3.5.1.min.js'
                Js     = "$PSScriptRoot\..\Resources\JS\jquery.min.js"
            }
            LicenseLink     = 'https://github.com/jquery/jquery/blob/main/LICENSE.txt'
            License         = 'MIT'
            SourceCodes     = 'https://github.com/jquery/jquery'
            Default         = $true
            Email           = $false
        }
        DataTables                  = @{
            Comment      = 'DataTables'
            HeaderAlways = @{
                CssInline   = @{
                    #/* Added to make sure plus logo fits in */
                    'td'                               = @{
                        'height' = '14px'
                    }
                    #/* Button in Table - giving it some colors */
                    <#
                    'td.sorting_1::before'   = @{
                        'background-color' = '#007bff !important'
                    }
                    'td::before'             = @{
                        'background-color' = '#007bff !important'
                    }
                    #>
                    'td::before, td.sorting_1::before' = @{
                        'background-color' = '#007bff !important'
                    }
                    # /* giving some spaces between tables being to close */
                    'div.dataTables_wrapper'           = @{
                        #    'padding' = '10px 10px 10px 10px'
                        'margin' = '5px';
                    }
                    'button.dt-button'                 = @{
                        #'font-size'     = '8pt !important'
                        'color'         = 'blue !important'
                        'border-radius' = '5px'
                        'line-height'   = '1 !important'
                    }
                    #/* Filtering at the bottom */
                    'tfoot input'                      = @{
                        'width'      = '100%'
                        'padding'    = '-3px'
                        'box-sizing' = 'border-box'
                    }
                    #/* Filtering at the top */
                    'thead input'                      = @{
                        'width'      = '100%'
                        'padding'    = '-3px'
                        'box-sizing' = 'border-box'
                    }
                    #'tr:nth-of-type(odd)'  = @{
                    #'background-color' = '#F6F6F5'
                    #'background-color' = 'green'
                    #}

                    # 'tr:nth-of-type(even)' = @{
                    #    'background-color' = 'yellow'
                    #}
                    #'table'                  = @{
                    #'font-size' = '8pt'
                    #}
                    #'th'                     = @{
                    #'font-size' = '8pt'
                    #}
                    #'.dataTables_info'       = @{
                    #/* lower left */
                    #'font-size' = '8pt'
                    #}
                    #'.dataTables_filter'     = @{
                    #'font-size' = '8pt'
                    #}
                }         #= "$PSScriptRoot\..\Resources\CSS\datatables.css"
                CssNoscript = "$PSScriptRoot\..\Resources\CSS\datatables.noscript.css"
                #JsInLine    = "var dataTablesInitializationTracker = {};"
            }
            Header       = @{
                CssLink = @(
                    "https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"
                    "https://cdn.datatables.net/select/1.3.3/css/select.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\dataTables.jquery.min.css"
                    "$PSScriptRoot\..\Resources\CSS\dataTables.select.min.css"
                )
                JsLink  = @(
                    "https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"
                    "https://cdn.datatables.net/select/1.3.3/js/dataTables.select.min.js"
                    "https://cdn.datatables.net/plug-ins/1.10.25/sorting/datetime-moment.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.jquery.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.select.min.js"
                    "$PSScriptRoot\..\Resources\JS\dataTables.datetimeMoment.js"
                )
            }
            Default      = $true
            Email        = $false
        }
        DataTablesEmail             = @{
            Comment      = 'DataTables for use in Email'
            HeaderAlways = @{
                #Css = "$PSScriptRoot\..\Resources\CSS\datatables.noscript.css"
                CssInline = @{
                    'table'          = @{
                        'border-collapse' = 'collapse'
                        'box-sizing'      = 'border-box'
                        'width'           = '100%'
                    }
                    'table td'       = @{
                        'border-width' = '1px'
                        'padding'      = '4px'
                        'text-align'   = 'left'
                        #'border-top'   = '1px solid #ddd'
                        'border'       = '1px solid black'
                    }
                    'table thead th' = @{
                        #'color'= 'white';
                        'text-align'       = 'center';
                        'font-weight'      = 'bold';
                        'padding'          = '4px 17px';
                        #'border-bottom'    = '1px solid #111'
                        'background-color' = 'white'
                        'color'            = 'black'
                        'border'           = '1px solid black'
                    }
                    'table tfoot th' = @{
                        #'color'= 'white'
                        'text-align'       = 'center'
                        'font-weight'      = 'bold'
                        'padding'          = '4px 17px'
                        #'border-top'       = '1px solid #111'
                        'background-color' = 'white'
                        'color'            = 'black'
                        'border'           = '1px solid black'
                    }
                    # not needed as not visible in Email anyways
                    #'table tr:nth-of-type(odd)'  = @{
                    #    'background-color' = '#F6F6F5'
                    #}
                    #'table tr:nth-of-type(even)' = @{
                    #    'background-color' = 'white'
                    #}
                    #'table td, table th'         = @{
                    #    'border' = '1px solid black'
                    #}
                }
            }
            Default      = $false
            Email        = $true
        }
        DataTablesAutoFill          = @{
            Comment = 'DataTables AutoFill Features'
            Header  = @{
                JsLink  = @(
                    "https://cdn.datatables.net/autofill/2.3.7/js/dataTables.autoFill.min.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.autoFill.min.js"
                )
                CssLink = @(
                    "https://cdn.datatables.net/autofill/2.3.7/css/autoFill.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\dataTables.autoFill.min.css"
                )
            }
            Default = $true
            Email   = $false
        }
        DataTablesButtons           = @{
            Comment = 'DataTables Buttons Features'
            Header  = @{
                JsLink  = @(
                    "https://cdn.datatables.net/buttons/1.7.1/js/dataTables.buttons.min.js"
                    #"https://cdn.jsdelivr.net/npm/datatables.net-buttons@1.7.1/js/dataTables.buttons.min.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.buttons.min.js"
                )
                CssLink = @(
                    "https://cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css"
                    #"https://cdn.jsdelivr.net/npm/datatables.net-buttons@1.7.1/css/dataTables.buttons.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\datatables.buttons.min.css"
                )
            }
            Default = $true
            Email   = $false
        }

        DataTablesButtonsHTML5      = @{
            Comment = 'DataTables ButtonsHTML5 Features'
            Header  = @{
                JsLink = @(
                    "https://cdn.datatables.net/buttons/1.7.1/js/buttons.html5.min.js"
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\datatables.buttons.html5.min.js"
                )
            }
            Default = $true
            Email   = $false
        }

        DataTablesButtonsPrint      = @{
            Comment = 'DataTables ButtonsPrint Features'
            Header  = @{
                JsLink = @(
                    "https://cdn.datatables.net/buttons/1.7.1/js/buttons.print.min.js"
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\datatables.buttons.print.min.js"
                )
            }
            Default = $true
            Email   = $false
        }

        DataTablesButtonsPDF        = @{
            Comment = 'DataTables PDF Features'
            Header  = @{
                JsLink = @(
                    'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js'
                    'https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js'
                )
                Js     = @(
                    "$PSScriptRoot\..\Resources\JS\pdfmake.min.js"
                    "$PSScriptRoot\..\Resources\JS\vfs_fonts.min.js"
                )
            }
            Default = $true
            Email   = $false
        }
        DataTablesButtonsExcel      = @{
            Comment = 'DataTables Excel Features'
            Header  = @{
                JsLink = @(
                    'https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js'
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\jszip.min.js"
                )
            }
            Default = $true
            Email   = $false
        }
        DataTablesConditions        = @{
            Comment      = 'DataTables Conditions'
            FooterAlways = @{
                #JsLink = @(
                #    'https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js'
                #)
                JS = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.conditions.js"
                )
            }
            Default      = $true
            Email        = $false
        }
        DataTablesColReorder        = @{
            Comment = 'DataTables ColReorder Features'
            Header  = @{
                JsLink  = @(
                    "https://cdn.datatables.net/colreorder/1.5.4/js/dataTables.colReorder.min.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.colReorder.min.js"
                )
                CssLink = @(
                    "https://cdn.datatables.net/colreorder/1.5.4/css/colReorder.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\dataTables.colReorder.min.css"
                )
            }
            Default = $true
            Email   = $false
        }
        DataTablesFuzzySearch       = @{
            Comment = 'DataTables Fuzzy Search'
            Header  = @{
                JsLinkOriginal = "https://cdn.datatables.net/plug-ins/1.11.1/features/fuzzySearch/dataTables.fuzzySearch.js"
                JsLink         = "$($Script:ConfigurationURL)/JS/dataTables.fuzzySearch.min.js"
                JS             = "$PSScriptRoot\..\Resources\JS\dataTables.fuzzySearch.js"
            }
            Default = $true
            Email   = $false
        }
        DataTablesFixedColumn       = @{
            Comment = 'DataTables Fixed Column Features'
            Header  = @{
                JsLink  = @(
                    "https://cdn.datatables.net/fixedcolumns/3.3.3/js/dataTables.fixedColumns.min.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.fixedColumns.min.js"
                )
                CssLink = @(
                    "https://cdn.datatables.net/fixedcolumns/3.3.3/css/fixedColumns.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\dataTables.fixedColumns.min.css"
                )
            }
            Default = $true
            Email   = $false
        }
        DataTablesFixedHeader       = @{
            Comment      = 'DataTables Fixed Header Features'
            HeaderAlways = @{
                JsInLine = "var dataTablesFixedTracker = {};"
            }
            Header       = @{
                JsLink  = @(
                    "https://cdn.datatables.net/fixedheader/3.1.9/js/dataTables.fixedHeader.min.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.fixedHeader.min.js"
                )
                CssLink = @(
                    "https://cdn.datatables.net/fixedheader/3.1.9/css/fixedHeader.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\dataTables.fixedHeader.min.css"
                )
            }
            Default      = $true
            Email        = $false
        }
        DataTablesKeyTable          = @{
            Comment = 'DataTables KeyTable Features'
            Header  = @{
                JsLink  = @(
                    "https://cdn.datatables.net/keytable/2.6.2/js/dataTables.keyTable.min.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.keyTable.min.js"
                )
                CssLink = @(
                    "https://cdn.datatables.net/keytable/2.6.2/css/keyTable.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\dataTables.keyTable.min.css"
                )
            }
            Default = $true
            Email   = $false
        }
        DataTablesPercentageBars    = @{
            Comment = 'DataTables PercentageBars'
            Header  = @{
                JsLink = @(
                    "https://cdn.datatables.net/plug-ins/1.10.25/dataRender/percentageBars.js"
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.percentageBars.js"
                )
            }
            Default = $true
            Email   = $false
        }
        DataTablesResponsive        = @{
            Comment = 'DataTables Responsive Features'
            Header  = @{
                JsLink  = @(
                    "https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.responsive.min.js"
                )
                CssLink = @(
                    "https://cdn.datatables.net/responsive/2.2.9/css/responsive.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\dataTables.responsive.min.css"
                )
            }
            Default = $true
            Email   = $false
        }
        DataTablesRowGrouping       = @{
            Comment = 'DataTables RowGrouping Features'
            Header  = @{
                JsLink  = @(
                    "https://cdn.datatables.net/rowgroup/1.1.3/js/dataTables.rowGroup.min.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.rowGroup.min.js"
                )
                CssLink = @(
                    "https://cdn.datatables.net/rowgroup/1.1.3/css/rowGroup.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\dataTables.rowGroup.min.css"
                )
            }
            Default = $true
            Email   = $false
        }
        DataTablesRowReorder        = @{
            Comment = 'DataTables RowReorder Features'
            Header  = @{
                JsLink  = @(
                    "https://cdn.datatables.net/rowreorder/1.2.8/js/dataTables.rowReorder.min.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.rowReorder.min.js"
                )
                CssLink = @(
                    "https://cdn.datatables.net/rowreorder/1.2.8/css/rowReorder.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\dataTables.rowReorder.min.css"
                )
            }
            Default = $true
            Email   = $false
        }
        DataTablesScroller          = @{
            Comment = 'DataTables Scroller Features'
            Header  = @{
                JsLink  = @(
                    "https://cdn.datatables.net/scroller/2.0.4/js/dataTables.scroller.min.js"
                )
                JS      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.scroller.min.js"
                )
                CssLink = @(
                    "https://cdn.datatables.net/scroller/2.0.4/css/scroller.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\dataTables.scroller.min.css"
                )
            }
            Default = $true
            Email   = $false
        }
        DataTablesSearchBuilder     = @{
            # https://datatables.net/blog/2020-09-01
            Comment = 'DataTables SearchBuilder'
            Update  = $false
            Header  = @{
                #JSLinkOriginal  = "https://nightly.datatables.net/searchbuilder/js/dataTables.searchBuilder.js"
                JsLink  = "$($Script:ConfigurationURL)/JS/dataTables.searchBuilder.min.js" # "https://cdn.datatables.net/searchbuilder/1.0.1/js/dataTables.searchBuilder.min.js"
                JS      = "$PSScriptRoot\..\Resources\JS\dataTables.searchBuilder.js"
                #CssLinkOriginal = 'https://nightly.datatables.net/searchbuilder/css/searchBuilder.dataTables.css' # 'https://cdn.datatables.net/searchbuilder/1.0.1/css/searchBuilder.dataTables.min.css'
                CssLink = "$($Script:ConfigurationURL)/CSS/dataTables.searchBuilder.min.css" # 'https://cdn.datatables.net/searchbuilder/1.0.1/css/searchBuilder.dataTables.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\dataTables.searchBuilder.css"
            }
            Default = $true
            Email   = $false
        }
        <#
        DataTablesSearchBuilder   = @{
            # https://datatables.net/blog/2020-09-01
            Comment = 'DataTables SearchBuilder'
            Header  = @{
                JsLink  = "https://nightly.datatables.net/searchbuilder/js/dataTables.searchBuilder.js" # "https://cdn.datatables.net/searchbuilder/1.0.1/js/dataTables.searchBuilder.min.js"
                JS      = "$PSScriptRoot\..\Resources\JS\dataTables.searchBuilder.min.js"
                CssLink = 'https://nightly.datatables.net/searchbuilder/css/searchBuilder.dataTables.css' # 'https://cdn.datatables.net/searchbuilder/1.0.1/css/searchBuilder.dataTables.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\dataTables.searchBuilder.min.css"
            }
            Default = $true
            Email   = $false
        }
        #>
        DataTablesSearchFade        = @{
            Comment      = 'DataTables SearchFade'
            HeaderAlways = @{
                CssInline = @{
                    '.notMatched td' = @{
                        'opacity' = 0.2
                    }
                }
            }
            Header       = @{
                JsLink = "https://cdn.datatables.net/plug-ins/preview/searchFade/dataTables.searchFade.min.js"
                JS     = "$PSScriptRoot\..\Resources\JS\datatables.SearchFade.min.js"
            }
            Default      = $true
            Email        = $false
        }
        DataTablesSearchHighlight   = @{
            Comment = 'DataTables SearchHighlight'
            Header  = @{
                JsLinkOriginal = "https://cdn.datatables.net/plug-ins/1.10.25/features/searchHighlight/dataTables.searchHighlight.min.js", 'https://cdn.jsdelivr.net/gh/bartaz/sandbox.js@master/jquery.highlight.js'
                JsLink         = "https://cdn.datatables.net/plug-ins/1.10.25/features/searchHighlight/dataTables.searchHighlight.min.js", "$($Script:ConfigurationURL)/JS/dataTables.searchHighlightRequire.min.js"
                JS             = "$PSScriptRoot\..\Resources\JS\dataTables.searchHighlight.min.js", "$PSScriptRoot\..\Resources\JS\dataTables.searchHighlightRequire.js"
                CSSLink        = 'https://cdn.datatables.net/plug-ins/1.10.25/features/searchHighlight/dataTables.searchHighlight.css'
                CSS            = "$PSScriptRoot\..\Resources\CSS\dataTables.searchHighlight.css"
            }
            Default = $true
            Email   = $false
        }
        DataTablesSearchAlphabet    = @{
            Comment = 'DataTables AlphabetSearch'
            Header  = @{
                #JsLink  = "https://cdn.datatables.net/plug-ins/1.10.22/features/alphabetSearch/dataTables.alphabetSearch.min.js"
                JsLinkOriginal  = "https://cdn.jsdelivr.net/gh/PrzemyslawKlys/Plugins@master/features/alphabetSearch/dataTables.alphabetSearch.js"
                JsLink          = "$($Script:ConfigurationURL)/JS/dataTables.alphabetSearch.min.js"
                JS              = "$PSScriptRoot\..\Resources\JS\dataTables.alphabetSearch.min.js"
                #CSSLink = 'https://cdn.datatables.net/plug-ins/1.10.22/features/alphabetSearch/dataTables.alphabetSearch.css'
                CSSLinkOriginal = 'https://cdn.jsdelivr.net/gh/PrzemyslawKlys/Plugins@master/features/alphabetSearch/dataTables.alphabetSearch.css'
                CSSLink         = "$($Script:ConfigurationURL)/CSS/dataTables.alphabetSearch.min.css"
                CSS             = "$PSScriptRoot\..\Resources\CSS\dataTables.alphabetSearch.css"
            }
            Default = $true
            Email   = $false
        }
        DataTablesSearchPanes       = @{
            Comment      = 'DataTables Search Panes Features'
            Header       = @{
                JsLink  = @(
                    "https://cdn.datatables.net/searchpanes/1.3.0/js/dataTables.searchPanes.min.js"
                )
                Js      = @(
                    "$PSScriptRoot\..\Resources\JS\dataTables.searchPanes.min.js"
                )
                CssLink = @(
                    "https://cdn.datatables.net/searchpanes/1.3.0/css/searchPanes.dataTables.min.css"
                )
                Css     = @(
                    "$PSScriptRoot\..\Resources\CSS\dataTables.searchPanes.min.css"
                )
            }
            HeaderAlways = @{
                CssInline = [ordered] @{
                    ".dtsp-panesContainer" = [ordered]@{
                        'width' = 'unset !important'
                    }
                }
            }
            Default      = $true
            Email        = $false
        }
        DataTablesSearchPanesButton = @{
            Comment      = 'DataTables Search Panes when using button feature'
            HeaderAlways = @{
                CssInline = @{
                    'div.dt-button-collection' = @{
                        'position'      = 'relative'
                        #'position'   = 'fixed'
                        #'width'      = '900px !important'
                        'width'         = 'auto !important'
                        'margin-top'    = '10px !important'
                        'margin-bottom' = '10px !important'
                    }
                }
            }
            Default      = $true
            Email        = $false
        }
        DataTablesSelect            = @{
            Comment = 'DataTables Select'
            Header  = @{
                JsLink  = "https://cdn.datatables.net/select/1.3.3/js/dataTables.select.min.js"
                JS      = "$PSScriptRoot\..\Resources\JS\dataTables.select.min.js"
                CSSLink = 'https://cdn.datatables.net/select/1.3.3/css/select.dataTables.min.css'
                CSS     = "$PSScriptRoot\..\Resources\CSS\select.dataTables.min.css"
            }
            Default = $true
            Email   = $false
        }
        DataTablesSimplify          = @{
            Comment      = 'DataTables (not really) - Simplified'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\datatables.simplify.css"
            }
            Default      = $true
            Email        = $true
        }
        D3Mitch                     = @{
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
                CssInLine = @{
                    ' .hierarchicalTree' = @{
                        width  = '100%'
                        height = '100%'
                    }
                }
            }
            LicenseLink  = 'https://github.com/deltoss/d3-mitch-tree/blob/master/LICENSE'
            License      = 'MIT'
            SourceCodes  = 'https://github.com/deltoss/d3-mitch-tree'
            Default      = $true
            Email        = $false
        }
        FullCalendar                = @{
            Comment      = 'FullCalendar Basic'
            HeaderAlways = @{
                CssInline = @{
                    '.calendarFullCalendar' = @{
                        'flex-basis' = '100%'
                        'margin'     = '5px'
                    }
                }
                JsInLine  = "var calendarTracker = {};"
            }
            Header       = @{
                JSLink  = 'https://cdn.jsdelivr.net/npm/fullcalendar@5.6.0/main.min.js'
                CssLink = 'https://cdn.jsdelivr.net/npm/fullcalendar@5.6.0/main.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\fullCalendar.css"
                JS      = "$PSScriptRoot\..\Resources\JS\fullCalendar.js"
            }
            Default      = $true
            Email        = $false
            LicenseLink  = 'https://github.com/fullcalendar/fullcalendar/blob/master/LICENSE.txt'
            License      = 'MIT'
            SourceCodes  = 'https://github.com/fullcalendar/fullcalendar'
        }
        HideSection                 = [ordered] @{
            Comment      = 'Hide Section Code'
            Internal     = $true
            Header       = @{
                JSLink = "$($Script:ConfigurationURL)/JS/hideSection.min.js"
                JS     = "$PSScriptRoot\..\Resources\JS\hideSection.js"
            }
            HeaderAlways = [ordered] @{
                #JS        = "$PSScriptRoot\..\Resources\JS\hideSection.js"
                CssInline = [ordered] @{
                    '.sectionHide' = @{ # fixes problem with hiding section that are collapsing left/right
                        'width'     = 'auto'
                        'min-width' = '1.4rem'
                    }
                    '.sectionShow' = @{
                        'width' = '100%'
                    }
                }
            }
            Default      = $true
            Email        = $false
        }
        EscapeRegex                 = @{
            Comment      = 'Allows EscapeRegex for diagrams and table events'
            FooterAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\escapeRegex.js"
            }
            Default      = $true
            Email        = $false
        }
        FancyTree                   = @{
            HeaderAlways = @{
                CssInline = @{
                    '.fancyTree' = @{
                        'margin' = '5px'
                    }
                }
            }
            Header       = @{
                JSLink  = @(
                    'https://cdnjs.cloudflare.com/ajax/libs/jquery.fancytree/2.38.0/jquery.fancytree-all-deps.min.js'
                )
                CSSLink = @(
                    'https://cdn.jsdelivr.net/npm/jquery.fancytree@2.38/dist/skin-win8/ui.fancytree.min.css'
                )
            }
            Default      = $true
            Email        = $false
            LicenseLink  = 'https://github.com/mar10/fancytree/blob/master/LICENSE.txt'
            License      = 'MIT'
            SourceCodes  = 'https://github.com/mar10/fancytree'
        }
        Raphael                     = @{
            Comment     = 'Raphaël: Cross-browser vector graphics the easy way'
            Demos       = 'https://dmitrybaranovskiy.github.io/raphael/'
            Header      = @{
                JSLink = @(
                    'https://cdnjs.cloudflare.com/ajax/libs/raphael/2.3.0/raphael.min.js'
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\raphael.min.js"
                )
            }
            License     = 'MIT'
            LicenseLink = 'https://dmitrybaranovskiy.github.io/raphael/license.html'
            SourceCodes = 'https://github.com/DmitryBaranovskiy/raphael/'
            Default     = $true
            Email       = $false
        }
        iFrame                      = @{
            Comment      = 'iFrame'
            Default      = $true
            Email        = $false
            HeaderAlways = [ordered] @{
                CssInline = @{
                    "iframe" = @{
                        'width'     = '1px'
                        'min-width' = '100%'
                    }
                }
            }
        }
        iFrameResizer               = @{
            Comment     = 'iFrame Resizer (iframeSizer.min.js)'
            Demos       = 'http://davidjbradshaw.github.io/iframe-resizer/'

            Header      = @{
                JSLink = @(
                    'https://cdn.jsdelivr.net/gh/davidjbradshaw/iframe-resizer@4.3.2/js/iframeResizer.min.js'
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\iframeResizer.min.js"
                )
            }
            Default     = $true
            Email       = $false
            License     = 'MIT'
            LicenseLink = 'https://github.com/davidjbradshaw/iframe-resizer/blob/master/LICENSE'
            SourceCodes = 'https://github.com/davidjbradshaw/iframe-resizer'
        }
        JustGage                    = @{
            Comment     = 'Just Gage Library'
            Demos       = 'https://toorshia.github.io/justgage'
            Header      = @{
                JSLink = @(
                    'https://cdnjs.cloudflare.com/ajax/libs/justgage/1.4.2/justgage.min.js'
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\justgage.min.js"
                )
            }
            Default     = $true
            Email       = $false
            License     = 'MIT'
            LicenseLink = 'https://github.com/toorshia/justgage/blob/master/LICENSE'
            SourceCodes = 'https://github.com/toorshia/justgage'
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
        Moment                      = @{
            Comment     = 'Momment JS Library'
            Header      = @{
                JSLink = 'https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'
                JS     = "$PSScriptRoot\..\Resources\JS\moment.min.js"
            }
            Library     = 'https://momentjs.com/'
            SourceCodes = 'https://github.com/moment/moment/'
            License     = 'MIT'
            LicenseLink = 'https://github.com/moment/moment/blob/develop/LICENSE'
            Default     = $true
            Email       = $false
        }
        NavigationMenuHS            = @{
            Comment         = 'Navigation HS'
            InternalComment = 'navigation-menu'
            HeaderAlways    = @{
                Css       = "$PSScriptRoot\..\Resources\CSS\jquery.hsmenu.css"
                CssInLine = @{
                    '.hs-menubar'    = @{
                        #background = '#161B22';
                    }
                    '.hs-navigation' = @{

                    }
                }
            }
            FooterAlways    = @{
                Js = "$PSScriptRoot\..\Resources\JS\jquery.hsmenu.js"
            }
            Default         = $true
            Email           = $false
        }
        NavigationMenuDropdown      = @{
            Comment         = 'Navigation Dropdown'
            InternalComment = 'navigation-menu'
            HeaderAlways    = @{
                Css       = "$PSScriptRoot\..\Resources\CSS\jquery.hsmenu-dropdown.css"
                CssInline = @{
                    # PC View
                    "@media only screen and (min-width: 480px)" = @{
                        ".menu-items"   = @{
                            width = '200px'
                        }
                        ".has-child ul" = @{
                            width = '200px'
                        }
                    }
                    # Mobile View
                    "@media only screen and (max-width: 480px)" = @{

                    }
                }
            }
            FooterAlways    = @{
                Js = "$PSScriptRoot\..\Resources\JS\jquery.hsmenu-dropdown.js"
            }
            Default         = $true
            Email           = $false
        }
        NavigationFloat             = @{
            Comment         = 'Navigation Hamburger'
            InternalComment = 'navigation-menu'
            HeaderAlways    = @{
                Css       = "$PSScriptRoot\..\Resources\CSS\jquery.hsmenu-sidepenal.css"
                CssInLine = @{
                    '.penal-trigger'              = @{
                        #'top'        = '20px'
                        #'left'       = '20px'
                        #'background' = '#e41b17'
                    }
                    ".penal-widget.top-header h2" = @{
                        #'color' = '#e41b17'
                    }
                    '.top-header .tagline'        = @{
                        #'color' = '#777';
                    }
                    '.penal-trigger:hover'        = @{
                        #'background' = '#666'
                    }
                }
            }
            FooterAlways    = @{
                Js = "$PSScriptRoot\..\Resources\JS\jquery.hsmenu-sidepenal.js"
            }
            Default         = $true
            Email           = $false
        }
        NavigationMultilevel        = @{
            Comment      = 'Navigation Multilevel'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\jquery.multilevelpushmenu_grey.css"
            }
            Header       = @{
                CssLink = 'https://cdn.jsdelivr.net/gh/adgsm/multi-level-push-menu/jquery.multilevelpushmenu.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\jquery.multilevelpushmenu.min.css"
            }
            Footer       = @{
                Js     = "$PSScriptRoot\..\Resources\JS\jquery.multilevelpushmenu.min.js"
                JSLink = 'https://cdn.jsdelivr.net/gh/adgsm/multi-level-push-menu/jquery.multilevelpushmenu.min.js'
            }
            SourceCodes  = 'https://github.com/adgsm/multi-level-push-menu'
            LicenseLink  = 'https://opensource.org/licenses/mit-license.php'
            License      = 'MIT'
            Default      = $true
            Email        = $false
        }
        SectionScrolling            = @{
            Comment     = 'Section Scrolling'
            Internal    = $true
            Header      = @{
                CssLink = "$($Script:ConfigurationURL)/CSS/sectionScrolling.min.css"
                Css     = "$PSScriptRoot\..\Resources\CSS\sectionScrolling.css"
                JsLink  = "$($Script:ConfigurationURL)/JS/sectionScrolling.min.js"
                JS      = "$PSScriptRoot\..\Resources\JS\sectionScrolling.js"
            }
            # HeaderAlways = @{
            #     CssInline = @{

            #     }
            #     Css       = "$PSScriptRoot\..\Resources\CSS\sectionScrolling.css"
            #     JS        = "$PSScriptRoot\..\Resources\JS\sectionScrolling.js"
            # }
            LicenseLink = ''
            License     = 'https://www.bram.us/2020/01/10/smooth-scrolling-sticky-scrollspy-navigation/'
            SourceCodes = 'https://codepen.io/bramus/pen/ExaEqMJ'
            Default     = $true
            Email       = $false
        }
        Popper                      = @{
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
                    "$PSScriptRoot\..\Resources\JS\popper.min.js"
                    "$PSScriptRoot\..\Resources\JS\tooltip.min.js"
                )
            }
            SourceCodes  = 'https://github.com/popperjs/popper-core'
            LicenseLink  = 'https://github.com/popperjs/popper-core/blob/master/LICENSE.md'
            License      = 'MIT'
            Default      = $true
            Email        = $false
        }
        RedrawObjects               = @{
            Comment  = 'Allows redrawObjects for collapsed sections and changing tabs'
            Internal = $true
            Footer   = @{
                JSLink = "$($Script:ConfigurationURL)/JS/redrawObjects.min.js"
                JS     = "$PSScriptRoot\..\Resources\JS\redrawObjects.js"
            }
            <#
            FooterAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\redrawObjects.js"
            }
            #>
            Default  = $true
            Email    = $false
        }
        Tabbis                      = @{
            Comment      = 'Elastic Tabbis'
            Internal     = $true
            HeaderAlways = @{
                #Css       = "$PSScriptRoot\..\Resources\CSS\tabbis.css"
                CssInline = [ordered] @{
                    ".tabsWrapper"         = [ordered]@{
                        'text-align'     = 'center'
                        #'margin'         = "10px auto"
                        'font-family'    = "'Roboto', sans-serif !important"
                        'text-transform' = 'uppercase'
                        # 'font-size'      = '15px'
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
            <#
            Footer       = @{
                JSLink = @(
                    "$($Script:ConfigurationURL)/JS/tabbis.min.js"
                    "$($Script:ConfigurationURL)/JS/tabbisAdditional.min.js"
                )
                JS     = @(
                    "$PSScriptRoot\..\Resources\JS\tabbis.js"
                    "$PSScriptRoot\..\Resources\JS\tabbisAdditional.js"
                )
            }
            #>
            Default      = $true
            Email        = $false
        }
        TabsInline                  = @{
            # http://techlaboratory.net/jquery-smarttab
            Comment     = 'Tabs Inline'
            Header      = @{
                JsLink  = 'https://cdn.jsdelivr.net/npm/jquery-smarttab@3/dist/js/jquery.smartTab.min.js'
                Js      = "$PSScriptRoot\..\Resources\JS\jquery.smartTab.min.js"
                CssLink = "https://cdn.jsdelivr.net/npm/jquery-smarttab@3/dist/css/smart_tab_all.min.css"
                Css     = "$PSScriptRoot\..\Resources\CSS\jquery.smartTab.min.css"
            }
            SourceCodes = 'https://github.com/techlab/jquery-smarttab'
            LicenseLink = 'https://github.com/techlab/jquery-smarttab/blob/master/LICENSE'
            License     = 'MIT'
            Default     = $true
            Email       = $false
        }
        TimeLine                    = @{
            Comment      = 'Timeline Simple'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\timeline-simple.css"
            }
            Default      = $true
            Email        = $false
        }
        Toasts                      = @{
            Comment      = 'Toasts Looking Messages'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\Toasts.css"
            }
            Default      = $true
            Email        = $false
        }
        StatusButtonical            = @{
            Comment      = 'Status Buttonical'
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\status.css"
            }
            Default      = $true
            Email        = $false
        }
        VisData                     = [ordered]@{
            Header  = @{
                # https://unpkg.com/vis-data@latest/peer/umd/vis-data.min.js
                JsLink = 'https://cdn.jsdelivr.net/npm/vis-data@7.1.2/peer/umd/vis-data.min.js'
                Js     = "$PSScriptRoot\..\Resources\JS\vis-data.min.js"
            }
            Default = $true
            Email   = $false
        }
        VisNetwork                  = [ordered]@{
            Comment      = 'VIS Network Dynamic, browser based visualization libraries'
            Demos        = @(
                'https://visjs.github.io/vis-network/examples/'
            )
            HeaderAlways = @{
                CssInline = [ordered]@{
                    '.diagram'           = [ordered]@{
                        'min-height' = '400px'
                        'width'      = '100%'
                        'height'     = '100%'
                        'border'     = '0px solid unset'
                    }
                    '.vis-network:focus' = [ordered]@{
                        'outline' = 'none'
                    }
                }
                JsInLine  = "var diagramTracker = {};"
            }
            Header       = @{
                # https://unpkg.com/vis-network@latest/peer/umd/vis-network.min.js
                # https://unpkg.com/vis-network/styles/vis-network.min.css
                JsLink  = 'https://cdn.jsdelivr.net/npm/vis-network@9.0.4/peer/umd/vis-network.min.js'
                Js      = "$PSScriptRoot\..\Resources\JS\vis-network.min.js"
                CssLink = 'https://cdn.jsdelivr.net/npm/vis-network@9.0.4/styles/vis-network.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\vis-network.min.css"
            }
            Default      = $true
            Email        = $false
            License      = 'Apache 2.0'
            LicenseLink  = 'https://github.com/visjs/vis-network/blob/master/LICENSE-APACHE-2.0'
            SourceCodes  = 'https://github.com/visjs'
        }
        VisNetworkClustering        = [ordered] @{
            Comment  = 'VIS Network Clustering'
            Internal = $true
            <#
            FooterAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\vis-networkFunctions.js"
            }
            #>
            Footer   = @{
                JSLink = "$($Script:ConfigurationURL)/JS/vis-networkFunctions.min.js"
                JS     = "$PSScriptRoot\..\Resources\JS\vis-networkFunctions.js"
            }
            Default  = $true
            Email    = $false
        }
        VisNetworkLoadingBar        = [ordered]@{
            Comment = 'VIS Network Loading Bar'
            <#
            HeaderAlways = @{
                Css = "$PSScriptRoot\..\Resources\CSS\vis-network.loadingbar.css"
            }
            #>
            Header  = @{
                CssLink = "$($Script:ConfigurationURL)/CSS/vis-network.loadingbar.min.css"
                Css     = "$PSScriptRoot\..\Resources\CSS\vis-network.loadingbar.css"
            }
            Default = $true
            Email   = $false
        }
        VisNetworkLoad              = [ordered] @{
            Comment = 'VIS Network Load'
            <#
            HeaderAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\vis-networkLoadDiagram.js"
            }
            #>
            Header  = @{
                JSLink = "$($Script:ConfigurationURL)/JS/vis-networkLoadDiagram.min.js"
                JS     = "$PSScriptRoot\..\Resources\JS\vis-networkLoadDiagram.js"
            }
            Default = $true
            Email   = $false
        }
        <#
        VisNetworkStandalone   = [ordered]@{
            Comment      = 'VIS Network Standalone Dynamic, browser based visualization libraries'
            HeaderAlways = @{
                CssInline = [ordered]@{
                    '.diagram'           = [ordered]@{
                        'min-height' = '400px'
                        'width'      = '100%'
                        'height'     = '100%'
                        'border'     = '0px solid unset'
                    }
                    '.vis-network:focus' = [ordered]@{
                        'outline' = 'none'
                    }
                }
            }
            Header       = @{
                JsLink = 'https://unpkg.com/vis-network@8.4.1/standalone/umd/vis-network.min.js'
                Js     = "$PSScriptRoot\..\Resources\JS\vis-networkStandalone.min.js"
            }
            FooterAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\vis-networkFunctions.js"
            }
        }
        #>
        VisTimeline                 = [ordered]@{
            Comment      = 'VIS TimeLine'
            HeaderAlways = [ordered]@{
                CssInline = [ordered] @{
                    '.vis-timeline' = @{
                        'outline' = 'none'
                        'border'  = 'none !important'
                    }
                }
            }
            Header       = @{
                # https://unpkg.com/vis-timeline@latest/peer/umd/vis-timeline-graph2d.min.js
                JsLink  = 'https://cdn.jsdelivr.net/npm/vis-timeline@7.4.6/peer/umd/vis-timeline-graph2d.min.js'
                Js      = "$PSScriptRoot\..\Resources\JS\vis-timeline-graph2d.min.js"
                Css     = "$PSScriptRoot\..\Resources\CSS\vis-timeline-graph2d.min.css"
                CssLink = 'https://cdn.jsdelivr.net/npm/vis-timeline@7.4.6/styles/vis-timeline-graph2d.min.css'
            }
            LicenseLink  = 'https://github.com/visjs/vis-timeline/blob/master/LICENSE.md'
            License      = 'MIT and Apache 2.0'
            SourceCodes  = 'https://github.com/visjs/vis-timeline'
            Default      = $true
            Email        = $false
        }
        QR                          = [ordered] @{
            Comment      = 'QR Code'
            Demos        = 'https://www.easyproject.cn/easyqrcodejs/tryit.html'
            HeaderAlways = @{
                CssInline = @{
                    '.qrcode' = [ordered] @{
                        'margin' = '5px'
                    }
                }
            }
            Header       = @{
                JSLink = 'https://cdn.jsdelivr.net/npm/easyqrcodejs@4.3.2/dist/easy.qrcode.min.js'
                Js     = "$PSScriptRoot\..\Resources\JS\easy.qrcode.min.js"
            }
            Default      = $true
            Email        = $false
            LicenseLink  = 'https://github.com/ushelp/EasyQRCodeJS/blob/master/LICENSE'
            License      = 'MIT'
            SourceCodes  = 'https://github.com/ushelp/EasyQRCodeJS'
        }
        Wizard                      = [ordered] @{
            Comment      = 'Wizard'
            Demos        = 'http://techlaboratory.net/jquery-smartwizard'
            Header       = @{
                JsLink  = 'https://cdn.jsdelivr.net/npm/smartwizard@5.1.1/dist/js/jquery.smartWizard.min.js'
                Js      = "$PSScriptRoot\..\Resources\JS\jquery.smartWizard.min.js"
                CssLink = "https://cdn.jsdelivr.net/npm/smartwizard@5.1.1/dist/css/smart_wizard_all.min.css"
                Css     = "$PSScriptRoot\..\Resources\CSS\jquery.smartWizard.min.css"
            }
            HeaderAlways = @{
                CssInline = @{
                    '.defaultWizard' = [ordered] @{
                        'margin' = '5px'
                    }
                }
            }
            Default      = $true
            Email        = $false
            LicenseLink  = 'https://github.com/techlab/jquery-smartwizard/blob/master/LICENSE'
            License      = 'MIT'
            SourceCodes  = 'https://github.com/techlab/jquery-smartwizard'
        }
        WinBox                      = [ordered] @{
            Comment      = 'WinBox'
            Demos        = 'http://techlaboratory.net/jquery-smartwizard'
            Header       = @{
                JsLink  = 'https://cdn.jsdelivr.net/npm/winbox@0.1.8/dist/js/winbox.min.js'
                Js      = "$PSScriptRoot\..\Resources\JS\winbox.min.js"
                CssLink = "https://cdn.jsdelivr.net/npm/winbox@0.1.8/dist/css/winbox.min.css", 'https://cdn.jsdelivr.net/npm/winbox@0.1.8/dist/css/themes/modern.min.css', 'https://cdn.jsdelivr.net/npm/winbox@0.1.8/dist/css/themes/white.min.css'
                Css     = "$PSScriptRoot\..\Resources\CSS\winbox.min.css", "$PSScriptRoot\..\Resources\CSS\winbox.modern.min.css", "$PSScriptRoot\..\Resources\CSS\winbox.white.min.css"
            }
            HeaderAlways = @{
                JS = "$PSScriptRoot\..\Resources\JS\winbox.support.js"
                # CssInline = @{
                # '.defaultWizard' = [ordered] @{
                # 'margin' = '5px'
                # }
                # }
            }
            Default      = $true
            Email        = $false
            LicenseLink  = 'https://github.com/nextapps-de/winbox/blob/master/LICENSE'
            License      = 'Apache-2.0 License'
            SourceCodes  = 'https://github.com/nextapps-de/winbox'
        }
        JQueryMouseWheel            = @{
            Header      = @{
                JSLink = 'https://cdn.jsdelivr.net/npm/jquery-mousewheel@3.1.13/jquery.mousewheel.min.js'
                JS     = "$PSScriptRoot\..\Resources\JS\jquery.mousewheel.min.js"
            }
            SourceCodes = 'https://github.com/jquery/jquery-mousewheel'
            License     = 'MIT'
            LicenseLink = 'https://github.com/jquery/jquery-mousewheel/blob/master/LICENSE.txt'
            Default     = $true
            Email       = $false
        }
        Mapael                      = @{
            Comment     = 'Mapael JQuery'
            Header      = @{
                JSLink = 'https://cdn.jsdelivr.net/npm/jquery-mapael@2.2.0/js/jquery.mapael.min.js'
                JS     = "$PSScriptRoot\..\Resources\JS\jquery.mapael.min.js"
            }
            Library     = 'https://github.com/neveldo/jQuery-Mapael'
            SourceCodes = 'https://github.com/neveldo/jQuery-Mapael'
            License     = 'MIT'
            LicenseLink = 'https://github.com/neveldo/jQuery-Mapael/blob/master/LICENSE'
            Default     = $true
            Email       = $false
        }
        MapaelMaps_Poland           = @{
            Internal = $true
            Header   = @{
                JSLink = "$($Script:ConfigurationURL)/Maps/poland/poland.min.js"
                JS     = "$PSScriptRoot\..\Resources\Maps\poland\poland.js"
            }
            Default  = $true
            Email    = $false
        }
        MapaelMaps_usa_states       = @{
            Internal = $true
            Header   = @{
                JSLink = "$($Script:ConfigurationURL)/Maps/usa/usa_states.min.js"
                JS     = "$PSScriptRoot\..\Resources\Maps\usa\usa_states.js"
            }
            Default  = $true
            Email    = $false
        }
        MapaelMaps_world_countries  = @{
            Internal = $true
            Header   = @{
                JSLink = "$($Script:ConfigurationURL)/Maps/world/world_countries.min.js"
                JS     = "$PSScriptRoot\..\Resources\Maps\world\world_countries.js"
            }
            Default  = $true
            Email    = $false
        }
    }
}
<#
$Keys = @(
    #'datatablesfuzzysearch'
    #'iFrameResizer
    #'Popper'
    #'Moment'
    #'Jquery'
    #'ChartsOrg', 'ChartsOrgExportPDF', 'ChartsOrgExportPNG'
    #'ChartsApex'
    #'AccordionFAQ'
    #'VisNetwork'
    #'VisTimeline'
    #'VisData'
    #'FullCalendar'
    #'DataTablesSearchAlphabet'
    #'DataTable*'
    #'FancyTree'
    #'JustGage'
    #'CarouselKineto'
    #'QR'
    #'Fonts*'
    #'WinBox'
    #'FontsSimpleIcons'
)

Save-HTMLResource -Configuration $Script:Configuration -Keys $Keys -PathToSave 'C:\Users\przemyslaw.klys\OneDrive - Evotec\Support\GitHub\PSWriteHTML\Resources' -Verbose
#>