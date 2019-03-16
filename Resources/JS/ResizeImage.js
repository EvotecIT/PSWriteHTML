// Takes a data URI and returns the Data URI corresponding to the resized image at the wanted size.
function resizedataURL(datas, wantedWidth, wantedHeight) {
    // We create an image to receive the Data URI
    var img = document.createElement("img");

    // When the event "onload" is triggered we can resize the image.
    img.onload = function () {
        // We create a canvas and get its context.
        var canvas = document.createElement("canvas");
        var ctx = canvas.getContext("2d");

        // We set the dimensions at the wanted size.
        canvas.width = wantedWidth;
        canvas.height = wantedHeight;

        // We resize the image with the canvas method drawImage();
        ctx.drawImage(this, 0, 0, wantedWidth, wantedHeight);

        var dataURI = canvas.toDataURL();

        /////////////////////////////////////////
        // Use and treat your Data URI here !! //
        /////////////////////////////////////////
    };

    // We put the Data URI in the image's src attribute
    img.src = datas;
}
// Use it like that : resizedataURL('yourDataURIHere', 50, 50);
