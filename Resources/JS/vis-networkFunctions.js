function clusterByCid() {
    network.setData(data);
    var clusterOptionsByData = {
        joinCondition: function (childOptions) {
            return childOptions.cid == 1;
        },
        clusterNodeProperties: { id: 'cidCluster', borderWidth: 3, shape: 'database' }
    };
    network.cluster(clusterOptionsByData);
}
function clusterByColor() {
    network.setData(data);
    var colors = ['orange', 'lime', 'DarkViolet'];
    var clusterOptionsByData;
    for (var i = 0; i < colors.length; i++) {
        var color = colors[i];
        clusterOptionsByData = {
            joinCondition: function (childOptions) {
                return childOptions.color.background == color; // the color is fully defined in the node.
            },
            processProperties: function (clusterOptions, childNodes, childEdges) {
                var totalMass = 0;
                for (var i = 0; i < childNodes.length; i++) {
                    totalMass += childNodes[i].mass;
                }
                clusterOptions.mass = totalMass;
                return clusterOptions;
            },
            clusterNodeProperties: { id: 'cluster:' + color, borderWidth: 3, shape: 'database', color: color, label: 'color:' + color }
        };
        network.cluster(clusterOptionsByData);
    }
}
function clusterByConnection() {
    network.setData(data);
    network.clusterByConnection(1)
}
function clusterOutliers() {
    network.setData(data);
    network.clusterOutliers();
}
function clusterByHubsize() {
    network.setData(data);
    var clusterOptionsByData = {
        processProperties: function (clusterOptions, childNodes) {
            clusterOptions.label = "[" + childNodes.length + "]";
            return clusterOptions;
        },
        clusterNodeProperties: { borderWidth: 3, shape: 'box', font: { size: 30 } }
    };
    network.clusterByHubsize(undefined, clusterOptionsByData);
}