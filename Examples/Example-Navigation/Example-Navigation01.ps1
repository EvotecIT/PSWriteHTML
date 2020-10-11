Import-Module .\PSWriteHTML.psd1 -Force

<#
New-HTML {
    New-HTMLHeader {
        New-HTMLNav {
            New-HTMLNavLink -Name 'Test1'
            New-HTMLNavLink -Name 'Test2'
            New-HTMLNavLink -Name 'Test3'
            New-HTMLNavLink -Name 'Test7' {
                New-HTMLNavLink -Name 'Test9'
                New-HTMLNavLink -Name 'Test10'
            }
        }
    }
    New-HTMLTab -Name 'Tab1' {
        New-HTMLSection {
            New-HTMLTable -DataTable 'test'
        }
        New-HTMLSection {
            New-HTMLTable -DataTable 'test'
        }
        New-HTMLSection {
            New-HTMLTable -DataTable 'test'
        }
        New-HTMLSection {
            New-HTMLTable -DataTable 'test'
        }
        New-HTMLSection {
            New-HTMLTable -DataTable 'test'
        }
        New-HTMLSection {
            New-HTMLTable -DataTable 'test'
        }
        New-HTMLSection {
            New-HTMLTable -DataTable 'test'
        }
    }
    New-HTMLTab -Name 'Tab1' {

    }
} -Online -ShowHTML -FilePath $PSScriptRoot\Example-Navigation01.html
#>


New-HTML {
   # Add-HTMLScript -Link
    Add-HTMLStyle -Link 'https://fonts.googleapis.com/icon?family=Material+Icons'
    Add-HTMLStyle -Link 'https://fonts.googleapis.com/css?family=Questrial&display=swap'

    New-HTMLNavHam

    New-HTMLHeader {
        Add-HTML -HTML { @"
        <menu class="menubar">
            <menuitem>
            <button class="menu-trigger"> <i class="material-icons">menu</i> </button>
            </menuitem>

            <menuitem class="logo" title="Your Logo Goes Here">
            <a href="#1"><img src="img/jside-menu.png" alt="jSide Menu" /> </a>
            </menuitem>
        </menu>
        <div class="menu-body visibility">
            <div class="menu-head">
                <span class="layer">
                    <div class="col">
                        <div class="row for-pic">
                            <div class="profile-pic">
                                <img src="img/asif-mughal.jpg" alt="Asif Mughal" />
                            </div>
                        </div>
                        <div class="row for-name">
                            <h3 title="User Name"> Asif Mughal </h3>
                            <span class="tagline"> Web Developer</span>
                        </div>
                    </div>
                    <!--//col-->
                </span>
            </div>
            <!--//menu-head-->
            <nav class="menu-container">
                <ul class="menu-items">
                    <li><a href="#1"> <i class="material-icons">widgets</i> Main item one </a></li>
                    <li><a href="#1"> <i class="material-icons">bar_chart</i> Main item two </a></li>
                    <li class="has-sub"> <span class="dropdown-heading"> <i class="material-icons">collections</i> Item three with dropdown </span>
                        <ul>
                            <li> <a href="#2">dropdown sub item 1 </a> </li>
                            <li> <a href="#2"> dropdown sub item 2 </a> </li>
                            <li> <a href="#2"> dropdown sub item 3 </a> </li>
                            <li> <a href="#2"> dropdown sub item 4 </a> </li>
                            <li> <a href="#2"> dropdown sub item 5 </a> </li>
                            <li> <a href="#2"> dropdown sub item 6 </a> </li>
                            <li> <a href="#2"> dropdown sub item 7 </a> </li>
                        </ul>
                    </li>
                    <li class="has-sub"> <span class="dropdown-heading"> <i class="material-icons">camera</i> Item four with dropdown </span>
                        <ul>
                            <li> <a href="#2">sub item 1 </a> </li>
                            <li> <a href="#2">sub item 2 </a> </li>
                            <li> <a href="#2">sub item 3 </a> </li>
                            <li> <a href="#2">sub item 4 </a> </li>
                        </ul>
                    </li>
                    <li> <a href="#1"> <i class="material-icons">color_lens</i> Main item four </a></li>
                    <li> <a href="#1"> <i class="material-icons">pie_chart</i> Main item five </a></li>
                    <li> <a href="#1"> <i class="material-icons">highlight</i> Main item five </a></li>
                    <li> <a href="#1"> <i class="material-icons">format_size</i> Main item six </a></li>
                </ul>
            </nav>
        </div>
"@
        }
    }
    #New-HTMLTab {
    New-HTMLSection {
        New-HTMLTable -DataTable 'test'
    }
    #}


} -Online -ShowHTML -FilePath $PSScriptRoot\Example-Navigation03.html