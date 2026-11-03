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
            skin: { "background-color": "#161B22", "color": "green" },
            skinHome: { "background-color": "#161B22", "color": "red" },
            slideUpOther: true,
            sticky: true,
            listAnimation: "fadeInUp",
            subListAnimation: "fadeInUp",
            dimOverlay: true,
            offCanvasSpeed: "default",
            offCanvasDirection: "left",
            offCanvasWidth: 290,
            onOffCanvasOpen: function () { },
            onOffCanvasClose: function () { }
        }, options);

        return this.each(function () {
            var target = $(this);
            if (target.data("codehim-ready")) { return; }
            target.data("codehim-ready", true);
            var offCanvas = target.children(".dropdown-items");
            var hamburger = $('<button type="button" class="hamburger" aria-label="Toggle navigation" aria-expanded="false"></button>');
            var dimOverlay = $('<div class="codehim-dim-overlay"></div>');
            var headings = target.find(".dropdown-heading, .has-child > .parent");
            var compact = false;
            var opened = false;
            var direction = setting.offCanvasDirection === "right" ? "right" : "left";
            var speeds = { slow: 1000, slower: 2000, fast: 300, faster: 150, "default": 400 };
            var speed = speeds[setting.offCanvasSpeed] || speeds.default;

            target.css(setting.skin).prepend(hamburger);
            offCanvas.css(setting.skin);
            target.find("li.home-link a").css(setting.skinHome).attr("aria-label", "Home");
            hamburger.addClass(direction);
            headings.attr("aria-expanded", "false");
            headings.not("a[href]").attr({ role: "button", tabindex: "0" });
            if (setting.dimOverlay) { dimOverlay.insertAfter(target); }
            if (setting.sticky) { target.addClass("sticky"); }

            function closeDropdowns(menus) {
                menus.stop(true, true).hide().prev(".dropdown-heading, .parent")
                    .removeClass("active").attr("aria-expanded", "false");
            }

            function setDrawer(open, restoreFocus) {
                var changed = opened !== open;
                opened = open;
                hamburger.toggleClass("active", open).attr("aria-expanded", String(open));
                offCanvas.attr("aria-hidden", String(!open)).prop("inert", !open);
                var position = {};
                position[direction] = open ? 0 : -offCanvas.outerWidth();
                offCanvas.stop(true, true).animate(position, speed);
                dimOverlay.stop(true, true).toggle(open && setting.dimOverlay);
                if (!open) { closeDropdowns(target.find(".menu-items, .menu-subitems")); }
                if (restoreFocus) { hamburger.trigger("focus"); }
                if (changed) {
                    if (open) { setting.onOffCanvasOpen(); }
                    else { setting.onOffCanvasClose(); }
                }
            }

            // Fixed dropdowns scroll independently without clipping their nested flyouts.
            function positionMenu(menu) {
                if (compact || !menu.is(":visible")) { return; }
                var parent = menu.prev()[0].getBoundingClientRect();
                var nested = menu.hasClass("menu-subitems");
                var width = menu.outerWidth();
                var viewportWidth = document.documentElement.clientWidth;
                var viewportHeight = document.documentElement.clientHeight;
                var left = nested ? parent.right : parent.left;
                if (nested && left + width > viewportWidth - 8) { left = parent.left - width; }
                left = Math.max(8, Math.min(left, viewportWidth - width - 8));
                var top = nested ? Math.min(parent.top, viewportHeight - Math.min(menu[0].scrollHeight, viewportHeight - 16) - 8) : target[0].getBoundingClientRect().bottom;
                top = Math.max(0, Math.min(top, viewportHeight - 48));
                menu.css({ left: left, top: top, "max-height": Math.max(0, viewportHeight - top - 8) });
            }

            headings.on("click", function () {
                var heading = $(this);
                var menu = heading.next("ul");
                var open = heading.attr("aria-expanded") !== "true";
                if (setting.slideUpOther || heading.hasClass("parent")) {
                    var siblings = heading.hasClass("parent") ? target.find(".menu-subitems") : target.find(".menu-items");
                    closeDropdowns(siblings.not(menu).not(heading.parents("ul")));
                }
                closeDropdowns(menu.find(".menu-subitems"));
                heading.toggleClass("active", open).attr("aria-expanded", String(open));
                menu.stop(true, true).css("max-height", "").toggle(open);
                if (open) {
                    heading.parents("li").removeClass("animated " + setting.listAnimation + " " + setting.subListAnimation);
                    positionMenu(menu);
                    var animation = heading.hasClass("parent") ? setting.subListAnimation : setting.listAnimation;
                    menu.children("li").addClass("animated " + animation);
                }
            }).on("keydown", function (event) {
                if (event.key === " " || (event.key === "Enter" && !$(this).is("a[href]"))) {
                    event.preventDefault();
                    $(this).trigger("click");
                }
            });

            hamburger.on("click", function () { setDrawer(!opened, false); });
            target.on("keydown", function (event) {
                if (event.key !== "Escape") { return; }
                if (compact && opened) { setDrawer(false, true); }
                else {
                    var menu = $(event.target).closest(".menu-items, .menu-subitems");
                    var heading = menu.length ? menu.prev() : $(event.target);
                    closeDropdowns(menu.length ? menu : target.find(".menu-items, .menu-subitems"));
                    heading.trigger("focus");
                }
            });
            target.on("click", ".menu-items a, .home-link a", function () {
                if (compact && opened) { setDrawer(false, true); }
                else { closeDropdowns(target.find(".menu-items, .menu-subitems")); }
            });
            $(document).on("click", function (event) {
                if (target[0].contains(event.target)) { return; }
                if (compact && opened) { setDrawer(false, false); }
                closeDropdowns(target.find(".menu-items, .menu-subitems"));
            });
            target.find(".menu-items, .menu-subitems").on("scroll", function () {
                if (!compact) {
                    $(this).find(".menu-subitems").each(function () { positionMenu($(this)); });
                }
            });

            function responsive() {
                var wasCompact = compact;
                var hadFocus = target[0].contains(document.activeElement);
                // Measure the unwrapped desktop row, including gaps, icons and the logo.
                target.removeClass("is-compact");
                offCanvas.css({ width: "", left: "", right: "" });
                var available = target[0].clientWidth;
                var logoWidth = target.children(".home-logo").outerWidth() || 0;
                compact = available <= 480 || offCanvas[0].scrollWidth + logoWidth > available;
                target.toggleClass("is-compact", compact);
                hamburger.prop("hidden", !compact);
                if (compact) {
                    offCanvas.css({ width: Math.min(setting.offCanvasWidth, available), left: "", right: "" });
                    if (!wasCompact) { setDrawer(false, hadFocus); }
                    else {
                        var position = {};
                        position[direction] = opened ? 0 : -offCanvas.outerWidth();
                        offCanvas.stop(true, true).css(position);
                    }
                } else {
                    if (wasCompact) {
                        setDrawer(false, false);
                    }
                    offCanvas.stop(true, true).css({ left: "", right: "" }).removeAttr("aria-hidden").prop("inert", false);
                    if (wasCompact && hadFocus) { offCanvas.find("a, [role=button]").first().trigger("focus"); }
                }
                target.find(".menu-items, .menu-subitems").css({ left: "", top: "", "max-height": "" }).each(function () {
                    positionMenu($(this));
                });
            }

            responsive();
            $(window).on("resize", responsive).on("scroll", function () {
                if (!compact) { closeDropdowns(target.find(".menu-items, .menu-subitems")); }
            });
            target.find(".home-logo img").on("load", responsive);
            if (window.ResizeObserver) {
                new ResizeObserver(responsive).observe(target[0]);
            }
            if (document.fonts && document.fonts.ready) { document.fonts.ready.then(responsive); }
        });
    };
})(jQuery);
