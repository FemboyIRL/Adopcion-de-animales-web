document.addEventListener("DOMContentLoaded", function() {
    const urlParams = new URLSearchParams(window.location.search);
    const solicitudEliminada = urlParams.get('solicitudEliminada');
    const errorEliminar = urlParams.get('errorEliminar');
    
    if (solicitudEliminada) {
        const successElement = document.getElementById('success');
        successElement.style.display = "block";
        setTimeout(() => {
            successElement.style.display = "none";
        }, 5000);
    } else if (errorEliminar) {
        const errorElement = document.getElementById('error');
        errorElement.style.display = "block";
        setTimeout(() => {
            errorElement.style.display = "none";
        }, 5000);
    }
});
