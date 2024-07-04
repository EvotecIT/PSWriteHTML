function ConvertTo-SVG {
    <#
    .SYNOPSIS
    Converts the input content to a data URI for embedding SVG images in HTML or CSS.

    .DESCRIPTION
    This function takes the input content and file type and converts it to a data URI suitable for embedding SVG images in HTML or CSS. It encodes the content in UTF-8 format and constructs the data URI accordingly.

    .PARAMETER Content
    Specifies the content to be converted to a data URI.

    .PARAMETER FileType
    Specifies the type of file being converted. This should be 'svg' for SVG images.

    .EXAMPLE
    ConvertTo-SVG -Content "SVG content here" -FileType 'svg'
    Converts the input SVG content to a data URI for embedding in HTML or CSS.

    #>
    [CmdLetBinding()]
    param(
        [string] $Content,
        [string] $FileType
    )
    if ($Content) {
        $Replace = "data:image/$FileType;charset=utf-8," + [uri]::EscapeDataString($Content)
        $Replace
    }
}