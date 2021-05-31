function isEmptyOrSpaces(str) {
    return !str || str.trim() === '';
}
function dataTablesCheckCondition(condition, data) {
    var columnName = condition['columnName'];
    var reverseCondition = condition['reverseCondition'];
    var columnId = condition['columnId'];
    var operator = condition['operator'].toLowerCase();
    if (condition['dataStore'].toLowerCase() != 'html') {
        var columnExists = false;
        // we need to find whether the column name exists or not, and to make sure we know the column name exact case (it's case sensitive) just in case user provided it wrong
        Object.getOwnPropertyNames(data).forEach(
            function (val) {
                if (val.toLowerCase() == columnName.toLowerCase()) {
                    columnName = val;
                    columnExists = true;
                    return
                }
            }
        );
        if (!columnExists) {
            return false;
        }
        var columnValue = data[columnName];
    } else {
        // check if columnid is set - if it's not set it means the column doesn't exists so we dont' proceed
        if (columnId == -1) {
            return false;
        }
        var columnValue = data[columnId];
    }
    var conditionValue = condition['value'];

    //console.log('before: ' + conditionValue + ' || ' + columnValue + ' type: ' + condition['type']);
    if (condition['type'] == 'bool') {
        columnValue = columnValue.toString().toLowerCase();
        conditionValue = conditionValue.toString().toLowerCase();
    } else if (condition['type'] == 'string') {
        if (!condition['caseSensitive']) {
            columnValue = columnValue.toString().toLowerCase();
            conditionValue = conditionValue.toString().toLowerCase();
        }
    } else if (condition['type'] == 'number') {
        if (Array.isArray(conditionValue)) {
            // this will be used for between, betweenInclusive
            // if its an array we need to make sure to convert conditionValue within an array
            var conditionValueTemporary = [];

            for (var i = 0; i < conditionValue.length; i++) {
                //for (let value of conditionValue) {
                if (!isEmptyOrSpaces(conditionValue[i].toString())) {
                    conditionValueTemporary.push(Number(conditionValue[i]));
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
        if (Array.isArray(condition['valueDate'])) {
            var conditionValueTemporary = [];
            for (var i = 0; i < condition['valueDate'].length; i++) {
                //for (let value of condition['valueDate']) {
                var valueDate = condition['valueDate'][i];
                conditionValueTemporary.push(new Date(valueDate.year, valueDate.month - 1, valueDate.day, valueDate.hours, valueDate.minutes, valueDate.seconds));
            }
            conditionValue = conditionValueTemporary;
        } else {
            // bring conditionValue to proper date
            var valueDate = condition['valueDate'];
            conditionValue = new Date(valueDate.year, valueDate.month - 1, valueDate.day, valueDate.hours, valueDate.minutes, valueDate.seconds);
        }
        // bring columnValue based on dateTimeFormat provided
        var momentConversion = moment(columnValue, condition['dateTimeFormat']);
        columnValue = new Date(momentConversion);
    }

    if (reverseCondition) {
        var sideLeft = conditionValue;
        var sideRight = columnValue;
    } else {
        var sideLeft = columnValue;
        var sideRight = conditionValue;
    }
    //console.log('after: ' + conditionValue + ' || ' + columnValue);
    if (operator == 'eq') {
        if (sideLeft == sideRight) {
            return true;
        }
    } else if (operator == 'ne') {
        if (sideLeft != sideRight) {
            return true;
        }
    } else if (operator == 'gt') {
        if (sideLeft > sideRight) {
            return true;
        }
    } else if (operator == 'lt') {
        if (sideLeft < sideRight) {
            return true;
        }
    } else if (operator == 'le') {
        if (sideLeft <= sideRight) {
            return true;
        }
    } else if (operator == 'ge') {
        if (sideLeft >= sideRight) {
            return true;
        }
    } else if (operator == 'in') {
        if (sideRight.indexOf(sideLeft) != -1) {
            return true;
        }
    } else if (operator == 'notin') {
        if (sideRight.indexOf(sideLeft) == -1) {
            return true;
        }
    } else if (operator == 'contains' || operator == 'like') {
        //var compareValue = conditionValue.replace('*', '.*')
        var regex = new RegExp(sideRight);
        if (regex.test(sideLeft)) {
            return true;
        }
    } else if (operator == 'notcontains' || operator == 'notlike') {
        //var compareValue = conditionValue.replace('*', '.*')
        var regex = new RegExp(sideRight)
        if (!regex.test(sideLeft)) {
            return true;
        }
    } else if (operator == 'betweeninclusive') {
        if (Array.isArray(sideRight) && sideLeft >= sideRight[0] && sideLeft <= sideRight[1]) {
            return true;
        }
    } else if (operator == 'between') {
        if (Array.isArray(sideRight) && sideLeft > sideRight[0] && sideLeft < sideRight[1]) {
            return true;
        }
    }
    return false;
}
function dataTablesConditionalFormatting(row, data, conditionsContainer, highlightColumn, css, failCss) {
    var conditionsMatch = [];
    var found = false;
    for (var i = 0; i < conditionsContainer.length; i++) {
        var container = conditionsContainer[i];
        for (var k = 0; k < container['conditions'].length; k++) {
            var condition = container['conditions'][k];
            conditionsMatch.push(
                dataTablesCheckCondition(condition, data)
            );
        }
        if (container['logic'] == 'AND') {
            // if (conditionsMatch.every(value => value === true)) {
            //     found = true;
            // }

            for (var a = 0; a < conditionsMatch.length; a++) {
                if (conditionsMatch[a] !== true) {
                    found = false;
                    break;
                } else {
                    found = true;
                }
            }


        } else if (container['logic'] == 'OR') {
            //if (conditionsMatch.some(value => value === true)) {
            //    found = true;
            //}

            for (var a = 0; a < conditionsMatch.length; a++) {
                if (conditionsMatch[a] === true) {
                    found = true;
                    break;
                }
            }

        } else if (container['logic'] == 'NONE') {
            // if (conditionsMatch.every(value => value != true)) {
            //    found = true;
            //}

            for (var a = 0; a < conditionsMatch.length; a++) {
                if (conditionsMatch[a] !== false) {
                    found = false;
                    break;
                } else {
                    found = true;
                }
            }
        }
    }
    if (found) {
        if (highlightColumn == null) {
            $('td', row).css(css);
        } else {
            for (var a = 0; a < highlightColumn.length; a++) {
                var column = highlightColumn[a];
                //for (let column of highlightColumn) {
                $("td:eq(" + column + ")", row).css(css);

                //if (data.Type == "group") {
                //    $('td:eq(6)', row).html('<b>A</b>');
                //}
            }
        }
    } else {
        if (failCss) {
            if (highlightColumn == null) {
                $('td', row).css(failCss);
            } else {
                for (var a = 0; a < highlightColumn.length; a++) {
                    var column = highlightColumn[a];
                    //for (let column of highlightColumn) {
                    $("td:eq(" + column + ")", row).css(failCss);
                }
            }
        }
    }
}