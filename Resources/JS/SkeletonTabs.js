(function () {
    function main() {
        var tabButtons = [].slice.call(
            document.querySelectorAll("ul.tab-nav li a.buttonTab")
        );

        tabButtons.map(function (button) {
            button.addEventListener("click", function () {
                document
                    .querySelector("li a.active.buttonTab")
                    .classList.remove("active");
                button.classList.add("active");

                document
                    .querySelector(".tab-pane.active")
                    .classList.remove("active");
                document
                    .querySelector(button.getAttribute("href"))
                    .classList.add("active");
            });
        });
    }

    if (document.readyState !== "loading") {
        main();
    } else {
        document.addEventListener("DOMContentLoaded", main);
    }
})();
