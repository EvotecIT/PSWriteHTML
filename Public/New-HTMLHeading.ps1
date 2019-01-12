Function New-HTMLHeading {
    Param (
        [validateset('h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'h7')][string]$Heading,
        [string]$HeadingText
    )
    [System.Collections.IDictionary] $Builder = [Ordered] @{
        Tag   = $Heading
        Value = $HeadingText
    }
    $HTML = Set-Tag -HtmlObject $Builder
    return $HTML
}