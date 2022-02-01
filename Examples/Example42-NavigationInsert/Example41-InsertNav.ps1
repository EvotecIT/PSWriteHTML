Import-Module .\PSWriteHTML.psd1 -Force

$Files = Get-ChildItem -LiteralPath $PSScriptRoot\pages

$Navitation = New-HTMLNavTop -Logo 'https://evotec.xyz/wp-content/uploads/2021/04/Logo-evotec-bb.png' -LogoLinkHome {
    New-NavTopMenu -Name 'Domains' -IconRegular address-book {
        New-NavLink -IconMaterial airplane -Name 'This is internal link 1' -InternalPageID 'Page 1'
        New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link to evotec' -IconColor Pink -NameColor Red
        New-NavLink -Name 'This is link 3' -IconBrands apple-pay {
            New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link 5'
            New-NavLink -IconSolid address-book -Name 'This is link 6' {
                New-NavLink -Name 'This is link 3' -IconBrands confluence {
                    New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link 5'
                    New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link 6'
                }
            }
        }
    }
    New-NavTopMenu -Name 'Domain Controllers' -IconSolid ambulance {
        New-NavLink -IconMaterial airplane -Name 'This is link 1' -InternalPageID 'Page 2'
        New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link 2'
        New-NavLink -IconBrands codiepie -Href 'https://evotec.xyz' -Name 'This is link 3'
    }
    New-NavTopMenu -Name 'Office 365' {
        New-NavLink -IconMaterial airplane -Href 'https://evotec.xyz' -Name 'This is link 1'
        New-NavLink -IconSolid address-book -Href 'https://evotec.xyz' -Name 'This is link 2'
        New-NavLink -IconBrands codiepie -Href 'https://evotec.xyz' -Name 'This is link 4'
    }
} -Convert #-MenuColor Black -MenuColorBackground Pink -HomeColorBackground Black -HomeColor Red

return

foreach ($File in $Files) {
    $HTMLContent = Get-Content -Raw -LiteralPath $File.FullName
    $HTMLContent.Replace('<body>')
}