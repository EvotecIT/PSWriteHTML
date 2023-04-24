
New-HTML {

    New-HTMLSection {
        New-HTMLSectionStyle -BorderRadius 0px -HeaderBackGroundColor Grey -RemoveShadow
        New-HTMLPanel -BackgroundColor lightpink -AlignContentText right -BorderRadius 10px {
            New-HTMLText -TextBlock {
                New-HTMLText -Text "Test" -Alignment left -FontSize 25 -FontWeight bold
                New-HTMLText -Text 'Users Never Loged' -Alignment left -FontSize 15
                New-HTMLFontIcon -IconRegular address-book -IconSize 20
            }
        }

        New-HTMLPanel -Margin 10 {

            New-HTMLPanel -BackgroundColor lightpink -AlignContentText right -BorderRadius 0px {
                New-HTMLText -TextBlock {
                    New-HTMLText -Text $neverlogedenabled -Alignment left -FontSize 25 -FontWeight bold
                    New-HTMLText -Text 'Users Never Loged' -Alignment left -FontSize 15
                    New-HTMLFontIcon -IconRegular address-book -IconSize 20
                }
            }
        }
        New-HTMLPanel -Margin 10 {

            New-HTMLPanel -BackgroundColor khaki -AlignContentText right {
                New-HTMLText -Text 30 -Alignment left -FontSize 40 -FontWeight bold
                New-HTMLText -Text "Computers deleted" -Alignment left -FontSize 20
                New-HTMLFontIcon -IconSolid desktop -IconSize 20
            }
        }
        New-HTMLPanel -Margin 10 {

            New-HTMLPanel -BackgroundColor lightgreen -AlignContentText right -BorderRadius 10px {
                New-HTMLText -TextBlock {
                    New-HTMLText -Text 15 -Alignment justify -FontSize 25 -FontWeight bold
                    New-HTMLText -Text 'Disabled Users' -Alignment justify -FontSize 15
                    New-HTMLFontIcon -IconRegular address-book -IconSize 20
                }
            }
        }
    }

} -ShowHTML -FilePath $PSScriptRoot\Example01-Panels.html -Online
