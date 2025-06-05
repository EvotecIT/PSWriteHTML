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
            className: "buttons-toggle-view", text: function (dt, node, config) {
                // Set initial button text based on current state
                var settings = dt.settings()[0];
                var isResponsive = settings.responsive !== undefined;
                var isScrollX = settings.oInit.scrollX === true;

                if (isResponsive) {
                    return "Switch to ScrollX";
                } else {
                    return "Switch to Responsive";
                }
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
                }
                // Recreate table with new options
                var newTable = n(table).DataTable(options);

                // Find the toggleView button in the new table instance
                var buttons = newTable.buttons();
                var toggleButtonIndex = -1;

                // Find the index of the toggleView button
                for (var i = 0; i < buttons.length; i++) {
                    var buttonConfig = newTable.button(i).node();
                    if (n(buttonConfig).hasClass('buttons-toggle-view')) {
                        toggleButtonIndex = i;
                        break;
                    }
                }

                // Update button text based on new state
                var newSettings = newTable.settings()[0];
                var newIsResponsive = newSettings.responsive !== undefined;
                var newIsScrollX = newSettings.oInit.scrollX === true;
                var newButtonText = "Switch to Responsive";
                if (newIsResponsive) {
                    newButtonText = "Switch to ScrollX";
                }

                // Update the button text using DataTables API
                if (toggleButtonIndex >= 0) {
                    newTable.button(toggleButtonIndex).text(newButtonText);
                }

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
