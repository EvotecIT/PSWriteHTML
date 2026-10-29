(function () {
    // Inline event attributes are blocked when a report is hosted with a script nonce.
    // Delegate events so controls also work when sections are added after this script loads.
    if (document.pswritehtmlSectionTogglesBound) return;
    document.pswritehtmlSectionTogglesBound = true;
    document.addEventListener('click', function (event) {
        var target = event.target;
        if (target && target.nodeType !== 1) target = target.parentElement;
        var control = target && target.closest ? target.closest('[data-pswritehtml-section-action]') : null;
        if (!control) return;
        var section = control.getAttribute('data-pswritehtml-section');
        var action = control.getAttribute('data-pswritehtml-section-action');
        if (!section || !document.getElementById(section) || (action !== 'show' && action !== 'hide')) return;
        event.preventDefault();
        if (action === 'show') show(section);
        else hide(section);
    });
})();

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
