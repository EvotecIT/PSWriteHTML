/*  Plugin: Codehim Dropdown (Multilevel Dropdowns to Off Canvas)
 *   Requires: jQuery 1.7 or higher
 *   Author: Asif Mughal
 *   GitHub: https://github.com/CodeHimBlog
 *   URL: https://www.codehim.com
 *   License: MIT License
 *   Copyright (c) 2018 - Asif Mughal
 */
(function ($) {
	$.fn.CodehimDropdown = function (options) {
		var setting = $.extend({
			skin: {
				"background-color": "#161B22",
				"color": 'green'
			}, //skin color for menubar and drawer
			skinHome: {
				"background-color": "#161B22",
				"color": 'red'
			}, //skin color for home icon and background
			slideUpOther: true, //close other opened dropdowns if user trigger new one
			sticky: true, //fixed menubar on top, false to static
			/* Some settings for mobile devices (small screen) when horizontal menubar converted into offcanvas menu */
			listAnimation: "fadeInUp", //Animate list items when revealed
			subListAnimation: "fadeInUp", //Animate sub items when revealed
			//@info: any animation can be used, put the name of animation class name from animate.css in the above options
			dimOverlay: true, //possible options true or false
			offCanvasSpeed: "default", //possible options are default, fast, faster, slow and slower
			offCanvasDirection: "left", //possible options are left and right
			offCanvasWidth: 290, //the width of drawer on mobile devices in pixels
			onOffCanvasOpen: function () { }, //your custom function to execute when menu open on mobile devices
			onOffCanvasClose: function () { }, //your custom function to execute when menu closed

		}, options);

		return this.each(function () {

			var target = $(this);
			var devWidth = $(window).width(); //available width of the device
			var devHeight = $(window).height(); //available height of the device
			var dimOverlay = $div(); //creates div element for dim overlay
			var hamburger = $div(); //creates div element for hamburger menu icon
			var offCanvas = $(target).find(".dropdown-items"); //looks on (small screen) mobile devices
			var homeLogo = $(target).find("li.home-link a"); // logo


			//Applying Customization

			if (setting.offCanvasDirection == "right") {
				$(offCanvas).css({
					'right': -(setting.offCanvasWidth),
					'display': 'block',
				});

				$(hamburger).addClass("hamburger right");
			} else {
				$(offCanvas).css({
					'left': -(setting.offCanvasWidth),
					'display': 'block',
				});
				$(hamburger).addClass("hamburger left");
			}

			if (setting.dimOverlay == true) {
				$(dimOverlay).addClass("dim-overlay").insertAfter(target);

			}

			//$(target).addClass(setting.skin).prepend(hamburger);
			$(target).css(setting.skin).prepend(hamburger);
			$(offCanvas).css(setting.skin);
			$(homeLogo).css(setting.skinHome);
			//$(offCanvas).addClass(setting.skin);


			//OffCanvas Speed
			var speed = setting.offCanvasSpeed;
			//assign values (in milliseconds) to speed
			switch (speed) {
				case "slow":
					speed = 1000;

					break;
				case "slower":

					speed = 2000;
					break;

				case "fast":

					speed = 300;
					break;

				case "faster":

					speed = 150;
					break;

				default:
					speed = 400;
			};

			if (setting.sticky == true) {
				$(target).addClass("sticky");

				$("main").css({
					'marginTop': 50,
				});
			}


			$(".dropdown-heading").click(function () {

				var thisMenu = $(this).find(" + .menu-items");

				var thisList = $(thisMenu).children("li");

				for (var i = 0; i < thisList.length; i++) {

					$(thisList).eq(i).addClass("animated" + " " + setting.listAnimation).css({
						'animationDelay': "0." + i + "s",

					});

				}


				$(this).toggleClass("active");


				$(thisMenu).slideToggle();


				//close other dropdowns if opened

				if (setting.slideUpOther == true) {

					$(".menu-items").not(thisMenu).slideUp();
					$(".dropdown-heading").not(this).removeClass("active");
				}

			});


			$(".parent").on("click", function () {

				var subMenu = $(this).siblings("ul");

				$(subMenu).slideToggle();

				var thisList = $(subMenu).children("li");

				for (var i = 0; i < thisList.length; i++) {

					$(thisList).eq(i).addClass("animated" + " " + setting.subListAnimation).css({
						'animationDelay': "0." + i + "s",

					});

				}
				//close other sub items if opened
				$(".has-child ul").not(subMenu).not($(this).parents("ul")).slideUp();

			});


			// Mobile Design

			$(hamburger).click(function () {
				$(this).toggleClass("active");

				openMenu();

				$(dimOverlay).fadeIn();


			});

			var offCanvasDirection = setting.offCanvasDirection;

			//Open Menu
			function openMenu() {

				switch (offCanvasDirection) {
					case "left":
						$(offCanvas).animate({
							'left': 0,

						}, speed, function () {

							setting.onOffCanvasOpen();

						});

						break;

					case "right":

						$(offCanvas).animate({
							'right': 0,

						}, speed, function () {

							setting.onOffCanvasOpen();

						});

						break;

					default:
						alert("you have missing the off canvas direction");


				};

			} //end open menu


			//Close Menu
			function closeMenu() {

				switch (offCanvasDirection) {
					case "left":
						$(offCanvas).animate({
							'left': -(setting.offCanvasWidth),

						}, speed, function () {

							$(hamburger).removeClass("active");
							setting.onOffCanvasClose();

						});

						break;

					case "right":

						$(offCanvas).animate({
							'right': -(setting.offCanvasWidth),

						}, speed, function () {

							$(hamburger).removeClass("active");
							setting.onOffCanvasClose();

						});

						break;

					default:
						alert("you have missing the off canvas direction");


				};

			} //end close menu


			//close menu if user click outside of it
			$(window).click(function (e) {
				if ($(e.target).closest('.codehim-dropdown').length) {
					return;
				}
				if ($(e.target).closest(offCanvas).length) {
					return;
				}

				//check if menu really opened
				if ($(hamburger).hasClass("active")) {

					closeMenu();

				}

				$(dimOverlay).fadeOut();

				$(".menu-items").slideUp();
				$(".dropdown-heading").removeClass("active");

			});


			// To get everything responsive

			responsive(); //responsive on document ready

			$(window).on("resize", function () {

				responsive();


			});


			function responsive(menuItemsWidth) {

				//to get the fresh device dimensions
				devWidth = $(window).width();
				devHeight = $(window).height();

				if (devWidth > 480) {
					$(offCanvas).width('100%');

				} else {
					$(offCanvas).width(setting.offCanvasWidth);
				}

				var mainLink = $(".dropdown-items").children("li");

				//getting the width of main items shown in the menubar
				menuItemsWidth = 0;
				for (var w = -1; w < mainLink.length; ++w) {

					menuItemsWidth += $(mainLink).eq(w).width();

					if (menuItemsWidth >= devWidth && devWidth > 480) {
						$(mainLink).eq(w).css({
							'display': 'none',

						});

					} else {
						$(mainLink).eq(w).css({
							'display': '', //default

						});

					}


				};

			} //reponsive


			function $div() {
				return document.createElement("div");
			}


		});
	};

})(jQuery);