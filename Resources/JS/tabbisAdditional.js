var tabs = tabbis.init({
    tabGroup: "[data-tabs]",
    paneGroup: "[data-panes]",
    tabActive: "active",
    paneActive: "active",
    callback: function (tab, pane) {
        // Ensure redraw runs after pane becomes visible
        try {
            var id = (tab && tab.id ? (tab.id + "-Content") : (pane && pane.id ? pane.id : null));
            if (id) {
                setTimeout(function () {
                    try { findObjectsToRedraw(id); } catch (e) {}
                    try { document.dispatchEvent(new CustomEvent('pswh:tab:shown', { detail: { id: id } })); } catch (e) {}
                }, 80);
            }
        } catch (e) {}
    }
});

// Safely clear tab memory on unload (if supported)
try {
    if (tabbis && typeof tabbis.reset === 'function') {
        window.addEventListener("unload", tabbis.reset, false);
    }
} catch (e) {}
