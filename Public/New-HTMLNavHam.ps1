function New-HTMLNavHam {
    param(

    )
    #$Script:HTMLSchema.Features.NavigationMenu = $true
    $Script:HTMLSchema.Features.NavigationMultilevel = $true
    $Script:HTMLSchema.Features.FontsAwesome = $true
    $Script:HTMLSchema.Features.Jquery = $true

@"
<div id="menu">
            <nav>
                <h2><i class="fas fa-bars text-danger"></i>All Categories</h2>
                <ul>
                    <li>
                        <a href="#"><i class="fa fa-laptop"></i>Devices</a>
                        <h2><i class="fa fa-laptop"></i>Devices</h2>
                        <ul>
                            <li>
                                <a href="#"><i class="fa fa-phone"></i>Mobile Phones</a>
                                <h2><i class="fa fa-phone"></i>Mobile Phones</h2>
                                <ul>
                                    <li>
                                        <a href="#">Super Smart Phone</a>
                                    </li>
                                    <li>
                                        <a href="#">Thin Magic Mobile</a>
                                    </li>
                                    <li>
                                        <a href="#">Performance Crusher</a>
                                    </li>
                                    <li>
                                        <a href="#">Futuristic Experience</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-desktop"></i>Televisions</a>
                                <h2><i class="fa fa-desktop"></i>Televisions</h2>
                                <ul>
                                    <li>
                                        <a href="#">Flat Super Screen</a>
                                    </li>
                                    <li>
                                        <a href="#">Gigantic LED</a>
                                    </li>
                                    <li>
                                        <a href="#">Power Eater</a>
                                    </li>
                                    <li>
                                        <a href="#">3D Experience</a>
                                    </li>
                                    <li>
                                        <a href="#">Classic Comfort</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-camera-retro"></i>Cameras</a>
                                <h2><i class="fa fa-camera-retro"></i>Cameras</h2>
                                <ul>
                                    <li>
                                        <a href="#">Smart Shot</a>
                                    </li>
                                    <li>
                                        <a href="#">Power Shooter</a>
                                    </li>
                                    <li>
                                        <a href="#">Easy Photo Maker</a>
                                    </li>
                                    <li>
                                        <a href="#">Super Pixel</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-book"></i>Magazines</a>
                        <h2><i class="fa fa-book"></i>Magazines</h2>
                        <ul>
                            <li>
                                <a href="#">National Geographics</a>
                            </li>
                            <li>
                                <a href="#">The Spectator</a>
                            </li>
                            <li>
                                <a href="#">Rambler</a>
                            </li>
                            <li>
                                <a href="#">Physics World</a>
                            </li>
                            <li>
                                <a href="#">The New Scientist</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-shopping-cart"></i>Store</a>
                        <h2><i class="fa fa-shopping-cart"></i>Store</h2>
                        <ul>
                            <li>
                                <a href="#"><i class="fa fa-tags"></i>Clothes</a>
                                <h2><i class="fa fa-tags"></i>Clothes</h2>
                                <ul>
                                    <li>
                                        <a href="#"><i class="fa fa-female"></i>Women's Clothing</a>
                                        <h2><i class="fa fa-female"></i>Women's Clothing</h2>
                                        <ul>
                                            <li>
                                                <a href="#">Tops</a>
                                            </li>
                                            <li>
                                                <a href="#">Dresses</a>
                                            </li>
                                            <li>
                                                <a href="#">Trousers</a>
                                            </li>
                                            <li>
                                                <a href="#">Shoes</a>
                                            </li>
                                            <li>
                                                <a href="#">Sale</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-male"></i>Men's Clothing</a>
                                        <h2><i class="fa fa-male"></i>Men's Clothing</h2>
                                        <ul>
                                            <li>
                                                <a href="#">Shirts</a>
                                            </li>
                                            <li>
                                                <a href="#">Trousers</a>
                                            </li>
                                            <li>
                                                <a href="#">Shoes</a>
                                            </li>
                                            <li>
                                                <a href="#">Sale</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">Jewelry</a>
                            </li>
                            <li>
                                <a href="#">Music</a>
                            </li>
                            <li>
                                <a href="#">Grocery</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Collections</a>
                    </li>
                    <li>
                        <a href="#">Credits</a>
                    </li>
                </ul>
            </nav>
        </div>

"@


    New-HTMLTag -Tag 'script' {
        @"
        // HTML markup implementation, overlap mode, initilaize collapsed
        `$('#menu').multilevelpushmenu({
            containersToPush: [`$('#pushobj')],
            menuWidth: '200px',
            menuHeight: '100%',
            collapsed: true,
            mode: 'cover',
            // Just for fun also changing the look of the menu
            wrapperClass: 'mlpm_w',
            menuInactiveClass: 'mlpm_inactive'
        });
        `$(window).resize(function () {
            `$('#menu').multilevelpushmenu('redraw');
        });
"@
    }
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