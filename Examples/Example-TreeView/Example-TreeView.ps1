Import-Module .\PSWriteHTML.psd1 -Force

function New-Node {
    [CmdletBinding()]
    param(
        [string] $Path,
        [System.Collections.IDictionary] $Directory
    )
    $FileSystem = Get-ChildItem -Filter * -Path $Path
    foreach ($F in $FileSystem) {
        if ($F.PSIsContainer) {
            $Directory[$F.Name] = [ordered] @{}
            New-Node -Path $F.FullName -Directory $Directory[$F.Name]
        } else {
            $Directory[$F.Name] = $F
        }
    }
}
function New-HTMLTreeFileNodes {
    [CmdletBinding()]
    param(
        [string] $Path,
        [switch] $IsExpanded,
        [string] $Filter,
        [switch] $RelativePath,
        [string] $Root
    )
    $FileSystem = Get-ChildItem -Filter * -Path $Path
    foreach ($F in $FileSystem) {
        if ($F.PSIsContainer) {
            New-HTMLTreeNode -Title $F.BaseName -Folder {
                New-HTMLTreeFileNodes -Path $F.FullName -IsExpanded:$IsExpanded.IsPresent -Filter $Filter -RelativePath:$RelativePath.IsPresent -Root $Path
            } -IsExpanded:$IsExpanded.IsPresent
        } else {
            if ($Filter) {
                if ($F.Name -notlike $Filter) {
                    continue
                }
            }
            if ($RelativePath) {
                $Link = $F.FullName.Replace("$Root\\", '')
            } else {
                $Link = $F.FullName
            }
            New-HTMLTreeNode -Title $F.Name -HrefLink $Link -Target 'contentFrame'
        }
    }
}


New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\..\Example-TreeView.html" {
    New-HTMLTreeChildCounter -Deep -HideZero -HideExpanded
    New-HTMLSection -Invisible {
        New-HTMLSection {
            New-HTMLTree -Checkbox none {
                New-HTMLTreeFileNodes -Path 'C:\Support\GitHub\PSWriteHTML\Examples' -Filter *.html -IsExpanded
            } -EnableChildCounter -AutoScroll
            New-HTMLSection -Invisible {
                New-HTMLFrame -Name 'contentFrame' -Scrolling Auto -Height 1500px
            }
        }
    }
} -Online -ShowHTML