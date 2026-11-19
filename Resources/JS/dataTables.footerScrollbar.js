(function ($) {
    "use strict";

    $(document).on("init.dt.pswhFooterScrollbar", function (event, settings) {
        if (!settings.oInit.pswhFooterScrollbar || !settings.nScrollBody) {
            return;
        }

        const table = new $.fn.dataTable.Api(settings);
        const body = settings.nScrollBody;
        const rail = document.createElement("div");
        const track = document.createElement("div");
        rail.className = "pswh-footer-scrollbar";
        rail.hidden = true;
        rail.tabIndex = 0;
        rail.setAttribute("role", "region");
        rail.setAttribute("aria-label", "Scroll table horizontally");
        rail.setAttribute("aria-controls", settings.nTable.id);
        rail.dir = window.getComputedStyle(body).direction;
        rail.append(track);
        body.after(rail);

        let frame = 0;
        function update() {
            frame = 0;
            const bounds = body.getBoundingClientRect();
            const viewportHeight = document.documentElement.clientHeight;
            // FixedHeader can move the footer into a separate viewport-positioned host.
            const floatingFooter = settings._fixedHeader?.dom.footer.floatingParent[0];
            const footer = floatingFooter?.isConnected ? floatingFooter.getBoundingClientRect() : null;
            const bottom = footer && footer.height && footer.bottom > 0 ? Math.min(footer.top, viewportHeight) : viewportHeight;
            // Keep the native scrollbar when it is reachable.
            rail.hidden = !body.clientWidth || body.scrollWidth <= body.clientWidth ||
                bounds.top >= bottom || bounds.bottom <= bottom + 1;
            if (!rail.hidden) {
                rail.style.left = bounds.left + body.clientLeft + "px";
                rail.style.width = body.clientWidth + "px";
                rail.style.bottom = viewportHeight - bottom + "px";
                track.style.width = body.scrollWidth + "px";
                rail.scrollLeft = body.scrollLeft;
            }
        }

        function scheduleUpdate() {
            if (!frame) {
                frame = window.requestAnimationFrame(update);
            }
        }

        rail.addEventListener("scroll", function () {
            if (!rail.hidden && body.scrollLeft !== rail.scrollLeft) {
                body.scrollLeft = rail.scrollLeft;
            }
        });
        function syncFromBody() {
            if (!rail.hidden && rail.scrollLeft !== body.scrollLeft) {
                rail.scrollLeft = body.scrollLeft;
            }
        }
        body.addEventListener("scroll", syncFromBody, { passive: true });
        window.addEventListener("scroll", scheduleUpdate, { capture: true, passive: true });
        window.addEventListener("resize", scheduleUpdate);
        table.on("draw.dt.pswhFooterScrollbar column-sizing.dt.pswhFooterScrollbar", scheduleUpdate);

        const resizeObserver = typeof ResizeObserver === "function" ? new ResizeObserver(scheduleUpdate) : null;
        if (resizeObserver) {
            resizeObserver.observe(body);
            resizeObserver.observe(settings.nTable);
        }
        table.one("destroy.dt.pswhFooterScrollbar", function () {
            table.off(".pswhFooterScrollbar");
            window.removeEventListener("scroll", scheduleUpdate, true);
            window.removeEventListener("resize", scheduleUpdate);
            body.removeEventListener("scroll", syncFromBody);
            window.cancelAnimationFrame(frame);
            if (resizeObserver) {
                resizeObserver.disconnect();
            }
            rail.remove();
        });
        scheduleUpdate();
    });
})(jQuery);
