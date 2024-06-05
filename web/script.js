window.onload = function () {
    const urlParams = new URLSearchParams(window.location.search);
    const loginExitoso = urlParams.get('loginExitoso');
    const sesionCerrada = urlParams.get('sesionCerrada');
    const registroMascota = urlParams.get('registroMascota');
    const solicitudCreada = urlParams.get('solicitudCreada');


    if (loginExitoso || sesionCerrada || registroMascota || solicitudCreada) {
        const successDiv = document.getElementById('success');
        successDiv.style.display = "block";
        setTimeout(() => {
            successDiv.style.transition = "opacity 2s";
            successDiv.style.opacity = 0;
            setTimeout(() => {
                successDiv.style.display = "none";
            }, 2000);
        }, 3000);
    }
}