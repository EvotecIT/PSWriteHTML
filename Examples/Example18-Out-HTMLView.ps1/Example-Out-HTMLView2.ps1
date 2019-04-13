Import-Module .\PSWriteHTML.psd1 -Force

Measure-Command {
    $NewLine = "`n"

    $Object = [PSCustomObject] @{
        Test = $True
        Text = @"
    The Microsoft Foundation Class Library is an application framework for programming in Microsoft Windows. Kłys`n`r
    A remote code execution vulnerability exists in the way that certain applications built with Microsoft Foundation Classes handle the loading of DLL files.$NewLine

Affected Software:$NewLine
Microsoft Visual Studio .NET 2003 Service Pack 1$NewLine
Microsoft Visual Studio 2005 Service Pack 1$NewLine
    Microsoft Visual Studio 2008 Service Pack 1$NewLine
    Microsoft Visual Studio 2010$NewLine
    Microsoft Visual C++ 2005 Service Pack 1 Redistributable Package$NewLine
    Microsoft Visual C++ 2008 Service Pack 1 Redistributable Package$NewLine
    Microsoft Visual C++ 2010 Redistributable Package$NewLine
"@
        NoText = @'
        ddfdsffgdsfgf dggdf gdfgd
        dfgdfgd fgdfg df   dgfg df
        dgff
'@
        Other = 'sdfgsdfgdfsgfd gdfsgdf gdfg dfgdf  gd fg dfgdf gdf gdfgdf gdfg dfgdfgdf gdfg dfgdgd fg gd fg dfgdf gdf gdfgdf gdfg dfgdfgdf gdfg dfgdgd f gd fg dfgdf gdf gdfgdf gdfg dfgdfgdf gdfg dfgdgd f gd fg dfgdf gdf gdfgdf gdfg dfgdfgdf gdfg dfgdgd f'
    }


    $Object, $Object | Out-HtmlView -FilePath "$PSScriptRoot\Example-Out-HTMLView2.html"
}