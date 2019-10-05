var tabs = tabbis.init({
    tabGroup: "[data-tabs]",
    paneGroup: "[data-panes]",
    tabActive: "active",
    paneActive: "active",
    callback: function (tab, pane) {
        console.log(tab);
        console.log(pane);
    }
});