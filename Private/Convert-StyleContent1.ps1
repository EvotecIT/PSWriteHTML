function Convert-StyleContent1 {
    param(
        [PSCustomObject] $Options
    )
    # Replace PNG / JPG files in Styles
    if ($null -ne $Options.StyleContent) {
        Write-Verbose "Logos: $($Options.Logos.Keys -join ',')"
        foreach ($Logo in $Options.Logos.Keys) {
            $Search = "../images/$Logo.png", "DataTables-1.10.18/images/$Logo.png"
            $Replace = $Options.Logos[$Logo]
            foreach ($S in $Search) {
                Write-Verbose "Logos - replacing $S with binary representation"
                $Options.StyleContent = ($Options.StyleContent).Replace($S, $Replace)
            }
        }
    }    
}