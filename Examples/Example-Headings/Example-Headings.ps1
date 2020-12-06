Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -Online:$false -Open {
    New-HTMLHeading -HeadingText 'Heading H1' -Heading h1
    New-HTMLHeading -HeadingText 'Heading H2' -Heading h2
    New-HTMLHeading -HeadingText 'Heading H3' -Heading h3
    New-HTMLHeading -HeadingText 'Heading H4' -Heading h4
    New-HTMLHeading -HeadingText 'Heading H5' -Heading h5
    New-HTMLHeading -HeadingText 'Heading H6' -Heading h6
    New-HTMLText -Text 'Normal text'
    New-HTMLText -Text 'Bold text' -FontWeight 400
    New-HTMLText -Text 'Bold text 700' -FontWeight 700
    New-HTMLText -Text 'Bold text 900' -FontWeight 900
    New-HTMLText -Text 'Bold text 500' -FontWeight 500
    New-HTMLText -Text 'Bold text 400' -FontWeight 400 -FontStyle italic
    New-HTMLText -Text 'Bold text 700' -FontWeight 700 -FontStyle italic
    New-HTMLText -Text 'Bold text 900' -FontWeight 900 -FontStyle italic

    Enable-HTMLFeature -Feature FontsAwesome
    foreach ($Key in $Global:HTMLIcons.FontAwesomeBrands.Keys) {
        $Icon = "fab fa-$Key" # fa-$($FontSize)x"
        New-HTMLTag -Tag 'span' -Attributes @{ class = $Icon; style = @{ 'font-size' = '25px'; 'margin' = '5px' } } -Value {
            " $Key"
        }
        New-HTMLTag -Tag 'br'
    }

    foreach ($Key in $Global:HTMLIcons.FontAwesomeRegular.Keys) {
        $Icon = "far fa-$Key" # fa-$($FontSize)x"
        New-HTMLTag -Tag 'span' -Attributes @{ class = $Icon; style = @{ 'font-size' = '25px'; 'margin' = '5px'; 'color' = 'red' } } -Value {
            " $Key"
        }
        New-HTMLTag -Tag 'br'
    }

    foreach ($Key in $Global:HTMLIcons.FontAwesomeSolid.Keys) {
        $Icon = "fas fa-$Key" # fa-$($FontSize)x"
        New-HTMLTag -Tag 'span' -Attributes @{ class = $Icon; style = @{ 'font-size' = '25px'; 'margin' = '5px'; color = 'green' } } -Value {
            " $Key"
        }
        New-HTMLTag -Tag 'br'
    }
} -FilePath $PSScriptRoot\Example-Headings.html