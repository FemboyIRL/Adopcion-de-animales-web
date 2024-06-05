function openModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
}

function closeModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}

document.getElementById('fileInput').addEventListener('change', function () {
    document.getElementById('imageForm').submit();
});

window.onload = function () {
    const urlParams = new URLSearchParams(window.location.search);
    const mascotaEliminada = urlParams.get('mascotaEliminada');
    const solicitudAprobada = urlParams.get('solicitudAprobada');
    const datosActualizados = urlParams.get('datosActualizados');
    const errorEliminar = urlParams.get('errorEliminar');
    const errorSolicitud = urlParams.get('errorSolicitud');
    const errorIguales = urlParams.get('errorIguales');
    const error = urlParams.get('error');

    const successDiv = document.getElementById('success');
    const errorDiv = document.querySelector('.error');

    if (mascotaEliminada || solicitudAprobada || datosActualizados) {
        successDiv.style.display = "block";
        setTimeout(() => {
            successDiv.style.transition = "opacity 2s";
            successDiv.style.opacity = 0;
            setTimeout(() => {
                successDiv.style.display = "none";
            }, 2000);
        }, 3000);
    }

    if (errorEliminar || errorSolicitud || errorIguales || error) {
        errorDiv.style.display = "block";
        setTimeout(() => {
            errorDiv.style.transition = "opacity 2s";
            errorDiv.style.opacity = 0;
            setTimeout(() => {
                errorDiv.style.display = "none";
            }, 2000);
        }, 3000);
    }
}

