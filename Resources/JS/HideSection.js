function show(obj) {
    document.getElementById(obj).style.display = 'block';
    document.getElementById("hide_" + obj).style.display = '';
    document.getElementById("show_" + obj).style.display = 'none';
    // depending on flex-direction hiding is a bit different
    var topSectionDiv = document.getElementById(obj).parentNode
    var flexDirection = window.getComputedStyle(topSectionDiv).getPropertyValue("flex-direction");
    if (flexDirection == 'column') {
        //console.log('flexDirection 1' + flexDirection)
    } else {
        document.getElementById(obj).parentNode.classList.add('sectionShow');
        document.getElementById(obj).parentNode.classList.remove('sectionHide');
        //console.log('flexDirection 2' + flexDirection)
    }
    // reflow/redraw objects within this section (tables, charts, carousels, calendars, diagrams)
    try { findObjectsToRedraw(obj); } catch (e) { }
}

function hide(obj) {
    document.getElementById(obj).style.display = 'none';
    document.getElementById("hide_" + obj).style.display = 'none';
    document.getElementById("show_" + obj).style.display = '';


    var topSectionDiv = document.getElementById(obj).parentNode
    var flexDirection = window.getComputedStyle(topSectionDiv).getPropertyValue("flex-direction");
    if (flexDirection == 'column') {
        //console.log('flexDirection 1' + flexDirection)
    } else {
        document.getElementById(obj).parentNode.classList.remove('sectionShow');
        document.getElementById(obj).parentNode.classList.add('sectionHide');
        //console.log('flexDirection 2' + flexDirection)
    }
}
