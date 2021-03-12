function isEmptyOrSpaces(str) {
    return !str || str.trim() === '';
}
function dataTablesCheckCondition(condition, data) {
    var columnName = condition['columnName'];
    var columnId = condition['columnId'];
    var operator = condition['operator'].toLowerCase();
    if (condition['dataStore'].toLowerCase() != 'html') {
        var columnValue = data[columnName];
    } else {
        var columnValue = data[columnId];
    }
    var conditionValue = condition['value'];

    //console.log('before: ' + conditionValue + ' || ' + columnValue);
    if (condition['type'] == 'bool') {
        columnValue = columnValue.toString().toLowerCase();
        conditionValue = conditionValue.toString().toLowerCase();
    } else if (condition['type'] == 'string') {
        if (condition['caseInsensitive']) {
            columnValue = columnValue.toString().toLowerCase();
            conditionValue = conditionValue.toString().toLowerCase();
        }
    } else if (condition['type'] == 'number') {
        if (Array.isArray(conditionValue)) {
            // this will be used for between, betweenInclusive
            // if its an array we need to make sure to convert conditionValue within an array
            var conditionValueTemporary = [];
            for (let value of conditionValue) {
                if (!isEmptyOrSpaces(value.toString())) {
                    conditionValueTemporary.push(Number(value));
                } else {
                    conditionValueTemporary.push(undefined);
                }
            }
            conditionValue = conditionValueTemporary;
            if (!isEmptyOrSpaces(columnValue.toString())) {
                columnValue = Number(columnValue);
            } else {
                columnValue = undefined;
            }
        } else {
            // This logic is to get rid of empty string which is normally treated as 0
            if (!isEmptyOrSpaces(conditionValue.toString())) {
                conditionValue = Number(conditionValue);
            } else {
                conditionValue = undefined;
            }
            if (!isEmptyOrSpaces(columnValue.toString())) {
                columnValue = Number(columnValue);
            } else {
                columnValue = undefined;
            }
        }
    } else if (condition['type'] == 'date') {
        // bring conditionValue to proper date
        var valueDate = condition['valueDate'];
        conditionValue = new Date(valueDate.year, valueDate.month - 1, valueDate.day, valueDate.hours, valueDate.minutes, valueDate.seconds);

        // bring columnValue based on dateTimeFormat provided
        var momentConversion = moment(columnValue, condition['dateTimeFormat']);
        columnValue = new Date(momentConversion);
    }
    //console.log('after: ' + conditionValue + ' || ' + columnValue);
    if (operator == 'eq') {
        if (columnValue == conditionValue) {
            return true;
        }
    } else if (operator == 'gt') {
        if (columnValue > conditionValue) {

            return true;
        }
    } else if (operator == 'lt') {
        if (columnValue < conditionValue) {
            return true;
        }
    } else if (operator == 'le') {
        if (columnValue <= conditionValue) {
            return true;
        }
    } else if (operator == 'ge') {
        if (columnValue >= conditionValue) {
            return true;
        }
    } else if (operator == 'contains' || operator == 'like') {
        //var compareValue = conditionValue.replace('*', '.*')
        var regex = new RegExp(conditionValue);
        if (regex.test(columnValue)) {
            return true;
        }
    } else if (operator == 'notcontains' || operator == 'notlike') {
        //var compareValue = conditionValue.replace('*', '.*')
        var regex = new RegExp(conditionValue)
        if (!regex.test(columnValue)) {
            return true;
        }
    } else if (operator == 'betweeninclusive') {
        if (Array.isArray(conditionValue) && columnValue >= conditionValue[0] && columnValue <= conditionValue[1]) {
            return true;
        }
    } else if (operator == 'between') {
        if (Array.isArray(conditionValue) && columnValue > conditionValue[0] && columnValue < conditionValue[1]) {
            return true;
        }
    }
    return false;
}
function dataTablesConditionalFormatting(row, data, conditionsContainer, highlightColumn, css) {
    var conditionsMatch = [];
    var found = false;
    for (let container of conditionsContainer) {
        for (let condition of container['conditions']) {
            conditionsMatch.push(
                dataTablesCheckCondition(condition, data)
            );
        }
        if (container['logic'] == 'AND') {
            if (conditionsMatch.every(value => value === true)) {
                found = true;
            }
        } else if (container['logic'] == 'OR') {
            if (conditionsMatch.some(value => value === true)) {
                found = true;
            }
        }
    }
    if (found) {
        if (highlightColumn == null) {
            $('td', row).css(css);
        } else {
            for (let column of highlightColumn) {
                $("td:eq(" + column + ")", row).css(css);

                //if (data.Type == "group") {
                //    $('td:eq(6)', row).html('<b>A</b>');
                //}
            }
        }
    }
}

// var conditionsContainer = [
//     {
//         logic: 'AND',
//         conditions: [
//             {
//                 columnName: 'Test4',
//                 operator: 'gt',
//                 value: 2,
//             },
//             {
//                 columnName: 'Test3',
//                 operator: 'eq',
//                 value: 'KitKat',
//             }
//         ]
//     },
// ];