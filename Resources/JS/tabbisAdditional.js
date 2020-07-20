var tabs = tabbis.init({
    tabGroup: "[data-tabs]",
    paneGroup: "[data-panes]",
    tabActive: "active",
    paneActive: "active",
    callback: function (tab, pane) {
        // console.log("TAB id:" + tab.id);
        // console.log(pane.id);
        // console.log(tableid);
        // this makes sure to refresh tables on tab change to make sure they have buttons and everything
        // it's a bit heavy as it touches all tables, may require some improvements in future to consider
        // which tab has which table
        function resizeTable(table) {
            try {
                $("#" + table.id).DataTable().columns.adjust().responsive.recalc();
                console.log('Resized table with id ' + table.id);
            } catch{
                console.log('Failed to resize table with ' + table.id);
            }
        }
        try {
            var table = document.getElementById(tab.id + "-Content").querySelectorAll('table[id^="DT-"]');
            table.forEach(resizeTable)
        } catch (e) {
            console.log('No datatables available.');
        }

        // We need to make same thing for calendar
        function redrawCalendar(calendar) {
            //console.log(calendarTracker[calendar.id].view);
            calendarTracker[calendar.id].changeView(calendarTracker[calendar.id].view.type);
            console.log('Redrawing view for ' + calendar.id)
        }

        try {
            var calendar = document.getElementById(tab.id + "-Content").querySelectorAll('div[id^="Calendar-"]');
            calendar.forEach(redrawCalendar)
        } catch (e) {
            console.log('No calendars available.');
        }
    }
});

// in theory should take care of removing local storage for tabbis
// some errors occurs if the local storage is not cleaned after a while
window.addEventListener("unload", tabbis.remove, false);
