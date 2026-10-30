// PSWriteHTML policy around the pinned DataTables Buttons implementation.
function pswhConfigureExport(config, scope) {
    scope = String(scope || 'Automatic').toLowerCase();
    var textColumns = config.pswhTextColumns || [];
    var rawCsv = !!config.pswhRawData;
    delete config.pswhTextColumns;
    delete config.pswhRawData;
    var options = config.exportOptions = config.exportOptions || {};
    var modifier = options.modifier = options.modifier || {};
    if (scope === 'all' || scope === 'filtered') {
        modifier.selected = null;
        modifier.search = scope === 'all' ? 'none' : 'applied';
    } else if (scope === 'selected') {
        modifier.selected = true;
        modifier.search = 'applied';
    }
    var originalFormat = options.format && options.format.body;
    options.format = options.format || {};
    function safeCsv(text) {
        if (!rawCsv && /^[\s\u0000-\u001f]*[=+@-]/.test(text) && !/^\s*-\d+(?:[.,]\d+)?(?:[eE][+-]?\d+)?\s*$/.test(text)) {
            return "'" + text;
        }
        return text;
    }
    options.format.body = function (data, row, column, node) {
        if (originalFormat) { data = originalFormat(data, row, column, node); }
        var element = document.createElement('div');
        element.innerHTML = data == null ? '' : String(data);
        var text = element.textContent;
        // Keep ordinary negative numbers numeric; expressions still receive protection.
        if (config.extend === 'csvHtml5') { text = safeCsv(text); }
        return text;
    };
    if (config.extend === 'csvHtml5') {
        ['header', 'footer'].forEach(function (part) {
            var original = options.format[part];
            options.format[part] = function (data, column, node) {
                if (original) { data = original(data, column, node); }
                var element = document.createElement('div');
                element.innerHTML = data == null ? '' : String(data);
                return safeCsv(element.textContent);
            };
        });
    }
    if (config.extend === 'excelHtml5') {
        var exportData;
        var originalValues;
        function isTextColumn(header) {
            return textColumns.some(function (name) {
                return String(name).toLowerCase() === String(header).toLowerCase();
            });
        }
        var originalData = options.customizeData;
        options.customizeData = function (data) {
            if (originalData) { originalData(data); }
            originalValues = data.body.map(function (row) { return row.slice(); });
            data.body.forEach(function (row) {
                row.forEach(function (value, column) {
                    if (!isTextColumn(data.header[column]) && /^-?\d+,\d+$/.test(String(value))) {
                        row[column] = String(value).replace(',', '.');
                    }
                });
            });
            exportData = data;
        };
        var originalCustomize = config.customize;
        config.customize = function (xlsx, button, api) {
            if (exportData) {
                var info = api.buttons.exportInfo(button);
                var firstRow = 1 + (info.title ? 1 : 0) + (info.messageTop ? 1 : 0) + (button.header ? 1 : 0);
                var sheet = xlsx.xl.worksheets['sheet1.xml'];
                exportData.body.forEach(function (row, index) {
                    var worksheetRow = sheet.querySelector('row[r="' + (firstRow + index) + '"]');
                    if (!worksheetRow) { return; }
                    row.forEach(function (value, column) {
                        var cells = worksheetRow.querySelectorAll('c');
                        // Empty cells may be omitted by Buttons: use Excel column letters.
                        var letter = '', number = column + 1;
                        while (number > 0) { number--; letter = String.fromCharCode(65 + number % 26) + letter; number = Math.floor(number / 26); }
                        var cell = Array.prototype.find.call(cells, function (candidate) { return candidate.getAttribute('r') === letter + (firstRow + index); });
                        if (!cell) { return; }
                        // Inspect the pinned exporter's numeric result, including its currency,
                        // grouped-number, percentage and parenthesized-number formats.
                        var numericValue = cell.querySelector('v');
                        var original = originalValues[index][column];
                        var coefficient = String(original).split(/[eE]/)[0].replace(/\D/g, '').replace(/^0+/, '');
                        var numericCell = cell.getAttribute('t') === 'n' || !cell.hasAttribute('t');
                        var preciseNumber = numericCell && numericValue && coefficient.length > 15;
                        if (!isTextColumn(exportData.header[column]) && !preciseNumber) { return; }
                        while (cell.firstChild) { cell.removeChild(cell.firstChild); }
                        cell.setAttribute('t', 'inlineStr');
                        cell.removeAttribute('s');
                        var inline = sheet.createElementNS(cell.namespaceURI, 'is');
                        var text = sheet.createElementNS(cell.namespaceURI, 't');
                        text.setAttribute('xml:space', 'preserve');
                        text.textContent = original == null ? '' : String(original);
                        inline.appendChild(text);
                        cell.appendChild(inline);
                    });
                });
            }
            if (originalCustomize) { originalCustomize(xlsx, button, api); }
        };
    }
    return config;
}
