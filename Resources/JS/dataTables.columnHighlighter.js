// DataTables Column Highlighter (standalone)
// Combines conditional engine and responsive child-row + visible cell styling
// Usage:
//   $('#table').DataTable({
//     columnHighlighter: { rules: [ /* see README.md */ ] }
//   });
/*
 DataTables Column Highlighter v1.0.0
 (c) 2025 EvotecIT | MIT
 https://github.com/EvotecIT/HTMLExtensions
*/
(function(){
    if (typeof window === 'undefined') { return; }

    function isEmptyOrSpaces(str) { return !str || str.trim() === ''; }

    function dataTablesCheckCondition(condition, data) {
        var columnName = condition['columnName'];
        var reverseCondition = condition['reverseCondition'];
        var columnId = condition['columnId'];
        var operator = (condition['operator'] || '').toLowerCase();
        var columnValue;
        if ((condition['dataStore'] || '').toLowerCase() != 'html') {
            var columnExists = false;
            Object.getOwnPropertyNames(data).forEach(function (val) {
                if (val.toLowerCase() == columnName.toLowerCase()) {
                    columnName = val; columnExists = true; return;
                }
            });
            if (!columnExists) { return false; }
            columnValue = data[columnName];
        } else {
            if (columnId == -1) { return false; }
            columnValue = data[columnId];
        }
        var conditionValue = condition['value'];
        if (condition['type'] == 'bool') {
            columnValue = String(columnValue).toLowerCase();
            conditionValue = String(conditionValue).toLowerCase();
        } else if (condition['type'] == 'string') {
            if (!condition['caseSensitive']) {
                columnValue = String(columnValue).toLowerCase();
                conditionValue = String(conditionValue).toLowerCase();
            }
        } else if (condition['type'] == 'number') {
            if (Array.isArray(conditionValue)) {
                var tmp = [];
                for (var i = 0; i < conditionValue.length; i++) {
                    if (!isEmptyOrSpaces(String(conditionValue[i]))) { tmp.push(Number(conditionValue[i])); }
                    else { tmp.push(undefined); }
                }
                conditionValue = tmp;
                if (!isEmptyOrSpaces(String(columnValue))) { columnValue = Number(columnValue); }
                else { columnValue = undefined; }
            } else {
                if (!isEmptyOrSpaces(String(conditionValue))) { conditionValue = Number(conditionValue); }
                else { conditionValue = undefined; }
                if (!isEmptyOrSpaces(String(columnValue))) { columnValue = Number(columnValue); }
                else { columnValue = undefined; }
            }
        } else if (condition['type'] == 'date') {
            if (Array.isArray(condition['valueDate'])) {
                var tmp2 = [];
                for (var j = 0; j < condition['valueDate'].length; j++) {
                    var valueDate = condition['valueDate'][j];
                    tmp2.push(new Date(valueDate.year, valueDate.month - 1, valueDate.day, valueDate.hours, valueDate.minutes, valueDate.seconds));
                }
                conditionValue = tmp2;
            } else {
                var vd = condition['valueDate'];
                conditionValue = new Date(vd.year, vd.month - 1, vd.day, vd.hours, vd.minutes, vd.seconds);
            }
            var momentConversion = (typeof moment !== 'undefined') ? moment(columnValue, condition['dateTimeFormat']) : columnValue;
            columnValue = new Date(momentConversion);
        }
        var left, right; if (reverseCondition) { left = conditionValue; right = columnValue; } else { left = columnValue; right = conditionValue; }
        if (operator == 'eq') { return left == right; }
        else if (operator == 'ne') { return left != right; }
        else if (operator == 'gt') { return left > right; }
        else if (operator == 'lt') { return left < right; }
        else if (operator == 'le') { return left <= right; }
        else if (operator == 'ge') { return left >= right; }
        else if (operator == 'in') { return Array.isArray(right) && right.indexOf(left) != -1; }
        else if (operator == 'notin') { return Array.isArray(right) && right.indexOf(left) == -1; }
        else if (operator == 'contains' || operator == 'like') { var rx = new RegExp(right); return rx.test(left); }
        else if (operator == 'notcontains' || operator == 'notlike') { var rx2 = new RegExp(right); return !rx2.test(left); }
        else if (operator == 'betweeninclusive') { return Array.isArray(right) && left >= right[0] && left <= right[1]; }
        else if (operator == 'between') { return Array.isArray(right) && left > right[0] && left < right[1]; }
        return false;
    }

    function getHeaderNames(tableId) {
        try {
            var names = []; var $ths = jQuery('#' + tableId + ' thead th');
            $ths.each(function(){ names.push(jQuery(this).text().trim()); }); return names;
        } catch (e) { return []; }
    }
    function indexToHeaderName(tableId, index) {
        var headers = getHeaderNames(tableId); if (index >= 0 && index < headers.length) { return headers[index]; } return null;
    }
    function headerNameToIndex(tableId, name) {
        var headers = getHeaderNames(tableId); if (!name) return -1; var lname = ('' + name).toLowerCase();
        for (var i = 0; i < headers.length; i++) { if (('' + headers[i]).toLowerCase() === lname) return i; } return -1;
    }

    window.DataTablesColumnHighlighter = {
        configurations: {},
        detectStore: function(table){
            try { if (table && table.rows) { var d = table.rows({ page: 'current' }).data(); var f = d && d.length ? d[0] : null; if (Array.isArray(f)) return 'HTML'; if (f && typeof f === 'object') return 'JavaScript'; } } catch(e) {}
            return 'HTML';
        },
        normalizeCondition: function(c, headers, store){
            if (!c) return c; try {
                if (!c.dataStore) c.dataStore = store;
                if ((c.columnId === undefined || c.columnId === -1) && c.columnName) {
                    var lname = ('' + c.columnName).toLowerCase(); for (var h = 0; h < headers.length; h++) { if ((headers[h] + '').toLowerCase() === lname) { c.columnId = h; break; } }
                }
                if ((!c.columnName || c.columnName === '') && (typeof c.columnId === 'number')) { if (c.columnId >= 0 && c.columnId < headers.length) { c.columnName = headers[c.columnId]; } }
            } catch(e) {}
            return c;
        },
        normalizeRules: function(tableId, config, table){
            try {
                var headers = getHeaderNames(tableId); var store = this.detectStore(table);
                for (var i = 0; i < config.length; i++) {
                    var rule = config[i]; if (rule && rule.conditionsContainer) {
                        for (var r = 0; r < rule.conditionsContainer.length; r++) {
                            var container = rule.conditionsContainer[r]; if (container && container.conditions) {
                                for (var k = 0; k < container.conditions.length; k++) { container.conditions[k] = this.normalizeCondition(container.conditions[k], headers, store); }
                            }
                        }
                    }
                }
            } catch(e) {}
            return config;
        },
        normalizeRowData: function(rowData) {
            try { if (Array.isArray(rowData)) { return rowData.map(function(v){ try { return jQuery('<p>' + v + '</p>').text().trim(); } catch(e) { return ('' + v).trim(); } }); } } catch(e) {}
            return rowData;
        },
        init: function(tableId, config, table) {
            var normalized = this.normalizeRules(tableId, Array.isArray(config) ? config : [config], table);
            this.configurations[tableId] = { config: normalized, table: table };
            this.setupEventHandlers(tableId, table);
        },
        setupEventHandlers: function(tableId, table) {
            var self = this;
            if (table && table.on) {
                table.on('responsive-display', function (e, datatable, row, showHide) {
                    try { if (showHide) { var tr = row.node(); var $tr = jQuery(tr); var data = row.data(); self.applyHighlighting(tableId, $tr, data); } } catch (err) { }
                });
                table.on('draw.dt', function(){
                    try { table.rows({ page: 'current' }).every(function(){ var tr = this.node(); var $tr = jQuery(tr); var data = this.data(); self.applyHighlighting(tableId, $tr, data); }); } catch (err) { }
                });
                setTimeout(function(){ try { table.rows({ page: 'current' }).every(function(){ var tr = this.node(); var $tr = jQuery(tr); var data = this.data(); self.applyHighlighting(tableId, $tr, data); }); } catch (err) { } }, 0);
            }
            if (!(table && table.on)) {
                jQuery('#' + tableId + ' tbody').on('click', 'td.dtr-control, td.dt-control, .dtr-control, .dt-control', function () {
                    var $tr = jQuery(this).closest('tr'); setTimeout(function() { var childRow = $tr.next('tr.child'); if (childRow.length > 0) { var rowData = []; $tr.find('td').each(function(){ var $td = jQuery(this); if (!$td.hasClass('dtr-control') && !$td.hasClass('dt-control')) { rowData.push($td.text().trim()); } }); self.applyHighlighting(tableId, $tr, rowData); } }, 100);
                });
            }
        },
        applyHighlighting: function(tableId, $parentRow, rowData) {
            var cfg = this.configurations[tableId]; if (!cfg) { return; }
            var childRow = $parentRow.next('tr.child'); var norm = this.normalizeRowData(rowData);
            var styleMap = {};
            function pushStyle(col, style, isPass) { if (!col) return; if (!styleMap[col]) styleMap[col] = { pass: [], fail: [] }; (isPass ? styleMap[col].pass : styleMap[col].fail).push(style || {}); }
            function normalizeTarget(t) { return { column: t.column, backgroundColor: t.backgroundColor, textColor: t.textColor, css: t.css, highlightParent: t.highlightParent }; }
            function mergedStyle(entry) { var src = entry.pass.length > 0 ? entry.pass : entry.fail; if (src.length === 0) return null; var out = {}; for (var i=0;i<src.length;i++){ var s=src[i]||{}; if (s.backgroundColor) out.backgroundColor=s.backgroundColor; if (s.textColor) out.textColor=s.textColor; if (s.highlightParent) out.highlightParent=s.highlightParent; if (s.css){ out.css=out.css||{}; for (var k in s.css){ if (Object.prototype.hasOwnProperty.call(s.css,k)) out.css[k]=s.css[k]; } } } return out; }
            for (var r=0;r<cfg.config.length;r++){
                var rule = cfg.config[r];
                var matched = (rule.conditionsContainer) ? (function(){
                    try { var found=false, cm=[]; for (var i=0;i<rule.conditionsContainer.length;i++){ var container=rule.conditionsContainer[i]; cm=[]; for (var k=0;k<container['conditions'].length;k++){ var condition=container['conditions'][k]; cm.push(dataTablesCheckCondition(condition, norm)); } if (container['logic']=='AND'){ found=true; for (var a=0;a<cm.length;a++){ if (cm[a]!==true){ found=false; break; } } } else if (container['logic']=='OR'){ found=false; for (var b=0;b<cm.length;b++){ if (cm[b]===true){ found=true; break; } } } else if (container['logic']=='NONE'){ found=true; for (var c=0;c<cm.length;c++){ if (cm[c]!==false){ found=false; break; } } } if (found){ return true; } } return found; } catch(e){ return false; } })() : true;
                if (matched){ for (var t=0;t<rule.targets.length;t++){ var nt=normalizeTarget(rule.targets[t]); pushStyle(nt.column, nt, true); } }
                else if (rule.failTargets){ for (var ft=0;ft<rule.failTargets.length;ft++){ var nf=normalizeTarget(rule.failTargets[ft]); pushStyle(nf.column, nf, false); } }
            }
            for (var col in styleMap){ if (!Object.prototype.hasOwnProperty.call(styleMap,col)) continue; var style=mergedStyle(styleMap[col]); if (!style) continue; var target={ column: col, backgroundColor: style.backgroundColor, textColor: style.textColor, css: style.css, highlightParent: style.highlightParent }; if (childRow.length>0){ DataTablesColumnHighlighter.applyColumnStyling(childRow, target); } DataTablesColumnHighlighter.applyVisibleCellStyling(tableId, $parentRow, target); }
        },
        applyColumnStyling: function(childRow, target) {
            childRow.find('.dtr-title').each(function() { var $elem = jQuery(this); var text = $elem.text().trim(); if (text === target.column) { var $dataElem = $elem.siblings('.dtr-data').length > 0 ? $elem.siblings('.dtr-data') : $elem.next(); if (target.backgroundColor) { $dataElem.css('background-color', target.backgroundColor); } if (target.textColor) { $dataElem.css('color', target.textColor); } if (target.css) { $dataElem.css(target.css); } if (target.highlightParent) { $elem.parent().css('background-color', target.backgroundColor); if (target.textColor) { $elem.parent().css('color', target.textColor); } } } });
        },
        applyVisibleCellStyling: function(tableId, $parentRow, target) {
            try { var idx = (typeof target.column === 'number') ? target.column : headerNameToIndex(tableId, target.column); if (idx < 0) return; var $cells = $parentRow.find('td'); if ($cells.length === 0) return; var $cell = $cells.eq(idx); if ($cell && $cell.length > 0) { if (target.backgroundColor) { $cell.css('background-color', target.backgroundColor); } if (target.textColor) { $cell.css('color', target.textColor); } if (target.css) { $cell.css(target.css); } } } catch (e) { }
        },
        createConfig: function(conditions, targets) { return [{ condition: conditions, targets: Array.isArray(targets) ? targets : [targets] }]; }
    };

    window.setupChildRowConditionalFormatting = function(tableId, conditionsContainer, highlightColumn, css, failCss, table) {
        try {
            var headers = getHeaderNames(tableId);
            var detectStore = function(){ try { if (table && table.rows) { var d = table.rows({ page: 'current' }).data(); var first = d && d.length ? d[0] : null; if (Array.isArray(first)) return 'HTML'; if (first && typeof first === 'object') return 'JavaScript'; } } catch(e) {} return 'HTML'; };
            var dataStoreType = detectStore();
            try {
                for (var i = 0; i < conditionsContainer.length; i++) {
                    var container = conditionsContainer[i]; if (!container || !container.conditions) continue;
                    for (var k = 0; k < container.conditions.length; k++) {
                        var c = container.conditions[k] || {};
                        if (!c.dataStore) { c.dataStore = dataStoreType; }
                        if ((c.columnId === undefined || c.columnId === -1) && c.columnName) { var lname = ('' + c.columnName).toLowerCase(); for (var h = 0; h < headers.length; h++) { if ((headers[h] + '').toLowerCase() === lname) { c.columnId = h; break; } } }
                        if ((!c.columnName || c.columnName === '') && (typeof c.columnId === 'number')) { if (c.columnId >= 0 && c.columnId < headers.length) { c.columnName = headers[c.columnId]; } }
                        container.conditions[k] = c;
                    }
                }
            } catch (e) { }
            var targets = [];
            if (Array.isArray(highlightColumn)) {
                for (var i = 0; i < highlightColumn.length; i++) {
                    var entry = highlightColumn[i]; var header = null; if (typeof entry === 'number') { header = indexToHeaderName(tableId, entry); } else if (typeof entry === 'string') { header = entry; } else if (entry && typeof entry === 'object' && entry.column) { header = entry.column; }
                    if (header !== null && header !== undefined) { var t = { column: header }; if (css) { if (css['background-color']) t.backgroundColor = css['background-color']; if (css['color']) t.textColor = css['color']; t.css = css; } targets.push(t); }
                }
            }
            var newRule = { conditionsContainer: conditionsContainer, targets: targets };
            if (window.DataTablesColumnHighlighter && window.DataTablesColumnHighlighter.configurations && window.DataTablesColumnHighlighter.configurations[tableId]) {
                try { window.DataTablesColumnHighlighter.configurations[tableId].config.push(newRule); var tbl = table || window.DataTablesColumnHighlighter.configurations[tableId].table; if (tbl && tbl.rows) { tbl.rows({ page: 'current' }).every(function(){ var tr = this.node(); var $tr = jQuery(tr); var data = this.data(); window.DataTablesColumnHighlighter.applyHighlighting(tableId, $tr, data); }); } } catch (e) { window.DataTablesColumnHighlighter.init(tableId, [newRule], table || window.DataTablesColumnHighlighter.configurations[tableId].table); }
            } else { window.DataTablesColumnHighlighter.init(tableId, [newRule], table); }
        } catch (e) { }
    };

    window.setupColumnHighlighting = function(tableId, config, table) { DataTablesColumnHighlighter.init(tableId, config, table); };

    function autoInitFromSettings(settings) {
        try {
            var api = new jQuery.fn.dataTable.Api(settings);
            var tableId = settings && settings.nTable ? settings.nTable.getAttribute('id') : null; if (!tableId) return;
            if (window.DataTablesColumnHighlighter && window.DataTablesColumnHighlighter.configurations && window.DataTablesColumnHighlighter.configurations[tableId]) { return; }
            var oInit = settings.oInit || {}; var ch = oInit.columnHighlighter; if (!ch) return;
            var rules = ch.rules || ch.config || []; if (!rules || (Array.isArray(rules) && rules.length === 0)) return;
            window.DataTablesColumnHighlighter.init(tableId, rules, api);
            try { api.rows({ page: 'current' }).every(function(){ var tr = this.node(); var $tr = jQuery(tr); var data = this.data(); window.DataTablesColumnHighlighter.applyHighlighting(tableId, $tr, data); }); } catch(err) { }
        } catch(err) { }
    }
    try { jQuery(document).on('preInit.dt', function(e, settings){ autoInitFromSettings(settings); }); jQuery(document).on('init.dt', function(e, settings){ autoInitFromSettings(settings); }); } catch(e) { }
    try { jQuery(function(){ try { if (!jQuery.fn.dataTable) return; var doScan = function(){ try { var apis = jQuery.fn.dataTable.tables({ api: true }); apis.every(function(){ try { autoInitFromSettings(this.settings()[0]); } catch(err) { } }); return apis && apis.count && apis.count() > 0; } catch(err) { return false; } }; doScan(); var tries = 0; var timer = setInterval(function(){ var found = doScan(); tries++; if (found || tries > 40) { clearInterval(timer); } }, 50); } catch(err) { } }); } catch(e) { }
})();
