function ConvertTo-SVG {
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