function dataTablesConditionalFormatting(row, data, conditions, highlightColumn, css) {
    var conditionMatch = [];

    for (let condition of conditions) {
        var columnName = condition['columnName']
        console.log(typeof condition['value'] + '  ' + typeof data[columnName]);

        if (condition['operator'] == 'eq') {
            if (data[columnName] == condition['value']) {
                conditionMatch.push(true);
            }
        } else if (condition['operator'] == 'gt') {
            if (data[columnName] > condition['value']) {
                console.log(condition['value'] + '  >  ' + data[columnName])
                conditionMatch.push(true);
            }
        } else if (condition['operator'] == 'ge') {
            if (data[columnName] > condition['value']) {
                conditionMatch.push(true);
            }
        }
    }

    if (conditionMatch.length != conditions.length) {
        //console.log(conditionMatch.length + '    ' + conditions.length);
        // if condition doesn't match we skip condition
        return
    }

    if (highlightColumn == null) {
        $('td', row).css(css);
    } else {
        for (let column of highlightColumn) {
            $("td:eq(" + column + ")", row).css(css);
        }
    }
}
// var css = {
//     "color": "#008000",
//     "background-color": "#ffff00"
// }