Import-Module .\PSWriteHTML.psd1 -Force

$CodeBlock = @"
New-HTML {
    New-HTMLTable -DataTable `$Test
} -ShowHTML
"@
$CodeBlockJS = @"
// Takes a data URI and returns the Data URI corresponding to the resized image at the wanted size.
function resizedataURL(datas, wantedWidth, wantedHeight) {
    // We create an image to receive the Data URI
    var img = document.createElement("img");

    // When the event "onload" is triggered we can resize the image.
    img.onload = function () {
        // We create a canvas and get its context.
        var canvas = document.createElement("canvas");
        var ctx = canvas.getContext("2d");

        // We set the dimensions at the wanted size.
        canvas.width = wantedWidth;
        canvas.height = wantedHeight;

        // We resize the image with the canvas method drawImage();
        ctx.drawImage(this, 0, 0, wantedWidth, wantedHeight);

        var dataURI = canvas.toDataURL();

        /////////////////////////////////////////
        // Use and treat your Data URI here !! //
        /////////////////////////////////////////
    };

    // We put the Data URI in the image's src attribute
    img.src = datas;
}
// Use it like that : resizedataURL('yourDataURIHere', 50, 50);
"@

$CodeBlocksXML = @'
<!--?xml version="1.0" encoding="UTF-8"?-->
<building name="GlobalDynamics Main Building"
    core:id="0xFA8A91C6617DFA1B" core:uid="0898213-123123123-1230898123" xmlns:core="http://www.xmlnamespace.tld">
  <core:group core:level="2">
    <room number="123">Conference Room A</room>
    <room number="124">Conference Room B</room>
    <room number="125">Conference Room C</room>
    <room number="126">Conference Room D</room>
  </core:group>
  <core:group core:level="2">
    <room number="17">John's Office</room>
            <room number="19">Eric's Office</room>
  </core:group>
  <core:group core:level="1">
    <room number="091">Mainframe Housing A</room>
    <room number="092">Mainframe Housing B</room>
    <room number="090">Mainframe Power Supply Station</room>
    <room number="089">Mainframe Backup Power Supply Station</room>
  </core:group>
  <core:group core:level="8">
    <room number="1717" role="cto">CTO Office</room>
    <room number="1819" role="ceo">CEO Office</room>
    <room number="1820" role="cfo">
      <x_room label="k89121">Lab01</x_room>
    </room>
  </core:group>
</building>
'@

New-HTML -Online -FilePath "$PSScriptRoot\CodeBlocks02.html" -ShowHTML {
    New-HTMLTab -TabName 'Coding' {
        New-HTMLSection -HeaderText 'This shows PowerShell Language' {
            New-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell' -Group 'Test123' -Title 'PowerShell Code 1' -Theme godzilla -Highlight '2-5, 13'
            New-HTMLCodeBlock -Code $CodeBlock -Style 'PowerShell' -Group 'Test123' -Title 'PowerShell Code 2'
        }
        New-HTMLSection -HeaderText 'This shows PowerShell Language' {
            New-HTMLCodeBlock -Code $CodeBlockJS -Style 'JavaScript' -Theme enlighter -Highlight '2, 5'
        }
        New-HTMLSection -HeaderText 'XML Language' {
            New-HTMLCodeBlock -Code $CodeBlocksXML -Style 'xml' -Highlight '12, 19'
        }
    }
}