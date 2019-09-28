Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My Ubiquiti Network' -UseCssLinks:$true -UseJavaScriptLinks:$true -FilePath $PSScriptRoot\Example-NodesEdgesOptions.html {
    New-HTMLTab -IconRegular address-book {
        New-HTMLSection -HeaderText 'Diagram - My Network' -CanCollapse {
            New-HTMLPanel {
                New-HTMLDiagram {
                    New-DiagramOptionsInteraction -Hover $true
                    New-DiagramOptionsPhysics -Enabled $false
                    New-DiagramOptionsLayout -RandomSeed 0
                    New-DiagramOptionsEdges -ArrowsToEnabled $true -Color BlueViolet -ArrowsToType arrow -ArrowsFromEnabled $false
                    New-DiagramOptionsNodes -BorderWidth 1 -FontColor Brown -Size 20 -FontMulti true
                    New-DiagramNode -Label 'USG Pro' -To 'Unifi Switch' -IconSolid cloud
                    New-DiagramNode -Label 'Unifi Switch' -To 'Unifi AP', "EvoWin" -IconSolid network-wired
                    New-DiagramNode -Label 'Unifi AP' -To 'EvoMac', "EvoWin" -IconSolid wifi
                    New-DiagramNode -Label 'EvoMac' -IconSolid laptop
                    New-DiagramNode -Id 'EvoWin' -Label "EvoWin`r`n192.168.20.15"  -To 'Exch1', 'Exch2', 'AD1', 'AD2', 'AD3', 'DC1', 'DC2' -IconSolid desktop -FontColor Green
                    New-DiagramNode -Label 'Exch1' -Shape diamond
                    New-DiagramNode -Label 'Exch2' -IconBrands stack-exchange
                    New-DiagramNode -Label 'Exch3' -IconBrands apple
                    New-DiagramNode -Label 'Exch4' -IconBrands apple-pay
                    New-DiagramNode -Label 'AD1' -ColorBorder Black -ColorBackground Red -Image 'https://cdn.imgbin.com/18/1/14/imgbin-active-directory-microsoft-powershell-lightweight-directory-access-protocol-colossus-YaNhkKVhzC7F48Yd8YiNy2YKw.jpg'
                    New-DiagramNode -Label 'AD2' -IconSolid ad -X 0 -Y 0 #-IconColor BlueViolet
                    New-DiagramNode -Label 'AD3' -IconSolid ad -X 500 -Y -1000
                    New-DiagramNode -Label 'DC1' -IconSolid ad -X -500 -Y -500 #-FixedX $true -FixedY $false
                    New-DiagramNode -Label 'DC2' -IconSolid ad -X 500 -Y 500
                    New-DiagramLink -From 'USG Pro','AD3' -To 'DC1', 'AD3' -ArrowsToEnabled $false -ArrowsMiddleEnabled $true -ArrowsFromEnabled $false -Color Green -Dashes $true -Label 'Test'
                    New-DiagramLink -From 'DC1' -To 'DC2' -Label 'This is my label' -FontColor HotPink -ArrowsToEnabled $true
                }
            }
        }
    }
} -ShowHTML