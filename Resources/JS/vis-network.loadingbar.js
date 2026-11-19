function loadDiagramWithFonts(container, data, options, id, loader, fonts, onLoad) {
    function load() {
        onLoad(loadDiagram(container, data, options, id, loader));
    }

    if (!fonts) {
        load();
    } else if (document.fonts) {
        Promise.all([
            document.fonts.load('normal normal 900 24px/1 "Font Awesome 5 Free"'),
            document.fonts.load('normal normal 900 24px/1 "Font Awesome 5 Brands"')
        ]).catch(function (error) {
            console.warn("Failed to load diagram icon fonts.", error);
        }).then(load);
    } else {
        // Allow the fonts to load on browsers without the Font Loading API.
        setTimeout(load, 500);
    }
}

function loadDiagram(container, data, options, id, loader) {
    var network = new vis.Network(container, data, options);
    if (loader == true) {
        network.on("stabilizationProgress", function (params) {
            var maxWidth = 496;
            var minWidth = 20;
            var widthFactor = params.iterations / params.total;
            var width = Math.max(minWidth, maxWidth * widthFactor);

            document.getElementById(id + "-diagramBar").style.width = width + "px";
            document.getElementById(id + "-diagramText").innerHTML = Math.round(widthFactor * 100) + "%";
        });
        network.once("stabilizationIterationsDone", function () {
            document.getElementById(id + "-diagramText").innerHTML = "100%";
            document.getElementById(id + "-diagramBar").style.width = "100%";
            document.getElementById(id + "-diagramLoadingBar").style.opacity = 0;
            // really clean the dom element
            setTimeout(function () {
                document.getElementById(id + "-diagramLoadingBar").style.display = "none";
            }, 500);
        });
    }
    return network;
}