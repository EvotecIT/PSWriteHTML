/**
 * DataTables Column Highlighter for Responsive Child Rows
 * Allows highlighting specific columns in expanded child rows based on configuration
 */

// Main highlighting system
window.DataTablesColumnHighlighter = {
    // Storage for table configurations
    configurations: {},

    /**
     * Initialize highlighting for a table
     * @param {string} tableId - The ID of the DataTable
     * @param {Array} config - Array of column highlighting configurations
     * @param {Object} table - The DataTable instance
     */
    init: function(tableId, config, table) {
        console.log('Initializing DataTables Column Highlighter for:', tableId);

        // Store configuration
        this.configurations[tableId] = {
            config: config,
            table: table
        };

        // Set up event handlers
        this.setupEventHandlers(tableId, table);
    },

    /**
     * Set up event handlers for the table
     */
    setupEventHandlers: function(tableId, table) {
        const self = this;

        // Method 1: DataTables API event handler
        table.on('click', 'td.dtr-control', function (e) {
            console.log('Expand button clicked via DataTables API');
            let tr = e.target.closest('tr');
            let row = table.row(tr);

            setTimeout(function() {
                if (row.child.isShown()) {
                    console.log('Row expanded, applying highlighting...');
                    self.applyHighlighting(tableId, $(tr), row.data());
                }
            }, 100);
        });

        // Method 2: jQuery fallback event handler
        $(`#${tableId} tbody`).on('click', 'td.dtr-control, td.dt-control, .dtr-control, .dt-control', function () {
            console.log('Expand button clicked via jQuery fallback');
            let $tr = $(this).closest('tr');

            setTimeout(function() {
                let childRow = $tr.next('tr.child');
                if (childRow.length > 0) {
                    console.log('Child row found, applying highlighting...');
                    // Get row data from the DOM since we don't have the DataTables row object
                    let rowData = [];
                    $tr.find('td').each(function(index) {
                        if (!$(this).hasClass('dtr-control') && !$(this).hasClass('dt-control')) {
                            rowData.push($(this).text().trim());
                        }
                    });
                    self.applyHighlighting(tableId, $tr, rowData);
                }
            }, 100);
        });
    },

    /**
     * Apply highlighting based on configuration
     */
    applyHighlighting: function(tableId, $parentRow, rowData) {
        const config = this.configurations[tableId].config;
        const childRow = $parentRow.next('tr.child');

        if (childRow.length === 0) {
            console.log('No child row found');
            return;
        }

        console.log('Applying highlighting with config:', config);
        console.log('Row data:', rowData);

        // Process each configuration rule
        config.forEach(rule => {
            this.processRule(rule, childRow, rowData);
        });
    },

    /**
     * Process a single highlighting rule
     */
    processRule: function(rule, childRow, rowData) {
        console.log('Processing rule:', rule);

        // Check if the condition matches
        if (this.matchesCondition(rule.condition, rowData)) {
            console.log('Condition matched, applying styling...');

            // Apply styling to target columns
            rule.targets.forEach(target => {
                this.applyColumnStyling(childRow, target);
            });
        }
    },

    /**
     * Check if a condition matches the row data
     */
    matchesCondition: function(condition, rowData) {
        if (!condition) return true; // No condition means always apply

        // Support different condition types
        if (condition.column !== undefined && condition.value !== undefined) {
            // Column index-based condition
            if (typeof condition.column === 'number') {
                return rowData[condition.column] === condition.value;
            }
            // Column name-based condition would require header mapping
        }

        if (condition.anyColumn && condition.value !== undefined) {
            // Check if any column contains the value
            return rowData.some(cellValue => cellValue === condition.value);
        }

        return false;
    },

    /**
     * Apply styling to a specific column in the child row
     */
    applyColumnStyling: function(childRow, target) {
        console.log('Applying styling to column:', target.column);

        // Find the target column in the child row
        childRow.find('*').each(function() {
            const $elem = $(this);
            const text = $elem.text().trim();

            if (text === target.column) {
                console.log('Found target column element:', target.column);

                // Apply styling to the data element
                const $dataElem = $elem.siblings('.dtr-data').length > 0 ?
                    $elem.siblings('.dtr-data') :
                    $elem.next();

                if (target.backgroundColor) {
                    $dataElem.css('background-color', target.backgroundColor);
                }

                if (target.textColor) {
                    $dataElem.css('color', target.textColor);
                }

                if (target.css) {
                    $dataElem.css(target.css);
                }

                // Also try parent element in case structure is different
                if (target.highlightParent) {
                    $elem.parent().css('background-color', target.backgroundColor);
                    if (target.textColor) {
                        $elem.parent().css('color', target.textColor);
                    }
                }
            }
        });
    },

    /**
     * Helper method to create simple configuration
     */
    createConfig: function(conditions, targets) {
        return [{
            condition: conditions,
            targets: Array.isArray(targets) ? targets : [targets]
        }];
    }
};

// Helper function for easy setup
window.setupColumnHighlighting = function(tableId, config, table) {
    DataTablesColumnHighlighter.init(tableId, config, table);
};