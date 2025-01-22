$(document).ready(function () {
    $('.reportDate').each(function () {
        var dateValue = $(this).data('reportdate');
        var dateFormat = $(this).data('format') || 'YYYY-MM-DD HH:mm:ss';
        var fromNowEnabled = $(this).data('fromnow') === true || $(this).data('fromnow') === 'true';
        console.log('dateValue: ' + dateValue + ', dateFormat: ' + dateFormat + ', fromNowEnabled: ' + fromNowEnabled);
        if (dateValue && moment(dateValue, dateFormat).isValid()) {
            if (fromNowEnabled) {
                console.log('fromNowEnabled: ' + fromNowEnabled);
                var fromNow = moment(dateValue, dateFormat).fromNow();
                console.log('fromNow: ' + fromNow);
                $(this).append(' (' + fromNow + ')');


                console.log('this: ' + $(this).html());
            }
        } else {
            console.log('Invalid dateValue: ' + dateValue + ', dateFormat: ' + dateFormat);
        }
    });
});