document.getElementById("course_avatar").onchange = function () {
    var reader = new FileReader();

    reader.onload = function (e) {
        // get loaded data and render thumbnail.
        document.getElementById("avatar").src = e.target.result;
    };

    // read the image file as a data URL.
    reader.readAsDataURL(this.files[0]);
};

document.getElementById("course_coverphoto").onchange = function () {
    var reader = new FileReader();

    reader.onload = function (e) {
        document.getElementById("coverphoto").src = e.target.result;
    };

    reader.readAsDataURL(this.files[0]);
};
