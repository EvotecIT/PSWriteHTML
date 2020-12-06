Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -TitleText 'My Ubiquiti Network' -Online:$true -FilePath $PSScriptRoot\Example-NodesEdgesOptions.html {
    New-HTMLPanel {
        New-HTMLDiagram -Height '1024px' {
            New-DiagramOptionsInteraction -Hover $true
            New-DiagramOptionsPhysics -Enabled $true
            #New-DiagramOptionsLayout -RandomSeed 0
            New-DiagramOptionsLinks -ArrowsToEnabled $true -Color BlueViolet -ArrowsToType arrow -ArrowsFromEnabled $false -Length 400
            New-DiagramOptionsNodes -BorderWidth 1 -FontColor Brown -Size 20 -FontMulti true
            New-DiagramNode -Label 'Test' -IconBrands apple
            New-DiagramNode -Label 'USG Pro' -To 'Unifi Switch' -IconSolid cloud -IconAsImage
            New-DiagramNode -Label 'Unifi Switch' -To 'Unifi AP', "EvoWin" -IconSolid network-wired -IconAsImage
            New-DiagramNode -Label 'Unifi AP' -To 'EvoMac', "EvoWin" -IconSolid wifi -IconAsImage
            New-DiagramNode -Label 'EvoMac' -IconSolid laptop -IconAsImage
            New-DiagramNode -Id 'EvoWin' -Label "EvoWin`r`n192.168.20.15"  -To 'Exch1', 'Exch2', 'AD1', 'AD2', 'AD3', 'DC1', 'DC2' -IconSolid desktop -FontColor Green -IconAsImage
            New-DiagramNode -Label 'Exch1' -Shape diamond
            New-DiagramNode -Label 'Exch2' -IconBrands stack-exchange
            New-DiagramNode -Label 'Exch3' -IconBrands apple
            New-DiagramNode -Label 'Exch4' -IconBrands apple-pay -IconColor Silver -FontColor Green -X -300
            New-DiagramNode -Label 'AD1' -ColorBorder Black -ColorBackground Red -Image 'https://cdn.imgbin.com/18/1/14/imgbin-active-directory-microsoft-powershell-lightweight-directory-access-protocol-colossus-YaNhkKVhzC7F48Yd8YiNy2YKw.jpg'
            New-DiagramNode -Label 'AD2' -IconSolid ad -IconAsImage #-X 0 -Y 0 #-IconColor BlueViolet
            New-DiagramNode -Label 'AD3' -IconSolid ad -IconAsImage #-X 500 -Y -1000
            New-DiagramNode -Label 'DC1' -IconSolid ad -IconAsImage #-X -500 -Y -500 #-FixedX $true -FixedY $false
            New-DiagramNode -Label 'DC2' -IconSolid ad -IconAsImage #-X 500 -Y 500
            New-DiagramLink -From 'USG Pro', 'AD3' -To 'DC1', 'AD3' -ArrowsToEnabled -ArrowsMiddleEnabled -ArrowsFromEnabled -Color Green -Dashes $true -Label 'Test'
            New-DiagramLink -From 'DC1' -To 'DC2' -Label 'This is my label' -FontColor HotPink -ArrowsToEnabled
        }
    }
} -ShowHTML