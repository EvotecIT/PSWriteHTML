function New-HTMLPage {
    <#
    .SYNOPSIS
    Creates a new HTML page with specified content, name, title, file path, and ID.

    .DESCRIPTION
    This function creates a new HTML page with the provided content and metadata. It generates a unique GUID for the page and stores it in the global schema. The function returns a custom object representing the page.

    .PARAMETER PageContent
    The script block containing the HTML content of the page.

    .PARAMETER Name
    The name of the HTML page.

    .PARAMETER Title
    The title of the HTML page.

    .PARAMETER FilePath
    The file path where the HTML page will be saved.

    .PARAMETER ID
    The ID of the HTML page.

    .EXAMPLE
    New-HTMLPage -PageContent { "<html><body><h1>Hello, World!</h1></body></html>" } -Name "index" -Title "Welcome Page" -FilePath "C:\Pages\index.html" -ID "12345"

    Creates a new HTML page with a simple "Hello, World!" content, named "index", titled "Welcome Page", saved at "C:\Pages\index.html", and with ID "12345".

    #>
    [cmdletBinding()]
    param(
        [scriptblock] $PageContent,
        [Parameter(Mandatory)][string] $Name,
        [string] $Title,
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
            Title    = $Title
            ID       = $ID
        }
    }
}