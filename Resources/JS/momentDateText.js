$(document).ready(function () {
    $('.reportDate').each(function () {
        var dateValue = $(this).data('reportdate');
        if (dateValue) {
            var fromNow = moment(dateValue, 'YYYY-MM-DD HH:mm:ss').fromNow();
            $(this).append(' (' + fromNow + ')');
        }
    });
});