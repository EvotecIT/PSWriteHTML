(function () {
    var addedViewBoxes = [];

    window.addEventListener('beforeprint', function () {
        var charts = document.querySelectorAll('.pswritehtml-apex-chart > .apexcharts-canvas > svg.apexcharts-svg');
        charts.forEach(function (svg) {
            if (svg.hasAttribute('viewBox')) {
                return;
            }

            // ApexCharts draws the plot in screen pixels. Preserve that coordinate
            // system so the browser can scale the whole plot for the printed page.
            var width = Number(svg.getAttribute('width'));
            var height = Number(svg.getAttribute('height'));
            if (width > 0 && height > 0 && isFinite(width) && isFinite(height)) {
                var viewBox = '0 0 ' + width + ' ' + height;
                svg.setAttribute('viewBox', viewBox);
                addedViewBoxes.push({ svg: svg, value: viewBox });
            }
        });
    });

    window.addEventListener('afterprint', function () {
        addedViewBoxes.forEach(function (entry) {
            if (entry.svg.getAttribute('viewBox') === entry.value) {
                entry.svg.removeAttribute('viewBox');
            }
        });
        addedViewBoxes = [];
    });
}());
