var tabs = tabbis.init({
    tabGroup: "[data-tabs]",
    paneGroup: "[data-panes]",
    tabActive: "active",
    paneActive: "active",
    callback: function (tab, pane) {
        // console.log("TAB id:" + tab.id + pane.id + tableid);
        // this makes sure to refresh tables on given tab change to make sure they have buttons and everything
        // which tab has which table
        findObjectsToRedraw(tab.id + "-Content");
    }
});

// in theory should take care of removing local storage for tabbis
// some errors occurs if the local storage is not cleaned after a while
window.addEventListener("unload", tabbis.remove, false);
