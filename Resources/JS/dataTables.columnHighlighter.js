/*!
 HTMLExtensions v0.1.12 — DataTables ColumnHighlighter & ToggleView
 (c) 2011–2025 Przemyslaw Klys @ Evotec
 https://htmlextensions.evotec.xyz | MIT License | Build: 2025-12-14T18:31:19.713Z
*/

(function(){
    if (typeof window === 'undefined') { return; }

    function isEmptyOrSpaces(str) { return !str || str.trim() === ''; }
    // Normalize header/column names for tolerant matching (case/spacing/punctuation)
    function normalizeName(input) {
        try { return ('' + input).toLowerCase().replace(/[\s\u00A0\u202F\-_]/g, '').replace(/[^a-z0-9]/gi, ''); } catch(_) { return ''+input; }
    }

    // Parse numbers accepting both "." and "," decimal separators (and typical thousands separators)
    function parseLocaleNumber(input) {
        if (typeof input === 'number') return input;
        var s = ('' + input).trim();
        if (!s) return undefined;
        // remove regular/narrow/nb spaces used as group separators
        s = s.replace(/[\s\u00A0\u202F]/g, '');
        var hasComma = s.indexOf(',') !== -1;
        var hasDot = s.indexOf('.') !== -1;
        if (hasComma && hasDot) {
            // The last separator is the decimal; the other is group separator
            if (s.lastIndexOf(',') > s.lastIndexOf('.')) {
                // comma decimal, dot thousands
                s = s.replace(/\./g, '');
                s = s.replace(',', '.');
            } else {
                // dot decimal, comma thousands
                s = s.replace(/,/g, '');
            }
        } else if (hasComma && !hasDot) {
            // Only comma present -> treat as decimal separator
            s = s.replace(',', '.');
        } else {
            // Only dot or neither -> unchanged
        }
        var n = Number(s);
        return isNaN(n) ? undefined : n;
    }

    function isValidDate(d) {
        return d instanceof Date && !isNaN(d.valueOf());
    }

    function uniqPush(arr, value) {
        if (!value) return;
        if (arr.indexOf(value) === -1) arr.push(value);
    }

    // Converts common .NET / PowerShell date format tokens to Moment-compatible tokens.
    // Also converts .NET quoted literals ('...') into Moment literals ([...]) so letters don't get interpreted as tokens.
    function dotNetToMomentFormat(fmt) {
        if (!fmt || typeof fmt !== 'string') return fmt;
        var out = '';
        var i = 0;
        while (i < fmt.length) {
            var ch = fmt[i];

            // .NET literal: '...'
            if (ch === "'") {
                var j = i + 1;
                var lit = '';
                while (j < fmt.length) {
                    if (fmt[j] === "'") {
                        // Escaped single quote: ''
                        if (j + 1 < fmt.length && fmt[j + 1] === "'") {
                            lit += "'";
                            j += 2;
                            continue;
                        }
                        break;
                    }
                    lit += fmt[j];
                    j++;
                }
                // consume closing quote if present
                if (j < fmt.length && fmt[j] === "'") j++;
                out += '[' + lit + ']';
                i = j;
                continue;
            }

            // .NET escape: \x (treat x as literal)
            if (ch === '\\') {
                if (i + 1 < fmt.length) {
                    out += '[' + fmt[i + 1] + ']';
                    i += 2;
                } else {
                    i++;
                }
                continue;
            }

            // Token runs (same letter repeated)
            if (/[A-Za-z]/.test(ch)) {
                var k = i + 1;
                while (k < fmt.length && fmt[k] === ch) k++;
                var token = fmt.slice(i, k);
                var c = token.charAt(0);
                var len = token.length;

                if (c === 'y') {
                    out += (len <= 2) ? 'YY' : 'YYYY';
                } else if (c === 'd') {
                    // dd = day-of-month in .NET, but dd = weekday in Moment; map only 1-2 to day-of-month.
                    out += (len <= 2) ? (len === 2 ? 'DD' : 'D') : token;
                } else if (c === 'f' || c === 'F') {
                    out += (len === 1) ? 'S' : (len === 2 ? 'SS' : 'SSS');
                } else if (c === 't') {
                    // AM/PM designator
                    out += 'A';
                } else if (c === 'K') {
                    out += 'Z';
                } else if (c === 'z') {
                    out += 'Z';
                } else {
                    out += token;
                }

                i = k;
                continue;
            }

            out += ch;
            i++;
        }
        return out;
    }

    function buildDateFormatCandidates(fmt) {
        var candidates = [];
        if (!fmt || typeof fmt !== 'string') return candidates;
        var base = fmt.trim();
        if (!base) return candidates;

        uniqPush(candidates, base);
        var normalized = dotNetToMomentFormat(base);
        if (normalized && normalized !== base) uniqPush(candidates, normalized);

        // Common user typos: dd -> DD, yyyy -> YYYY (even when already "moment-like")
        var quickFix = base
            .replace(/(^|[^d])dd([^d]|$)/g, '$1DD$2')
            .replace(/(^|[^d])d([^d]|$)/g, '$1D$2')
            .replace(/(^|[^y])yyyy([^y]|$)/g, '$1YYYY$2')
            .replace(/(^|[^y])yyy([^y]|$)/g, '$1YYYY$2')
            .replace(/(^|[^y])yy([^y]|$)/g, '$1YY$2')
            .replace(/tt/g, 'A')
            .replace(/f{3}/g, 'SSS')
            .replace(/f{2}/g, 'SS')
            .replace(/f/g, 'S');
        if (quickFix && quickFix !== base) uniqPush(candidates, quickFix);

        var normalizedFix = dotNetToMomentFormat(quickFix);
        if (normalizedFix && candidates.indexOf(normalizedFix) === -1) uniqPush(candidates, normalizedFix);

        return candidates;
    }

    function hasTimezoneOffset(s) {
        if (!s) return false;
        // ISO Z or numeric offsets like +02:00 / -0500
        return /[zZ]$/.test(s) || /[+-]\d{2}:?\d{2}$/.test(s);
    }

    function detectDateOrder(fmt) {
        if (!fmt || typeof fmt !== 'string') return null;
        var normalized = dotNetToMomentFormat(fmt);
        // Remove moment literals ([...]) so we don't match tokens inside literal text
        try { normalized = normalized.replace(/\[[^\]]*\]/g, ''); } catch (_) { /* noop */ }

        var idxY = normalized.search(/Y{2,4}/);
        var idxM = normalized.search(/M{1,4}/);
        var idxD = normalized.search(/D{1,2}/);
        if (idxY === -1 || idxM === -1 || idxD === -1) return null;

        var arr = [{ t: 'Y', i: idxY }, { t: 'M', i: idxM }, { t: 'D', i: idxD }];
        arr.sort(function (a, b) { return a.i - b.i; });
        return [arr[0].t, arr[1].t, arr[2].t];
    }

    function parseDateByFormatHint(value, fmt) {
        if (!value) return undefined;
        var s = ('' + value).trim();
        if (!s) return undefined;

        // If we have timezone information, native parsing is usually best (and respects the offset)
        if (hasTimezoneOffset(s)) {
            var dIso = new Date(s);
            if (isValidDate(dIso)) return dIso;
        }

        var numsRaw = s.match(/\d+/g);
        if (!numsRaw || numsRaw.length < 3) return undefined;
        var nums = numsRaw.map(function (x) { return parseInt(x, 10); });

        var order = detectDateOrder(fmt);
        if (!order) {
            // Best-effort inference when format is missing or unrecognizable
            if (numsRaw[0] && numsRaw[0].length === 4) order = ['Y', 'M', 'D'];
            else if (nums[0] > 12) order = ['D', 'M', 'Y'];
            else if (nums[1] > 12) order = ['M', 'D', 'Y'];
            else order = null;
        }
        if (!order) return undefined;

        var map = {};
        map[order[0]] = nums[0];
        map[order[1]] = nums[1];
        map[order[2]] = nums[2];

        var year = map.Y, month = map.M, day = map.D;
        if (typeof year !== 'number' || typeof month !== 'number' || typeof day !== 'number') return undefined;

        // Two-digit year handling (match Moment's pivot-ish behavior)
        if (year < 100) {
            year = (year >= 68) ? (1900 + year) : (2000 + year);
        }

        var hour = nums.length > 3 ? nums[3] : 0;
        var minute = nums.length > 4 ? nums[4] : 0;
        var second = nums.length > 5 ? nums[5] : 0;
        var ms = 0;
        if (nums.length > 6) {
            // Use the first 3 digits of the next group as milliseconds (covers 3/6/7 digit fractions from .NET)
            var msStr = '' + numsRaw[6];
            ms = parseInt(msStr.substring(0, 3), 10);
            if (isNaN(ms)) ms = 0;
        }

        // Handle 12h clocks with AM/PM
        var normalized = dotNetToMomentFormat(fmt || '');
        var uses12h = normalized && normalized.indexOf('h') !== -1 && normalized.indexOf('H') === -1;
        var hasMeridiem = normalized && normalized.indexOf('A') !== -1;
        if (uses12h || hasMeridiem) {
            var upper = s.toUpperCase();
            if (upper.indexOf('PM') !== -1 && hour < 12) hour += 12;
            if (upper.indexOf('AM') !== -1 && hour === 12) hour = 0;
        }

        var d = new Date(year, month - 1, day, hour, minute, second, ms);
        return isValidDate(d) ? d : undefined;
    }

    function parseDateValue(value, fmt) {
        if (value === null || value === undefined) return undefined;

        if (value instanceof Date) return value;
        if (typeof value === 'number') {
            var dn = new Date(value);
            return isValidDate(dn) ? dn : undefined;
        }

        var s = ('' + value).trim();
        if (!s) return undefined;

        // Prefer Moment.js if available (strict parsing + format candidates)
        if (typeof moment !== 'undefined') {
            var candidates = buildDateFormatCandidates(fmt);
            var m;
            if (candidates.length > 0) {
                m = moment(s, candidates, true);
                if (!m.isValid()) m = moment(s, candidates, false);
            } else {
                m = moment(s);
            }
            if (m && typeof m.isValid === 'function' && m.isValid()) {
                return m.toDate();
            }
        }

        // When we have a format hint, try our lightweight parser first to avoid locale-dependent native parsing.
        if (fmt) {
            var dh = parseDateByFormatHint(s, fmt);
            if (isValidDate(dh)) return dh;
        }

        // Fallback to native Date parsing (works well for ISO strings)
        var d = new Date(s);
        return isValidDate(d) ? d : undefined;
    }

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
                    var parsed = parseLocaleNumber(conditionValue[i]);
                    tmp.push(parsed);
                }
                conditionValue = tmp;
                columnValue = parseLocaleNumber(columnValue);
            } else {
                conditionValue = parseLocaleNumber(conditionValue);
                columnValue = parseLocaleNumber(columnValue);
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
            var parsed = parseDateValue(columnValue, condition['dateTimeFormat']);
            columnValue = parsed ? parsed : new Date(NaN);
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
            // Prefer cached headers captured from DataTables API during init (avoids title rows / multi-headers).
            try {
                if (window.DataTablesColumnHighlighter && window.DataTablesColumnHighlighter.configurations) {
                    var cached = window.DataTablesColumnHighlighter.configurations[tableId];
                    if (cached && Array.isArray(cached.headers) && cached.headers.length > 0) {
                        return cached.headers;
                    }
                }
            } catch (_) { /* noop */ }

            var $table = jQuery('#' + tableId);

            // If table is already initialized, DataTables knows the correct header cells for columns.
            try {
                if (jQuery.fn && jQuery.fn.dataTable && jQuery.fn.dataTable.isDataTable($table)) {
                    var api = $table.DataTable();
                    if (api && api.columns && api.columns().header) {
                        var headerNodes = api.columns().header().toArray();
                        var namesApi = [];
                        for (var i = 0; i < headerNodes.length; i++) {
                            namesApi.push(jQuery(headerNodes[i]).text().trim());
                        }
                        if (namesApi.length > 0) return namesApi;
                    }
                }
            } catch (_) { /* noop */ }

            // Fallback: pick the header row with the most non-empty header cells.
            // This ignores PSWriteHTML-style title rows (<th colspan="...">) and common filter-input header rows.
            try {
                var bestRow = null;
                var bestNonEmpty = -1;
                var bestCount = -1;
                $table.find('thead tr').each(function () {
                    var $ths = jQuery(this).find('th');
                    if (!$ths.length) return;
                    var nonEmpty = 0;
                    $ths.each(function () {
                        var t = (jQuery(this).text() || '').trim();
                        if (t) nonEmpty++;
                    });
                    if (nonEmpty > bestNonEmpty || (nonEmpty === bestNonEmpty && $ths.length > bestCount)) {
                        bestRow = this;
                        bestNonEmpty = nonEmpty;
                        bestCount = $ths.length;
                    }
                });
                if (bestRow) {
                    var namesBest = [];
                    jQuery(bestRow).find('th').each(function () {
                        namesBest.push(jQuery(this).text().trim());
                    });
                    if (namesBest.length > 0) return namesBest;
                }
            } catch (_) { /* noop */ }

            // Last resort: original behavior (may include title rows).
            try {
                var names = [];
                $table.find('thead th').each(function () { names.push(jQuery(this).text().trim()); });
                return names;
            } catch (_) { return []; }
        } catch (e) { return []; }
    }
    function indexToHeaderName(tableId, index) {
        var headers = getHeaderNames(tableId); if (index >= 0 && index < headers.length) { return headers[index]; } return null;
    }
    function headerNameToIndex(tableId, name) {
        var headers = getHeaderNames(tableId); if (!name) return -1; var lname = ('' + name).toLowerCase(); var nname = normalizeName(name);
        for (var i = 0; i < headers.length; i++) { if (('' + headers[i]).toLowerCase() === lname) return i; }
        for (var j = 0; j < headers.length; j++) { if (normalizeName(headers[j]) === nname) return j; }
        return -1;
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
                    var lname = ('' + c.columnName).toLowerCase();
                    for (var h = 0; h < headers.length; h++) { if ((headers[h] + '').toLowerCase() === lname) { c.columnId = h; break; } }
                    if ((c.columnId === undefined || c.columnId === -1)) { var nname = normalizeName(c.columnName); for (var h2 = 0; h2 < headers.length; h2++) { if (normalizeName(headers[h2]) === nname) { c.columnId = h2; break; } } }
                }
                if ((!c.columnName || c.columnName === '') && (typeof c.columnId === 'number')) { if (c.columnId >= 0 && c.columnId < headers.length) { c.columnName = headers[c.columnId]; } }
            } catch(e) {}
            return c;
        },
        normalizeRules: function(tableId, config, table, headers, store){
            try {
                if (!headers) {
                    try {
                        if (table && table.columns && table.columns().header) {
                            var headerNodes = table.columns().header().toArray();
                            headers = [];
                            for (var hi = 0; hi < headerNodes.length; hi++) { headers.push(jQuery(headerNodes[hi]).text().trim()); }
                        }
                    } catch (_) { /* noop */ }
                }
                headers = headers && headers.length ? headers : getHeaderNames(tableId);
                store = store || this.detectStore(table);
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
            var headers = null;
            try {
                if (table && table.columns && table.columns().header) {
                    var headerNodes = table.columns().header().toArray();
                    headers = [];
                    for (var hi = 0; hi < headerNodes.length; hi++) { headers.push(jQuery(headerNodes[hi]).text().trim()); }
                }
            } catch (_) { /* noop */ }
            headers = headers && headers.length ? headers : getHeaderNames(tableId);

            var store = this.detectStore(table);
            var normalized = this.normalizeRules(tableId, Array.isArray(config) ? config : [config], table, headers, store);
            this.configurations[tableId] = { config: normalized, table: table, headers: headers, store: store };
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
            for (var col in styleMap){
                if (!Object.prototype.hasOwnProperty.call(styleMap,col)) continue;
                var style=mergedStyle(styleMap[col]); if (!style) continue;
                // Coerce numeric-like keys back to numbers so index-based targets work reliably
                var key = /^-?\d+$/.test(col) ? parseInt(col, 10) : col;
                var target={ column: key, backgroundColor: style.backgroundColor, textColor: style.textColor, css: style.css, highlightParent: style.highlightParent };
                if (childRow.length>0){ DataTablesColumnHighlighter.applyColumnStyling(childRow, target); }
                DataTablesColumnHighlighter.applyVisibleCellStyling(tableId, $parentRow, target);
            }
        },
        applyColumnStyling: function(childRow, target) {
            var normTarget = normalizeName(target.column);
            childRow.find('.dtr-title').each(function() {
                var $elem = jQuery(this); var text = ($elem.text() || '').trim();
                if (text === target.column || normalizeName(text) === normTarget) {
                    var $dataElem = $elem.siblings('.dtr-data').length > 0 ? $elem.siblings('.dtr-data') : $elem.next();
                    if (target.backgroundColor) { $dataElem.css('background-color', target.backgroundColor); }
                    if (target.textColor) { $dataElem.css('color', target.textColor); }
                    if (target.css) { $dataElem.css(target.css); }
                    if (target.highlightParent) { $elem.parent().css('background-color', target.backgroundColor); if (target.textColor) { $elem.parent().css('color', target.textColor); } }
                }
            });
        },
        applyVisibleCellStyling: function(tableId, $parentRow, target) {
            try {
                var idx = (typeof target.column === 'number') ? target.column : headerNameToIndex(tableId, target.column);
                if (idx < 0) return;
                var $cells = $parentRow.find('td');
                if ($cells.length === 0) return;
                var $cell = $cells.eq(idx);
                if ($cell && $cell.length > 0) {
                    // Set foreground color first
                    if (target.textColor) { $cell.css('color', target.textColor); }

                    // Background highlight: override Bootstrap 5.3 table striped overlay (box-shadow based)
                    if (target.backgroundColor) {
                        // Keep the classic background-color for non-Bootstrap tables or custom themes
                        $cell.css('background-color', target.backgroundColor);
                        // Neutralize per-cell accent var so striped/hover overlays don’t tint our color
                        try { $cell.css('--bs-table-accent-bg', 'transparent'); } catch (e1) { /* noop */ }
                        // Explicitly draw the same full-cell inset overlay with our color so it stays consistent
                        // across striped rows (Bootstrap uses this technique internally)
                        $cell.css('box-shadow', 'inset 0 0 0 9999px ' + target.backgroundColor);
                    }

                    // Custom CSS from the rule takes final precedence
                    if (target.css) { $cell.css(target.css); }
                }
            } catch (e) { }
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
