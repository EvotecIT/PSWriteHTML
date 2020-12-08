var tabs = tabbis.init({
    tabGroup: "[data-tabs]",
    paneGroup: "[data-panes]",
    tabActive: "active",
    paneActive: "active",
    callback: function (tab, pane) {
        // console.log("TAB id:" + tab.id + pane.id + tableid);
        // this makes sure to refresh tables on tab change to make sure they have buttons and everything
        // it's a bit heavy as it touches all tables, may require some improvements in future to consider
        // which tab has which table
        try {
            // Initially it was useed with ID, but if people use their own naming no tables were found
            //var table = document.getElementById(tab.id + "-Content").querySelectorAll('table[id^="DT-"]');
            var table = document.getElementById(tab.id + "-Content").querySelectorAll('table');
            table.forEach(resizeTable);
        } catch (e) {
            console.log('No datatables available.');
        }
        // redrawCalendar
        try {
            var calendar = document.getElementById(tab.id + "-Content").querySelectorAll('div[id^="Calendar-"]');
            calendar.forEach(redrawCalendar);
        } catch (e) {
            console.log('No calendars available.');
        }
        // redrawDiagram
        try {
            var diagram = document.getElementById(tab.id + "-Content").querySelectorAll('div.diagram[id^="Diagram-"');
            diagram.forEach(redrawDiagram);
        } catch (e) {
            console.log('No diagrams available.');
        }
    }
});

// in theory should take care of removing local storage for tabbis
// some errors occurs if the local storage is not cleaned after a while
window.addEventListener("unload", tabbis.remove, false);
