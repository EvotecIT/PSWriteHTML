// Example usage:
// setupSearch(nodes, edges, 'searchInput', 'searchButton'); // Enables typing search and button click
// setupSearch(nodes, edges, 'searchInput', null, true, 5); // Enables typing search only, with minimum 5 characters

const lastSearchQuery = {}; // Store last search query for each input

function updateVisibility(searchQuery, nodes, edges) {
    var filteredNodes = nodes.get({
        filter: function (item) {
            return item.label.toLowerCase().includes(searchQuery);
        }
    });
    var filteredEdges = edges.get({
        filter: function (item) {
            return filteredNodes.some(node => node.id === item.from || node.id === item.to);
        }
    });

    nodes.get().forEach(node => {
        nodes.update({ id: node.id, hidden: !filteredNodes.some(fNode => fNode.id === node.id) });
    });
    edges.get().forEach(edge => {
        edges.update({ id: edge.id, hidden: !filteredEdges.some(fEdge => fEdge.id === edge.id) });
    });
}

function setupSearch(nodes, edges, inputId, buttonId = null, enableTypingSearch = true, minChars = 3) {
    const inputElement = document.getElementById(inputId);
    const updateVisibilityIfNeeded = (searchQuery) => {
        // Check if the search query has changed significantly since last update
        if (searchQuery !== lastSearchQuery[inputId]) {
            // Only update visibility if searchQuery length is at least minChars or if clearing the search
            if (searchQuery.length >= minChars || searchQuery.length === 0) {
                updateVisibility(searchQuery.toLowerCase(), nodes, edges);
            }
            lastSearchQuery[inputId] = searchQuery; // Update the last search query
        }
    };

    // Always listen to input event to handle the "X" button clear action
    inputElement.addEventListener('input', function () {
        const searchQuery = this.value;
        // If typing search is disabled and input is cleared, update visibility
        if (!enableTypingSearch && searchQuery.length === 0) {
            updateVisibilityIfNeeded(searchQuery);
        } else if (enableTypingSearch) {
            // If typing search is enabled, always update visibility
            updateVisibilityIfNeeded(searchQuery);
        }
    });

    if (buttonId) {
        document.getElementById(buttonId).addEventListener('click', function () {
            const searchQuery = inputElement.value;
            updateVisibilityIfNeeded(searchQuery);
        });
    }
}