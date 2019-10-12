function New-DiagramEvent {
    param(
        #[switch] $FadeSearch,
        [string] $ID,
        [int] $ColumnID
    )

    $Object = [PSCustomObject] @{
        Type     = 'DiagramEvent'
        Settings = @{
            # OnClick = $OnClick.IsPresent
            ID         = $ID
           # FadeSearch = $FadeSearch.IsPresent
            ColumnID   = $ColumnID
        }
    }
    $Object
}