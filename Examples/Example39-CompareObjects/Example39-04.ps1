Import-Module .\PSWriteHTML.psd1 -Force


$Object1 = [PSCustomObject] @{
    "Name"    = "Przemyslaw Klys"
    "Age"     = "30"
    "Address" = @{
        "Street"  = "Kwiatowa"
        "City"    = "Warszawa"
        "Country" = [ordered] @{
            "Name" = "Poland"
        }
        List      = @(
            [PSCustomObject] @{
                "Name" = "Adam Klys"
                "Age"  = "32"
            }
            [PSCustomObject] @{
                "Name" = "Justyna Klys"
                "Age"  = "33"
            }
            [PSCustomObject] @{
                "Name" = "Justyna Klys"
                "Age"  = 30
            }
            [PSCustomObject] @{
                "Name" = "Justyna Klys"
                "Age"  = $null
            }
        )
    }
    ListTest  = @(
        [PSCustomObject] @{
            "Name" = "Sława Klys"
            "Age"  = "33"
        }
    )
}

$Object2 = [PSCustomObject] @{
    "Name"    = "Przemyslaw Klys"
    "Age"     = "30"
    "Address" = @{
        "Street"  = "Kwiatowa"
        "City"    = "Warszawa"
        "Country" = [ordered] @{
            "Name" = "Gruzja"
        }
        List      = @(
            [PSCustomObject] @{
                "Name" = "Adam Klys"
                "Age"  = "32"
            }
            [PSCustomObject] @{
                "Name" = "Pankracy Klys"
                "Age"  = "33"
            }
            [PSCustomObject] @{
                "Name" = "Justyna Klys"
                "Age"  = 30
            }
            [PSCustomObject] @{
                "Name" = "Justyna Klys"
                "Age"  = $null
            }
        )
    }
    ListTest  = @(
        [PSCustomObject] @{
            "Name" = "Sława Klys"
            "Age"  = "33"
        }
    )
}

#Compare-MultipleObjects -Objects $Object1, $Object2 -FlattenObject | Format-Table

$Object1,$Object2 | Out-HtmlView -Compare -HighlightDifferences -Filtering -WordBreak break-all -FlattenObject