$(document).ready(function () {
    $('.reportDate').each(function () {
        var dateValue = $(this).data('reportdate');
        var momentFormat = $(this).data('format');
        var fromNowEnabled = $(this).data('fromnow') === true || $(this).data('fromnow') === 'true';

        // First parse with the canonical format
        var parsedDate = moment(dateValue, "YYYY-MM-DD HH:mm:ss");

        if (parsedDate.isValid()) {
            // If fromNow is enabled, append relative time
            if (fromNowEnabled) {
                var fromNow = parsedDate.fromNow();
                $(this).append(' (' + fromNow + ')');
            }
        } else {
            console.log('Invalid date:', dateValue);
        }
    });
});