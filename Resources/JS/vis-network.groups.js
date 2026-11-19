function setupDiagramGroups(network, nodes, edges, container, definitions, edgeDefaults) {
    const controls = document.getElementById(container.id + "-groups");
    const groups = definitions.map(function (definition, index) {
        let id = container.id + "-group-" + index;
        while (nodes.get(id) !== null) {
            id += "-";
        }
        const button = document.createElement("button");
        button.type = "button";
        button.setAttribute("aria-controls", container.id);
        controls.appendChild(button);

        return { id, button, name: definition.name, nodeIds: new Set(definition.nodeIds) };
    });

    function updateButton(group) {
        const expanded = !network.isCluster(group.id);
        group.button.setAttribute("aria-expanded", String(expanded));
        group.button.textContent = (expanded ? "Collapse " : "Expand ") + group.name;
    }

    function collapse(group) {
        network.cluster({
            joinCondition: node => group.nodeIds.has(node.id) && !node.hidden,
            clusterNodeProperties: {
                id: group.id,
                label: group.name,
                shape: "box",
                color: { border: "#425c78", background: "#e8eff7" },
                font: { color: "#24374b" },
                allowSingleNodeCluster: true
            }
        });
        updateButton(group);
    }

    function expand(group) {
        if (network.isCluster(group.id)) {
            network.openCluster(group.id, {
                releaseFunction: (clusterPosition, memberPositions) => memberPositions
            });
            updateButton(group);
        }
    }

    network.on("beforeDrawing", function (context) {
        context.save();
        context.font = "bold 14px sans-serif";
        context.textBaseline = "top";
        for (const group of groups) {
            if (network.isCluster(group.id)) {
                continue;
            }
            const bounds = expandedDiagramGroupBounds(network, nodes, group.nodeIds);
            if (!bounds) {
                continue;
            }
            const left = bounds.left - 16;
            const top = bounds.top - 34;
            const width = Math.max(bounds.right - left + 16, context.measureText(group.name).width + 24);
            const height = bounds.bottom - top + 16;
            context.fillStyle = "rgba(232, 239, 247, 0.72)";
            context.fillRect(left, top, width, height);
            context.lineWidth = 1.5;
            context.strokeStyle = "#597491";
            context.strokeRect(left, top, width, height);
            context.fillStyle = "#24374b";
            context.fillText(group.name, left + 12, top + 9);
        }
        context.restore();
    });

    groups.forEach(function (group, index) {
        group.button.addEventListener("click", function () {
            if (network.isCluster(group.id)) {
                expand(group);
            } else {
                collapse(group);
            }
            describeDiagramGroupLinks(network, edges, groups, edgeDefaults);
        });
        if (definitions[index].collapsed) {
            collapse(group);
        } else {
            updateButton(group);
        }
    });
    describeDiagramGroupLinks(network, edges, groups, edgeDefaults);
    network.redraw();

    // Open the clusters before search updates the original nodes and links.
    return function () {
        groups.forEach(expand);
    };
}

function describeDiagramGroupLinks(network, edges, groups, edgeDefaults) {
    const clusteredEdges = new Set();
    for (const group of groups) {
        if (network.isCluster(group.id)) {
            network.getConnectedEdges(group.id).forEach(id => clusteredEdges.add(id));
        }
    }
    for (const id of clusteredEdges) {
        const baseEdges = network.getBaseEdges(id).map(edgeId => edges.get(edgeId)).filter(Boolean);
        if (baseEdges.length < 2) {
            continue;
        }

        // Vis-network combines parallel and opposite-direction links into one edge.
        // Describe all the underlying links without changing the original edges.
        const [, to] = network.getConnectedNodes(id);
        const visibleEdges = baseEdges.filter(edge => !edge.hidden);
        const labels = visibleEdges.map(edge => edge.label).filter(Boolean);
        let arrowFrom = false;
        let arrowTo = false;
        for (const edge of visibleEdges) {
            const sameDirection = network.findNode(edge.to)[0] === to;
            const fromEnabled = edge.arrows?.from?.enabled ?? edgeDefaults?.arrows?.from?.enabled;
            const toEnabled = edge.arrows?.to?.enabled ?? edgeDefaults?.arrows?.to?.enabled;
            arrowFrom = arrowFrom || Boolean(sameDirection ? fromEnabled : toEnabled);
            arrowTo = arrowTo || Boolean(sameDirection ? toEnabled : fromEnabled);
        }
        network.clustering.updateEdge(id, {
            label: labels.join(" / ") || (visibleEdges.length > 1 ? visibleEdges.length + " links" : ""),
            hidden: visibleEdges.length === 0,
            arrows: { from: { enabled: arrowFrom }, to: { enabled: arrowTo } }
        });
    }
}

function expandedDiagramGroupBounds(network, nodes, nodeIds) {
    let bounds = null;
    for (const id of nodeIds) {
        const node = nodes.get(id);
        if (!node || node.hidden) {
            continue;
        }
        const box = network.getBoundingBox(id);
        if (!bounds) {
            bounds = { ...box };
        } else {
            bounds.left = Math.min(bounds.left, box.left);
            bounds.top = Math.min(bounds.top, box.top);
            bounds.right = Math.max(bounds.right, box.right);
            bounds.bottom = Math.max(bounds.bottom, box.bottom);
        }
    }
    return bounds;
}
