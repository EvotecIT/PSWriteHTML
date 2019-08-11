function openTab(evt, tabName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("insideTab");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" is-active", "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    try {
        document.getElementById(tabName).style.display = "block";
    } catch {
        // This error happens when someone forgot addng new TABS with proper names
        // Therefore style wouldn't exits on it.
    }
    evt.currentTarget.className += " active";
}