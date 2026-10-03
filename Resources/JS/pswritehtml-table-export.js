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
        if (config.extend === 'excelHtml5' && /^-?\d+,\d+$/.test(text)) { text = text.replace(',', '.'); }
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
        var originalData = options.customizeData;
        options.customizeData = function (data) {
            if (originalData) { originalData(data); }
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
                        var explicitText = textColumns.some(function (name) {
                            return String(name).toLowerCase() === String(exportData.header[column]).toLowerCase();
                        });
                        var numeric = String(value).trim();
                        var coefficient = numeric.split(/[eE]/)[0].replace(/^[+-]/, '').replace('.', '').replace(/^0+/, '');
                        var preciseNumber = /^[+-]?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?$/.test(numeric) && coefficient.length > 15;
                        if (!explicitText && !preciseNumber) { return; }
                        var cells = worksheetRow.querySelectorAll('c');
                        // Empty cells may be omitted by Buttons: use Excel column letters.
                        var letter = '', number = column + 1;
                        while (number > 0) { number--; letter = String.fromCharCode(65 + number % 26) + letter; number = Math.floor(number / 26); }
                        var cell = Array.prototype.find.call(cells, function (candidate) { return candidate.getAttribute('r') === letter + (firstRow + index); });
                        if (!cell) { return; }
                        while (cell.firstChild) { cell.removeChild(cell.firstChild); }
                        cell.setAttribute('t', 'inlineStr');
                        cell.removeAttribute('s');
                        var inline = sheet.createElementNS(cell.namespaceURI, 'is');
                        var text = sheet.createElementNS(cell.namespaceURI, 't');
                        text.setAttribute('xml:space', 'preserve');
                        text.textContent = value == null ? '' : String(value);
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
