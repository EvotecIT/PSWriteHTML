function New-DefaultSettings {
    [cmdletBinding()]
    param()
    [ordered]@{
        Email             = $false
        Features          = [ordered] @{ } # tracks features for CSS/JS implementation
        Charts            = [System.Collections.Generic.List[string]]::new()
        Carousel          = [System.Collections.Generic.List[string]]::new()
        Diagrams          = [System.Collections.Generic.List[string]]::new()
        Logos             = ""
        # Tabs Tracking/Options (Top Level Ones)
        TabsHeaders       = [System.Collections.Generic.List[System.Collections.IDictionary]]::new() # tracks / stores headers
        TabsHeadersNested = [System.Collections.Generic.List[System.Collections.IDictionary]]::new() # tracks / stores headers
        TableOptions      = [ordered] @{
            DataStore        = ''
            # Applies to only JavaScript and AjaxJSON store
            DataStoreOptions = [ordered] @{
                BoolAsString   = $false
                NumberAsString = $false
                DateTimeFormat = '' #"yyyy-MM-dd HH:mm:ss"
                NewLineFormat  = @{
                    NewLineCarriage = '<br>'
                    NewLine         = "\n"
                    Carriage        = "\r"
                }
            }
            Type             = 'Structured'
            Folder           = if ($FilePath) { Split-Path -Path $FilePath } else { '' }
        }
        # TabPanels Tracking
        TabPanelsList     = [System.Collections.Generic.List[string]]::new()
        Table             = [ordered] @{}
        TableSimplify     = $false # Tracks current table only
        CustomHeaderCSS   = [ordered] @{}
        CustomFooterCSS   = [ordered] @{}
        CustomHeaderJS    = [ordered] @{}
        CustomFooterJS    = [ordered] @{}

        # WizardList Tracking
        WizardList        = [System.Collections.Generic.List[string]]::new()
    }
}