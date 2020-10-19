Import-Module .\PSWriteHTML.psd1 -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster

$ImageLink = 'https://evotec.xyz/wp-content/uploads/2015/05/Logo-evotec-012.png'

New-HTML -TitleText $ReportTitle -Online -FilePath "$PSScriptRoot\Example3.html" {
    New-HTMLLogo -RightLogoString $ImageLink
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLSection  -HeaderText "Groups" {
            New-HTMLSection -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $DomainAdminTable -HideFooter
                }
            }
        }
        New-HTMLSection {

            $Data = @(
                'string dfdsfsdfsd fsdf sdf dsf sdfsdf sdf fsd fsd fsdf sdf sdf sdlfksd fsdjkf hsdfk hsdfks hfksdh fkshdf sdf sdf fs dfsdfdsfs dfsdfsdfsdfsdfsdsdfsdf sdfsdf sdfsf sdf fsdfsd fsdf sdfsdf sdfs dfsdfsd f'
                'string dfdsfsdfsd fsdf sdf dsf sdfsdf sdf fsd fsd fsdf sdf sdf sdlfksd fsdjkf hsdfk hsdfks hfksdh fkshdf sdf sdf fs dfsdfdsfs dfsdfsdfsdfsdfsdsdfsdf sdfsdf sdfsf sdf fsdfsd fsdf sdfsdf sdfs dfsdfsd f'
            )

            New-HTMLTable -DataTable $Data
        }
        New-HTMLSection {

            $Data = 'string dfdsfsdfsd fsdf sdf dsf sdfsdf sdf fsd fsd fsdf sdf sdf sdlfksd fsdjkf hsdfk hsdfks hfksdh fkshdf sdf sdf fs dfsdfdsfs dfsdfsdfsdfsdfsdsdfsdf sdfsdf sdfsf sdf fsdfsd fsdf sdfsdf sdfs dfsdfsd f string dfdsfsdfsd fsdf sdf dsf sdfsdf sdf fsd fsd fsdf sdf sdf sdlfksd fsdjkf hsdfk hsdfks hfksdh fkshdf sdf sdf fs dfsdfdsfs dfsdfsdfsdfsdfsdsdfsdf sdfsdf sdfsf sdf fsdfsd fsdf sdfsdf sdfs dfsdfsd f'

            New-HTMLTable -DataTable $Data
        }
        New-HTMLSection {

            $Data = 'stringfdggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddfffffffffffffffffffffffffffffffffffffffffffff'

            New-HTMLTable -DataTable $Data
        }
    }
    New-HTMLTab -TabName 'Something' {

    }
    New-HTMLTab -TabName 'This is very long title' {

    }
    New-HTMLTab -TabName 'This is long title' {

    }
} -ShowHTML

Stop-TimeLog -Time $Time -Option OneLiner