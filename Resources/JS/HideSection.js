function show(obj) {
    document.getElementById(obj).style.display = 'block';
    document.getElementById("hide_" + obj).style.display = '';
    document.getElementById("show_" + obj).style.display = 'none';
    // console.log("show_" + obj);
    var tableid = document.getElementById(obj).querySelector('table[id^="DT-"]').id;
    // console.log("#" + tableid);
    try {
        $("#" + tableid).DataTable().columns.adjust().responsive.recalc();
    } catch (e) {
        console.log('No datatables available.');
    }
}
function hide(obj) {
    document.getElementById(obj).style.display = 'none';
    document.getElementById("hide_" + obj).style.display = 'none';
    document.getElementById("show_" + obj).style.display = '';
}
