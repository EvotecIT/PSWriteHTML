$('.nav-toggle').click(function (e) {
    e.preventDefault();
    $("html").toggleClass("openNav");
    $(".nav-toggle").toggleClass("active");
});