function New-HTMLNav {
    [cmdletBinding()]
    param(
        [ScriptBlock] $NavigationLinks,
        [string] $Logo,
        [string] $LogoLink,
        [switch] $LogoLinkHome
    )
    $Script:HTMLSchema.Features.NavigationMenuHS = $true
    $Script:HTMLSchema.Features.JQuery = $true
    $Script:HTMLSchema.Features.FontsMaterialIcon = $true
    $Script:HTMLSchema.Features.FontsAwesome = $true
    $Script:CurrentConfiguration['Features']['Main']['HeaderAlways']['CssInLine']['.main-section']['margin-top'] = '55px'

    if ($LogoLinkHome) {
        $LogoLink = "$($Script:HTMLSchema.StorageInformation.FileName).html"
    }

    if ($NavigationLinks) {
        $Output = & $NavigationLinks
        $NavGridItems = [System.Collections.Generic.List[string]]::new()
        $NavLinks = [System.Collections.Generic.List[string]]::new()
        $NavGridMenu = [System.Collections.Generic.List[string]]::new()
        foreach ($Link in $Output) {
            if ($Link.Type -eq 'NavGridItem') {
                $NavGridItems.Add($Link.Value)
            } elseIf ($Link.Type -eq 'NavLinkItem') {
                $NavLinks.Add($Link.Value)
            } elseif ($Link.Type -eq 'NavGridMenu') {
                $NavGridMenu.Add($Link.Value)
            }
        }
    }

    # Header
    $Navigation = @(
        New-HTMLTag -Tag 'header' -Attributes @{ class = 'hs-menubar' } {
            # Menu Trigger
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'menu-trigger' } {
                New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-menu' }
            }
            # Brand logo
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'brand-logo' } {
                New-HTMLTag -Tag 'a' -Attributes @{ href = $LogoLink } {
                    New-HTMLTag -Tag 'img' -Attributes @{ src = $Logo; title = 'PSWriteHTML Logo'; alt = 'PSWriteHTML Logo' }
                }
            }
            <#
            # Search Trigger
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'search-trigger' } {
                New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-search' }
            }
            # Search Box

            New-HTMLTag -Tag 'div' -Attributes @{ class = 'search-box' } {
                # Form to enter
                New-HTMLTag -Tag 'form' -Attributes @{ action = '#' } {
                    New-HTMLTag -Tag 'input' -Attributes @{ type = 'text'; name = 'search' } -NoClosing
                    New-HTMLTag -Tag 'button' -Attributes @{ type = 'submit'; class = 'search-submit'; disabled = 'disabled' } {
                        'Search'
                    }
                }
            }
            #>
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'grid-trigger toggle'; 'data-reveal' = '.grid-items' } {
                New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-view-module' }
            }
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'hs-user toggle'; 'data-reveal' = '.user-info' } {
                New-HTMLTag -Tag 'img' -Attributes @{ src = 'https://evotec.xyz/wp-content/uploads/2021/04/PrzemyslawKlysAndKulkozaurr.jpg'; alt = 'Evotec' } -NoClosing
            }
            New-HTMLTag -Tag 'div' -Attributes @{ class = 'more-trigger toggle'; 'data-reveal' = '.user-penal' } {
                New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-more-vert' }
            }
        }

        New-HTMLTag -Tag 'section' -Attributes @{ class = 'box-model' } {
            New-HTMLTag -Tag 'ul' -Attributes @{ class = 'user-penal' } {

                $NavGridMenu
                <#
                New-HTMLTag -Tag 'li' {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } {
                        New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-inbox zmdi-hc-fw' }
                        'Inbox'
                    }
                }
                New-HTMLTag -Tag 'li' {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } {
                        New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-delete zmdi-hc-fw' }
                        'Trash'
                    }
                }
                New-HTMLTag -Tag 'li' {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } {
                        New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-star zmdi-hc-fw' }
                        'Started'
                    }
                }
                New-HTMLTag -Tag 'li' {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } {
                        New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-run zmdi-hc-fw' }
                        'Logout'
                    }
                }
                #>
            }
            <#
            New-HTMLTag -Tag 'ul' -Attributes @{ class = 'user-info' } {
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'profile-pic' } {

                }
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'user-name' } {
                    'Asif Mughal'
                }
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'user-bio' } {
                    'Front End Web Developer'
                }
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'more-btn' } {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } {
                        'Find Out More'
                    }
                }
            }
            #>

            if ($NavGridItems) {
                New-HTMLTag -Tag 'ul' -Attributes @{ class = 'grid-items' } {
                    $NavGridItems
                    <#
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'grid' } {
                    New-HTMLFontIcon -IconMaterial collection-item -FixedWidth
                }
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'grid' } {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = 'https://evotec.pl' } {
                        New-HTMLTag -Tag 'span' -Attributes @{ class = 'icon' } {
                            #New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-collection-item fw' }
                            New-HTMLFontIcon -IconMaterial collection-item -FixedWidth
                            #New-HTMLFontIcon -IconSolid cloud-upload-alt -FixedWidth
                        }
                        'List Item two'
                    }
                }
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'grid' } {
                    'Item three'
                }
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'grid' } {
                    'Item four'
                }
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'grid' } {
                    'Item five'
                }
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'grid' } {
                    'Item five'
                }
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'grid' } {
                    'Item five'
                }
                #>
                }
            }
        }

        # Navigation
        New-HTMLTag -Tag 'nav' -Attributes @{ class = 'hs-navigation' } {
            New-HTMLTag -Tag 'ul' -Attributes @{ class = 'nav-links' } {
                if ($NavLinks) {
                    $NavLinks
                }
                <#
                # Entry one
                New-HTMLTag -Tag 'li' {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = '#4' } {
                        New-HTMLTag -Tag 'span' -Attributes @{ class = 'icon' } {
                            #New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-collection-item fw' }
                            New-HTMLFontIcon -IconMaterial collection-item -FixedWidth
                            #New-HTMLFontIcon -IconSolid cloud-upload-alt -FixedWidth
                        }
                        'List Item One'
                    }
                }
                New-HTMLTag -Tag 'li' {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = '#4' } {
                        New-HTMLTag -Tag 'span' -Attributes @{ class = 'icon' } {
                            # New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-compass fw' }
                            New-HTMLFontIcon -IconMaterial compass -FixedWidth
                            #New-HTMLFontIcon -IconSolid compass -FixedWidth
                        }
                        'List Item Three'
                    }
                }
                # Entry two
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'has-child' } {
                    New-HTMLTag -Tag 'span' -Attributes @{ class = 'its-parent' } {
                        New-HTMLTag -Tag 'span' -Attributes @{ class = 'icon' } {
                            #New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-device-hub fw' }
                            New-HTMLFontIcon -IconMaterial device-hub -FixedWidth
                            #New-HTMLFontIcon -IconSolid hot-tub -FixedWidth
                        }
                        'Multilevel Dropdown'
                    }
                    New-HTMLTag -Tag 'ul' -Attributes @{ class = 'its-children' } {
                        New-HTMLTag -Tag 'li' { New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } { 'Sub Item 1.1' } }
                        New-HTMLTag -Tag 'li' -Attributes @{class = 'has-child' } {
                            New-HTMLTag -Tag 'span' -Attributes @{ class = 'its-parent' } { 'Item 1.2 has child' }
                            New-HTMLTag -Tag 'ul' -Attributes @{ class = 'its-children' } {
                                New-HTMLTag -Tag 'li' { New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } { 'Sub Item 1.2.1' } }
                                New-HTMLTag -Tag 'li' { New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } { 'Sub Item 1.2.2' } }
                                New-HTMLTag -Tag 'li' { New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } { 'Sub Item 1.2.3' } }
                                New-HTMLTag -Tag 'li' { New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } { 'Sub Item 1.2.4' } }
                            }
                        }
                    }
                }

                # Entry test
                New-HTMLTag -Tag 'li' -Attributes @{ class = 'has-child' } {
                    New-HTMLTag -Tag 'span' -Attributes @{ class = 'its-parent' } {
                        New-HTMLTag -Tag 'span' -Attributes @{ class = 'icon' } {
                            New-HTMLFontIcon -IconMaterial device-hub -FixedWidth
                        }
                        'Multilevel one level'
                    }
                    New-HTMLTag -Tag 'ul' -Attributes @{ class = 'its-children' } {
                        New-HTMLTag -Tag 'li' { New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } { 'Sub Item 1.1' } }
                        New-HTMLTag -Tag 'li' { New-HTMLTag -Tag 'a' -Attributes @{ href = '#1' } { 'Sub Item 1.2' } }
                    }
                }
                # Entry Three
                New-HTMLTag -Tag 'li' {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = '#4' } {
                        New-HTMLTag -Tag 'span' -Attributes @{ class = 'icon' } {
                            #New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-compass fw' }
                            New-HTMLFontIcon -IconMaterial compass -FixedWidth
                            #New-HTMLFontIcon -IconSolid compass -FixedWidth
                        }
                        'List Item Three'
                    }
                }
                # Entry Four
                New-HTMLTag -Tag 'li' {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = '#4' } {
                        New-HTMLTag -Tag 'span' -Attributes @{ class = 'icon' } {
                            #New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-collection-video fw' }
                            New-HTMLFontIcon -IconMaterial collection-video -FixedWidth
                            #New-HTMLFontIcon -IconSolid video -FixedWidth
                        }
                        'List Item Four'
                    }
                }

                New-HTMLTag -Tag 'li' {
                    New-HTMLTag -Tag 'a' -Attributes @{ href = '#4' } {
                        New-HTMLTag -Tag 'span' -Attributes @{ class = 'icon' } {
                            #New-HTMLTag -Tag 'i' -Attributes @{ class = 'zmdi zmdi-collection-video fw' }
                            New-HTMLFontIcon -IconMaterial collection-video -FixedWidth -IconColor yellow
                            #New-HTMLFontIcon -IconBrands 500px -FixedWidth
                        }
                        'List Item Four'
                    }
                }
                #>
            }
        }
    )
    [PSCustomObject] @{
        Type   = 'Navigation'
        Output = $Navigation
    }

}