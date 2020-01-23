var tabs = tabbis.init({
    tabGroup: "[data-tabs]",
    paneGroup: "[data-panes]",
    tabActive: "active",
    paneActive: "active",
    callback: function (tab, pane) {
        // console.log("TAB id:" + tab.id);
        // console.log(pane.id);
        var tableid = document.getElementById(tab.id + "-Content").querySelector('table[id^="DT-"]').id;
        // console.log(tableid);
        // this makes sure to refresh tables on tab change to make sure they have buttons and everything
        // it's a bit heavy as it touches all tables, may require some improvements in future to consider
        // which tab has which table
        try {
            $("#" + tableid).DataTable().columns.adjust().responsive.recalc();
        } catch (e) {
            console.log('No datatables available.');
        }
    }
});

// in theory should take care of removing local storage for tabbis
// some errors occurs if the local storage is not cleaned after a while
window.addEventListener("unload", tabbis.remove, false);
