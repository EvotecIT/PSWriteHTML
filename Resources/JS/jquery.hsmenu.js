/*
    Plugin: hs Menu (Modern Mega Menu)
    Frameworks: jQuery 3.3.1 & Material Design Iconic Font 2.0
    Author: Asif Mughal
    GitHub: https://github.com/CodeHimBlog
    URL: https://www.codehim.com
    License: MIT License
    Copyright (c) 2019 - Asif Mughal
*/
(function ($) {
    $.fn.hsMenu = function (options) {
        var setting = $.extend({
            bgFading: true, //(false to disable) background dim overlay when side navigation drawer open
            outClickToClose: true, // (false to disable) close opened items if user click outside of them
            navControls: true, // (false to disable) provide buttons to allow visitors to increase some width and height of drawer
            fixedMenubar: true, //false to static
            fixedMenu: false,
            disableHamburger: false,
            startMenuOpen: false,
            resizeContent: false,
            menuWidth: 270,
            menuWidthExtended: 320,
        }, options);

        return this.each(function () {

            var $hsNav, navControlBoard, setFullHeight, setSomeWidth, dimBG;

            $hsNav = $(".hs-navigation");

            if (setting.fixedMenu) {
                // lets overwrite some settings to provide this functionality
                setting.startMenuOpen = true;
                setting.resizeContent = true;
                setting.outClickToClose = false;
                setting.disableHamburger = true;
            }

            if (setting.startMenuOpen) {
                $(this).toggleClass("ripple-out");
                $($hsNav).toggleClass("open");
                if (setting.resizeContent) {
                    $(".main-section").css("margin-left", setting.menuWidth + "px");
                }
            }

            if (setting.bgFading == true) {

                dimBG = $div();

                $(dimBG).addClass("dim-overlay").insertAfter($hsNav);

            }
            if (setting.fixedMenubar == true) {

                $(this).addClass("sticky");

            }

            $(".toggle").click(function () {

                $(this).toggleClass("ripple-out");

                $reveal = $(this).attr('data-reveal');
                $allRevealable = ".grid-items, .user-penal, .user-info";

                if ($($reveal).hasClass("fadeInUp")) {
                    $($reveal).removeClass("fadeInUp")
                        .fadeOut();

                } else {
                    $($reveal).fadeIn().addClass("fadeInUp");

                }

                $($allRevealable)
                    .not($reveal).removeClass("fadeInUp ripple-out").fadeOut();


            });

            if (setting.disableHamburger !== true) {
                $(".menu-trigger").click(function () {

                    $(this).toggleClass("ripple-out");

                    $($hsNav).toggleClass("open");

                    $(dimBG).toggle(500);


                });
            }

            // Search Form Functionality

            var $input = $(".search-box").find("input");


            $(".search-trigger").click(function () {


                $(this).toggleClass("ripple-out");

                $(this).find(".zmdi").removeClass("zmdi-search").addClass("zmdi-close");


                if ($(this).hasClass("ripple-out")) {
                    $(".search-box").animate({
                        'width': '250px',


                    }, 500, function () {
                        $input.focus();

                    });

                } else {
                    $(".search-box").animate({
                        'width': '0px',

                    }, 500);

                    $(this).find(".zmdi").removeClass("zmdi-close").addClass("zmdi-search");

                }


            });

            $($input).keyup(function () {
                if ($(this).val().length > 0) {
                    $(".search-submit").attr("disabled", false);

                } else {
                    $(".search-submit").attr("disabled", true);

                }
            });


            if (setting.outClickToClose == true) {

                //Close user penal, hs navigation, user info or grid items if user click outside of them

                $(window).click(function (e) {
                    if ($(e.target)
                        .closest('.more-trigger, .grid-trigger,  .user-penal, .grid-items, .menu-trigger, .hs-navigation, .hs-user, .user-info')
                        .length) {

                        return;
                    }

                    $(".user-penal, .grid-items, .user-info").fadeOut()
                        .removeClass("fadeInUp");

                    $($hsNav).removeClass("open");
                    $(dimBG).fadeOut();

                });
            }
            // Nav controls
            if (setting.navControls == true) {

                navControlBoard = $div();

                setFullHeight = $button();

                setSomeWidth = $button();

                $(setFullHeight)
                    .html("<i class='zmdi zmdi-unfold-more'></i>")
                    .addClass("nav-fixed")
                    .appendTo(navControlBoard);

                $(setSomeWidth)
                    .addClass("nav-full")
                    .html("<i class='zmdi zmdi-crop-free'></i>")
                    .appendTo(navControlBoard);

                $(navControlBoard)
                    .addClass("nav-controls")
                    .prependTo(".hs-navigation");


                $(".nav-fixed").on("click", function (x) {
                    x = $(this).find(".zmdi");

                    if (x.hasClass("zmdi-unfold-more")) {

                        $($hsNav).animate({
                            'position': 'fixed',
                            'top': 0,


                        }, 400, function () {

                            $($hsNav).css({
                                'overflow': 'auto',

                            });
                            x.removeClass("zmdi-unfold-more").addClass("zmdi-unfold-less");

                        });


                    } else {
                        $($hsNav).animate({
                            'top': '50px',

                        }, 400, function () {
                            $($hsNav).css({
                                'overflow': 'hidden',

                            });
                            x.addClass("zmdi-unfold-more").removeClass("zmdi-unfold-less");
                        });


                    }


                });

                // To increase some width of the side navigation

                $(".nav-full").click(function (x) {
                    x = $(this).find(".zmdi");

                    if (x.hasClass("zmdi-crop-free")) {

                        x.removeClass("zmdi-crop-free").addClass("zmdi-aspect-ratio-alt");

                        $(".hs-navigation").width(setting.menuWidthExtended + "px");

                        if (setting.resizeContent) {
                            $(".main-section").css("margin-left", setting.menuWidthExtended + "px");
                        }

                    } else {
                        $(".hs-navigation").width(setting.menuWidth + "px");

                        if (setting.resizeContent) {
                            $(".main-section").css("margin-left", setting.menuWidth + "px");
                        }

                        x.addClass("zmdi-crop-free").removeClass("zmdi-aspect-ratio-alt");
                    }

                });

            }

            // User Info

            $(".hs-user").click(function () {

                var $thisPic = $(this).find("img").clone();

                $(".profile-pic").html($thisPic);


            });


            // Nested Dropdowns

            $(".its-parent").click(function () {

                $(this).siblings(".its-children").slideToggle();

                $(this).toggleClass("downed");


            });

            function $div() {
                return document.createElement("div");
            }

            function $button() {
                return document.createElement("button");
            }

        });
    };

})(jQuery);