function New-HTMLPage {
    [cmdletBinding()]
    param(
        [scriptblock] $PageContent,
        [Parameter(Mandatory)][string] $Name,
        [string] $FilePath,
        [string] $ID
    )

    if ($PageContent) {
        $GUID = "$Name_$([guid]::NewGuid().Guid)"
        $Script:GlobalSchema['Pages'][$GUID] = New-DefaultSettings

        $Script:HTMLSchema['PagesCurrent'] = $GUID
        $Script:HTMLSchema = $Script:GlobalSchema['Pages'][$GUID]

        [PSCustomObject] @{
            Type     = 'Page'
            Output   = & $PageContent
            Name     = $Name
            Guid     = $GUID
            FilePath = $FilePath
            ID       = $ID
        }
    }
}