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
        const expanded = !isDiagramGroupCollapsed(network, group);
        group.button.setAttribute("aria-expanded", String(expanded));
        group.button.textContent = (expanded ? "Collapse " : "Expand ") + group.name;
    }

    function collapse(group) {
        clearDiagramGroupSelection(network);
        network.cluster({
            joinCondition: node => group.nodeIds.has(node.id) && !node.hidden,
            processProperties: function (cluster, members) {
                const levels = members.map(node => node.level).filter(Number.isFinite);
                if (levels.length > 0) {
                    // Explicit hierarchical layouts also need a level for the folded node.
                    cluster.level = levels.reduce((minimum, level) => Math.min(minimum, level));
                }
                return cluster;
            },
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
        if (isDiagramGroupCollapsed(network, group)) {
            clearDiagramGroupSelection(network);
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
            if (isDiagramGroupCollapsed(network, group)) {
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
            if (isDiagramGroupCollapsed(network, group)) {
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

function isDiagramGroupCollapsed(network, group) {
    // An expanded group has no cluster node, and isCluster logs errors for missing IDs.
    return network.findNode(group.id).length > 0 && network.isCluster(group.id);
}

function clearDiagramGroupSelection(network) {
    const selection = network.getSelection();
    if (selection.nodes.length || selection.edges.length) {
        network.unselectAll();
        // Programmatic unselection does not refresh the manipulation toolbar.
        network.emit("select", network.getSelection());
    }
}

function describeDiagramGroupLinks(network, edges, groups, edgeDefaults) {
    const clusteredEdges = new Set();
    for (const group of groups) {
        if (isDiagramGroupCollapsed(network, group)) {
            network.getConnectedEdges(group.id).forEach(id => clusteredEdges.add(id));
        }
    }

    const baseIdsByClusterEdge = new Map([...clusteredEdges].map(id => [id, new Set(network.getBaseEdges(id))]));
    if (baseIdsByClusterEdge.size === 0) {
        return;
    }
    // getBaseEdges bounds its traversal, so recover any additional links from the source.
    for (const baseId of edges.getIds()) {
        const [clusteredId] = network.getClusteredEdges(baseId);
        baseIdsByClusterEdge.get(clusteredId)?.add(baseId);
    }

    for (const [id, baseIds] of baseIdsByClusterEdge) {
        const baseEdges = edges.get([...baseIds]);
        // Vis-network combines parallel and opposite-direction links into one edge.
        // Describe all the underlying links without changing the original edges.
        const [from, to] = network.getConnectedNodes(id);
        if (network.findNode(from)[0] !== from || network.findNode(to)[0] !== to) {
            continue;
        }
        const labels = [];
        let visibleCount = 0;
        let arrowFrom = false;
        let arrowTo = false;
        for (const edge of baseEdges) {
            const source = network.findNode(edge.from)[0];
            const target = network.findNode(edge.to)[0];
            const sameDirection = source === from && target === to;
            const reverseDirection = source === to && target === from;
            if (edge.hidden || source === target || (!sameDirection && !reverseDirection)) {
                continue;
            }
            visibleCount++;
            if (edge.label) {
                labels.push(edge.label);
            }
            for (const position of ["from", "middle", "to"]) {
                const local = edge.arrows?.[position];
                const defaults = edgeDefaults?.arrows?.[position];
                if (local?.enabled ?? defaults?.enabled) {
                    const flipped = (local?.scaleFactor ?? defaults?.scaleFactor ?? 1) < 0;
                    const alongLink = (position !== "from") !== flipped;
                    if (alongLink === sameDirection) {
                        arrowTo = true;
                    } else {
                        arrowFrom = true;
                    }
                }
            }
        }
        if (visibleCount === 0) {
            // Opening a neighboring group can leave a replacement for an internal self-loop.
            network.clustering.updateEdge(id, { hidden: true });
            continue;
        }
        if (baseEdges.length === 1) {
            continue;
        }
        const showCount = visibleCount > 3 || (visibleCount > 1 && labels.length !== visibleCount);
        network.clustering.updateEdge(id, {
            label: showCount ? visibleCount + " links" : labels.join(" / "),
            hidden: false,
            arrows: {
                from: { enabled: arrowFrom, type: "arrow", scaleFactor: 1 },
                middle: { enabled: false },
                to: { enabled: arrowTo, type: "arrow", scaleFactor: 1 }
            }
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
