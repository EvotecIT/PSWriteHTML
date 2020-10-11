Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    Add-JS -Placement Header -Link 'https://code.jquery.com/jquery-3.3.1.min.js'
    Add-CSS -Placement Header -Link 'https://cdn.jsdelivr.net/npm/jquery-smarttab@3/dist/css/smart_tab_all.min.css'
    Add-JS -Placement Header -Link 'https://cdn.jsdelivr.net/npm/jquery-smarttab@3/dist/js/jquery.smartTab.min.js'

    Add-HTML {
        Add-HTML -HTML {
            @'
        <div id="smarttab">
        <ul class="nav">
           <li>
               <a class="nav-link" href="#tab-1">
                  Tab 1
               </a>
           </li>
           <li>
               <a class="nav-link" href="#tab-2">
                  Tab 2
               </a>
           </li>
           <li>
               <a class="nav-link" href="#tab-3">
                  Tab 3
               </a>
           </li>
           <li>
               <a class="nav-link" href="#tab-4">
                  Tab 4
               </a>
           </li>
        </ul>

        <div class="tab-content">
           <div id="tab-1" class="tab-pane" role="tabpanel">
              Tab content 1
           </div>
           <div id="tab-2" class="tab-pane" role="tabpanel">
              Tab content 2
           </div>
           <div id="tab-3" class="tab-pane" role="tabpanel">
              Tab content 3
           </div>
           <div id="tab-4" class="tab-pane" role="tabpanel">
              Tab content 4
           </div>
        </div>
    </div>
'@
        }
        Add-JS -Content @'
            $('#smarttab').smartTab( {
                    selected: 0, // Initial selected tab, 0 = first tab
                    theme: 'default', // theme for the tab, related css need to include for other than default theme
                    orientation: 'horizontal', // Nav menu orientation. horizontal/vertical
                    justified: true, // Nav menu justification. true/false
                    autoAdjustHeight: true, // Automatically adjust content height
                    backButtonSupport: true, // Enable the back button support
                    enableURLhash: true, // Enable selection of the tab based on url hash
                    transition: {
                        animation: 'none', // Effect on navigation, none/fade/slide-horizontal/slide-vertical/slide-swing
                        speed: '400', // Transion animation speed
                        easing:'' // Transition animation easing. Not supported without a jQuery easing plugin
                    },
                    autoProgress: { // Auto navigate tabs on interval
                        enabled: false, // Enable/Disable Auto navigation
                        interval: 3500, // Auto navigate Interval (used only if "autoProgress" is set to true)
                        stopOnFocus: true, // Stop auto navigation on focus and resume on outfocus
                    },
                    keyboardSettings: {
                        keyNavigation: true, // Enable/Disable keyboard navigation(left and right keys are used if enabled)
                        keyLeft: [37], // Left key code
                        keyRight: [39] // Right key code
                    }
                });
'@ -Placement Inline

    }
} -ShowHTML -Online -FilePath $PSScriptRoot\Example-TabsInline.html