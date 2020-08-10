Import-Module .\PSWriteHTML.psd1 -Force

$Css = [ordered] @{
    ".tabsWrapper"         = [ordered]@{
        'text-align'     = 'center'
        'margin'         = "10px auto"
        'font-family'    = "'Roboto', sans-serif !important"
        'text-transform' = 'uppercase'
        'font-size'      = '15px'
    }
    '[data-tabs]'          = [ordered]@{
        'display'         = 'flex'
        'margin-top'      = '10px'
        # /*font-size =  15px;*/
        'padding'         = '0px'
        'box-shadow'      = '0px 5px 20px rgba(0, 0, 0, 0.1)'
        'border-radius'   = '4px'
        'justify-content' = 'center'
    }

    '[data-tabs]>*'        = [ordered]@{
        'cursor'  = 'pointer'
        'padding' = '10px 20px'
    }

    '[data-tabs] .active'  = [ordered]@{
        'background'    = '#1e90ff' # DodgerBlue
        'color'         = '#fff'
        'border-radius' = '4px'
    }

    '[data-panes]>*'       = [ordered]@{
        'display' = 'none'
    }

    '[data-panes]>.active' = [ordered]@{
        'display' = 'block'
    }
}

ConvertTo-CascadingStyleSheets -Css $Css
