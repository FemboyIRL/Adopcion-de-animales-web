window.onload = function () {
    const urlParams = new URLSearchParams(window.location.search);
    const errorSolicitud = urlParams.get('errorSolicitud');
    const error = urlParams.get('error');
    const errorDiv = document.getElementById('error');

    if (errorSolicitud !== null) {
        errorDiv.style.display = "block";
        setTimeout(() => {
            errorDiv.style.transition = "opacity 2s";
            errorDiv.style.opacity = 0;
            setTimeout(() => {
                errorDiv.style.display = "none";
            }, 2000);
        }, 3000);
    } else if (error !== null) {
        errorDiv.style.display = "block";
        setTimeout(() => {
            errorDiv.style.transition = "opacity 2s";
            errorDiv.style.opacity = 0;
            setTimeout(() => {
                errorDiv.style.display = "none";
            }, 2000);
        }, 3000);
    } else {
        errorDiv.style.display = "none";
    }
}
