Function Get-HTMLHeading {
    Param
    (
        [string]$headingText,
        [int]$headerSize
    )

    $headerString = "<h$headerSize>$headingText</h$headerSize>"
    return $headerString
}