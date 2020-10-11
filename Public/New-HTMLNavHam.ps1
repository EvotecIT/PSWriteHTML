function New-HTMLNavHam {
    param(

    )
    $Script:HTMLSchema.Features.NavigationMenu = $true

}

<#
function Test-Me {
    param(
        [scriptblock] $Test
    )
    & $Test
}

Test-Me {
    Test-Me {
        Write-Host '5'
        Test-Me {
            Write-Host '7'
        }
    }

    Test-Me {
        Write-Host '6'
    }
}
#>