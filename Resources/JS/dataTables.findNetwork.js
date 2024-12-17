// Usage:
// $('#RandomID').on('select.dt', function (e, dt, type, indexes) {
//     if (type === 'row') {
//         selectNode(dt, indexes, network);
//     }
// });

// $('#RandomID').on('deselect.dt', function (e, dt, type, indexes) {
//     if (type === 'row') {
//         deselectNode(dt, indexes, network);
//     }
// });

// or

// table.on('select.dt', function (e, dt, type, indexes) {
//     if (type === 'row') {
//         selectNode(dt, indexes, network);
//     }
// });

// table.on('deselect.dt', function (e, dt, type, indexes) {
//     if (type === 'row') {
//         deselectNode(dt, indexes, network);
//     }
// });

// or if DiagramTracker is used

// table.on('select.dt', function (e, dt, type, indexes) {
//     if (type === 'row') {
//         selectNode(dt, indexes, diagramTracker['RandomID1']);
//     }
// });

// table.on('deselect.dt', function (e, dt, type, indexes) {
//     if (type === 'row') {
//         deselectNode(dt, indexes, diagramTracker['RandomID1']);
//     }
// });


var originalNodeColors = {};

function selectNode(dataTable, indexes, network) {
    var data = dataTable.row(indexes).data();
    if (data) {
        var nodeId = String(data.Id); // Convert to string
        if (nodeId) {
            var node = network.body.data.nodes.get(nodeId);
            if (node) {
                // Store original colors if not already stored
                if (!originalNodeColors[nodeId]) {
                    originalNodeColors[nodeId] = node.color || null;
                }

                // Update node color to red
                network.body.data.nodes.update({
                    id: nodeId,
                    color: {
                        border: 'red',
                        background: node.color?.background,
                        highlight: {
                            border: 'red',
                            background: node.color?.highlight?.background
                        },
                        hover: {
                            border: 'red',
                            background: node.color?.hover?.background
                        }
                    }
                });
            } else {
                //console.error("Node not found:", nodeId);
            }
        } else {
            //console.error("Node ID is undefined");
        }
    } else {
        //console.error("No data found for the selected row");
    }
}

function deselectNode(dataTable, indexes, network) {
    var data = dataTable.row(indexes).data();
    if (data) {
        var nodeId = String(data.Id); // Convert to string
        if (nodeId) {
            var originalColor = originalNodeColors[nodeId];
            if (originalColor !== undefined) {
                // Revert to original colors or set to null to use default colors
                network.body.data.nodes.update({
                    id: nodeId,
                    color: originalColor
                });
            } else {
                // If no original color stored, set color to null to use default colors
                network.body.data.nodes.update({
                    id: nodeId,
                    color: null
                });
            }
            network.unselectAll();
        } else {
            //console.error("Node ID is undefined");
        }
    } else {
        //console.error("No data found for the deselected row");
    }
}
