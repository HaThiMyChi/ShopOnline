function previewfile() {
    var perview = document.querySelector(".img");
    var file = document.querySelector('input[tyle=file]').files[0];
    var reader = new FileReader();
    reade.onloadend = function () {
        preview.src = reader.result;
    }
    if (file) {
        reader.readAsDataURL(file);
    } else {
        previewfile.src = "";
    }
}