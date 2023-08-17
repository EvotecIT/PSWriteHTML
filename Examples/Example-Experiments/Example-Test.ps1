Import-Module .\PSWriteHTML.psd1 -Force

New-HTML {
    Add-JS -Placement Header -Link 'https://code.jquery.com/jquery-3.3.1.min.js'
    Add-CSS -Placement Inline -Link 'https://cdn.jsdelivr.net/npm/jquery-smarttab@3/dist/css/smart_tab_all.min.css'
    Add-JS -Placement Header -Link 'https://cdn.jsdelivr.net/npm/jquery-smarttab@3/dist/js/jquery.smartTab.min.js'
    Add-CSS -Placement Inline -CSS @{
        body = @{
            'background-color' = '#f4f4f4'
        }
    }
} -Online -FilePath $PSScriptRoot\Example-Test.html