Import-Module .\PSWriteHTML.psd1 -Force

$Services = @{
    'Active Directory' = @{
        'Texas'  = @{
            ServiceStatus     = 'Operational'
            Icon       = 'Good'
            Percentage = '100%'
        }
        'Boston' = @{
            ServiceStatus     = 'Operational'
            Icon       = 'Good'
            Percentage = '100%'
        }
    }
    'Hyper-V'          = @{
        'California' = @{
            ServiceStatus     = 'Operational'
            Icon       = 'Bad'
            Percentage = '30%'
        }
        'Warsaw'     = @{
            ServiceStatus     = 'Operational'
            Icon       = 'Dead'
            Percentage = '70%'
        }
    }
}


New-HTML -TitleText 'Services Status' -Online {
    New-HTMLSection -Invisible {
        New-HTMLContainer -Width '900px' -Margin 'auto' {

            foreach ($_ in $Services.Keys) {

                New-HTMLHeading -Heading h1 -HeadingText "Current Status $_"

                New-HTMLPanel -Invisible {
                    New-HTMLStatus {

                        foreach ($SubService in $Services["$_"].Keys) {
                            $Splat = $Services["$_"][$SubService]
                            New-HTMLStatusItem -ServiceName $SubService @Splat
                        }

                    }
                }
            }
        }
    }
} -FilePath $PSScriptRoot\StatusPage06.html -ShowHTML