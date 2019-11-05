function show(obj) {
    document.getElementById(obj).style.display = 'block';
    document.getElementById("hide_" + obj).style.display = '';
    document.getElementById("show_" + obj).style.display = 'none';
    try {
        $('.dataTable').DataTable().columns.adjust().responsive.recalc();
    } catch (e) {
        console.log('No datatables available.');
    }
}
function hide(obj) {
    document.getElementById(obj).style.display = 'none';
    document.getElementById("hide_" + obj).style.display = 'none';
    document.getElementById("show_" + obj).style.display = '';
}