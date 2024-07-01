// function loadDiagramWithFonts(container, data, options, id, loader, fonts) {
//     var network;
//     if (fonts == true) {
//         if (document.fonts) {
//             // Decent browsers: Make sure the fonts are loaded.
//             document.fonts
//                 .load('normal normal 900 24px/1 "Font Awesome 5 Free"')
//                 .catch(console.error.bind(console, "Failed to load Font Awesome 5."))
//                 .then(
//                     document.fonts
//                         .load('normal normal 900 24px/1 "Font Awesome 5 Brands"')
//                         .catch(console.error.bind(console, "Failed to load Font Awesome 5."))
//                         .then(
//                             network = loadDiagram(container, data, options, id, loader)
//                         )
//                         .catch(
//                             console.error.bind(console, "Failed to render the network with Font Awesome 5.")
//                         )
//                 ).catch(
//                     console.error.bind(console, "Failed to render the network with Font Awesome 5.")
//                 );
//         } else {
//             // IE: Let's just hope the fonts are loaded (they're probably not, hence the timeout).
//             network = window.addEventListener("load", function () {
//                 setTimeout(function () {
//                     loadDiagram(container, data, options, id, loader);
//                 }, 500);
//             });
//         }
//     } else {
//         network = loadDiagram(container, data, options, id, loader);
//     }
//     return network;
// }

function loadDiagramWithFonts(container, data, options, id, loader, fonts) {
    var networkPromise;

    if (fonts === true && document.fonts) {
        // Use Promise.all to wait for all fonts to be loaded
        networkPromise = Promise.all([
            document.fonts.load('normal normal 900 24px/1 "Font Awesome 5 Free"'),
            document.fonts.load('normal normal 900 24px/1 "Font Awesome 5 Brands"')
        ]).then(() => loadDiagram(container, data, options, id, loader))
          .catch(error => {
              console.error("Failed to load fonts or render the network:", error);
          });
    } else if (fonts === true) {
        // For browsers where document.fonts is not supported, attempt to load the diagram directly
        console.warn("Font loading detection not supported. Attempting to load the diagram directly.");
        networkPromise = Promise.resolve(loadDiagram(container, data, options, id, loader));
    } else {
        // If fonts loading is not requested, load the diagram directly
        networkPromise = Promise.resolve(loadDiagram(container, data, options, id, loader));
    }

    return networkPromise;
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