/*!
 * Toggle View button for Buttons and DataTables.
 * Switches between responsive and scrollX modes.
 */
!function (n) { var o, r; "function" == typeof define && define.amd ? define(["jquery", "datatables.net", "datatables.net-buttons"], function (t) { return n(t, window, document) }) : "object" == typeof exports ? (o = require("jquery"), r = function (t, e) { e.fn.dataTable || require("datatables.net")(t, e), e.fn.dataTable.Buttons || require("datatables.net-buttons")(t, e) }, "undefined" == typeof window ? module.exports = function (t, e) { return t = t || window, e = e || o(t), r(t, e), n(e, t, t.document) } : (r(window, o), module.exports = n(o, window, window.document))) : n(jQuery, window, document) }(function (n, t, e) {
    "use strict";
    var o = n.fn.dataTable;

    // Add the toggleView button type
    n.extend(o.ext.buttons, {
        toggleView: {
            className: "buttons-toggle-view",
            text: function () {
                return "Toggle View";
            },
            action: function (e, dt, node, config) {
                // Check current state
                var settings = dt.settings()[0];
                var isResponsive = settings.responsive !== undefined;
                var isScrollX = settings.oInit.scrollX === true;

                // Get current page and order to restore after rebuild
                var currentPage = dt.page();
                var currentOrder = dt.order();

                // Get the table node
                var table = dt.table().node();

                // Preserve all current options
                var options = dt.init();

                // Destroy current DataTable instance
                dt.destroy();

                if (isResponsive) {
                    // Current mode is responsive, switch to scrollX
                    // Store current responsive config if not already stored
                    if (!options.responsiveConfig && options.responsive) {
                        options.responsiveConfig = options.responsive;
                    }
                    options.responsive = false;
                    options.scrollX = true;
                    n(node).text("Switch to Responsive");
                } else {
                    // Current mode is scrollX or default, switch to responsive
                    // Check if we have a stored responsive configuration from PowerShell
                    if (options.responsiveConfig) {
                        // Use the stored responsive configuration
                        options.responsive = options.responsiveConfig;
                        // Keep the configuration stored for future toggles
                    } else {
                        // Fallback to basic responsive configuration
                        options.responsive = {
                            details: {
                                type: 'inline'
                            }
                        };
                    }
                    options.scrollX = false;
                    n(node).text("Switch to ScrollX");
                }

                // Recreate table with new options
                var newTable = n(table).DataTable(options);

                // Restore state
                if (currentPage !== undefined) {
                    newTable.page(currentPage).draw('page');
                }

                if (currentOrder !== undefined && currentOrder.length) {
                    newTable.order(currentOrder).draw();
                }
            }
        }
    });

    return o;
});
