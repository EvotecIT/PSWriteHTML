var maxWidth = 0;
var $element;
$(".tabs a").each(function () {
    $element = $(this);
    if ($element.width() > maxWidth) {
        maxWidth = $element.width();
    }
});

// Get on Resize function
$(window).on('resize', function () {
    $(".selector").hide();
    var activeItem = $(".tabs a[class*='active']");
    var id = activeItem.data("id");
    setSelectorPosition(id);
});

$(".tabs a").each(function () {
    $(this).width(maxWidth);
});

// Set first active link
var activeItem = $(".tabs a[class*='active']");
var id = activeItem.data("id");
setSelectorPosition(id);

// Get on click function
$(".tabs").on("click", "a", function (e) {
    e.preventDefault();
    $('.tabs a').removeClass("active");
    $(this).addClass('active');

    // Get id of link clicked
    var id = $(this).data("id");

    // Set selector position
    setSelectorPosition(id);

    // Hide all tabs
    $('.tabs-content').hide();

    // Show current tab
    $('#' + id).show();
});

function setSelectorPosition(id) {
    var activeItem = $(".tabs").find("[data-id=" + id + "]");
    var activeWidth = activeItem.innerWidth();
    var itemPos = activeItem.position();
    $(".selector").css({
        "left": itemPos.left + "px",
        "top": itemPos.top + "px",
        "width": activeItem.innerWidth() + "px",
        "height": activeItem.innerHeight() + "px"
    });
    $(".selector").show();
}