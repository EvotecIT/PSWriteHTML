Import-Module .\PSWriteHTML.psd1 -Force

New-HTML -Online -FilePath $PSScriptRoot\Example-LotsOfTexts.html {
    New-HTMLDiagram -Height "1500px" {
        New-DiagramOptionsLinks -FontSize 12 -WidthConstraint 90
        New-DiagramOptionsNodes -WidthConstraintMaximum 200 -Margin 10 -Shape box
        New-DiagramOptionsPhysics -Enabled $false

        New-DiagramNode -id 100 -Label "This node has no fixed, minimum or maximum width or height" -X -50 -Y -300
        New-DiagramNode -id 210 -WidthConstraintMinimum 120 -Label "This node has a mimimum width" -X -400 -Y -200
        New-DiagramNode -id 211 -WidthConstraintMinimum 120 -Label "...so does this" -X -500 -Y -50
        New-DiagramNode -id 220 -WidthConstraintMinimum 170 -Label "This node has a maximum width and breaks have been automatically inserted into the Label" -X -150 -Y -150
        New-DiagramNode -id 221 -WidthConstraintMinimum 170 -Label "...this too" -X -100 -Y 0
        New-DiagramNode -id 200 -FontMulti html -WidthConstraintMinimum 150 -Label: "<b>This</b> node has a fixed width and breaks have been automatically inserted into the Label" -X -300 -Y 50
        New-DiagramNode -id 201 -WidthConstraintMinimum 150 -Label "...this as well" -X -300 -Y 200
        New-DiagramNode -id 300 -HeightConstraintMinimum 70  -Label "This node`nhas a`nminimum`nheight" -X 100 -Y -150
        New-DiagramNode -id 301 -HeightConstraintMinimum 70  -Label "...this one here too" -X 100 -Y 0
        New-DiagramNode -id 400 -HeightConstraintMinimum 100 -HeightConstraintVAlign "top" -Label "Minimum height`nvertical alignment`nmay be top" -X 300 -Y -200
        New-DiagramNode -id 401 -HeightConstraintMinimum 100 -HeightConstraintVAlign "middle" -Label "Minimum height`nvertical alignment`nmay be middle`n(default)" -X 300 -Y 0
        New-DiagramNode -id 402 -HeightConstraintMinimum 100 -HeightConstraintVAlign "bottom" -Label "Minimum height`nvertical alignment`nmay be bottom" -X 300 -Y 200

        New-DiagramLink -from 100 -to 210 -Label "unconstrained to minimum width"
        New-DiagramLink -from 210 -to 211 -Label "more minimum width"
        New-DiagramLink -from 100 -to 220 -Label "unconstrained to maximum width"
        New-DiagramLink -from 220 -to 221 -Label "more maximum width"
        New-DiagramLink -from 210 -to 200 -Label "minimum width to fixed width"
        New-DiagramLink -from 220 -to 200 -Label "maximum width to fixed width"
        New-DiagramLink -from 200 -to 201 -Label "more fixed width"
        New-DiagramLink -from 100 -to 300 -Label "unconstrained to minimum height"
        New-DiagramLink -from 300 -to 301 -Label "more minimum height"
        New-DiagramLink -from 100 -to 400 -Label "unconstrained to top valign"
        New-DiagramLink -from 400 -to 401 -Label "top valign to middle valign"
        New-DiagramLink -from 401 -to 402 -widthConstraint 150 -Label "middle valign to bottom valign"
    }
} -ShowHTML