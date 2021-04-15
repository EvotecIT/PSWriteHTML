/*  Project: Side Penal (Responsive Side Navigation)
 *   Frameworks: jQuery 3.3.1 & Font Awesome 4.7.0
 *   Author: Asif Mughal
 *   GitHub: https://github.com/CodeHimBlog
 *   URL: https://www.codehim.com
 *   License: MIT License
 *   Copyright (c) 2018 - Asif Mughal
 */
/* File: jquery.side.penal.js */
$(function () {
    var sidePenal,
        toggleButton,
        penalSelect,
        penalTrigger,
        penalClose,
        openTopLinks,
        dimmyBackground;

    //Accessing Side Penal elements
    sidePenal = $(".side-penal");
    toggleButton = $(".toggle-buttons").find("li");
    penalSelect = $(".penal-select");
    penalTrigger = $(".penal-trigger");

    //Creating some elements for extra functionalities
    penalClose = $span();
    dimmyBackground = $div();
    openTopLinks = $span();

    //Adding class to close button after and append to side penal
    $(penalClose)
        .addClass("penal-close")
        .prependTo(sidePenal);

    //Background will be dim when side penal navigation display
    $(dimmyBackground)
        .addClass("dim-overlay")
        .insertAfter(sidePenal);

    //Functionality for toggle switch buttons that are available in side penal
    $(toggleButton).click(function () {
        $(this)
            .toggleClass("active");
        if ($(this).hasClass("active")) {
            $(this)
                .html("Toggle Switch On");
        }
        else {
            $(this)
                .html("Switch Me");
        }
    });

    //Functionality for penal select menu
    $(penalSelect).on('input', function () {
        var $thisOption = $(this).val();

        alert("You Select " + $thisOption);

    });

    // Open side penal navigation with penal trigger
    $(penalTrigger).click(function () {

        $(sidePenal).addClass("open");

        $(dimmyBackground).fadeIn("slow");

    });

    //Close side penal navigation with penal close
    $(penalClose).click(function () {

        $(sidePenal).removeClass("open");

        $(dimmyBackground).fadeOut("slow");

    });

    //A vertical ellipsis icon to open top links
    $(openTopLinks)
        .addClass("top-links-trigger")
        .insertAfter(penalClose);

    //Open top links when click ellipsis icon
    $(openTopLinks).click(function () {
        $(".top-links").fadeIn();

    });

    //Close top links if user click outside of it
    $(window).click(function (e) {
        if ($(e.target).closest('.top-links').length || $(e.target).closest('.top-links-trigger').length) {
            return;
        }

        $(".top-links").fadeOut();
    });

    function $div() {
        return document.createElement("div");
    }
    function $span() {
        return document.createElement("span");
    }

});