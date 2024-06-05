const urlParams = new URLSearchParams(window.location.search);
const errorCampos = urlParams.get('errorCampos');
const errorRegistro = urlParams.get('errorRegistro');
const errorCredenciales = urlParams.get('errorCredenciales');
const error = urlParams.get('error');
const errorSesion = urlParams.get('errorSesion');
const registroExitoso = urlParams.get('registroExitoso');

if (errorCampos || errorRegistro || errorCredenciales || error || errorSesion) {
        const successDiv = document.getElementById('error');
        successDiv.style.display = "block";
        setTimeout(() => {
            successDiv.style.transition = "opacity 2s";
            successDiv.style.opacity = 0;
            setTimeout(() => {
                successDiv.style.display = "none";
            }, 2000);
        }, 3000);
    }

if (registroExitoso) {
    document.getElementById('success').style.display = "block";
    setTimeout(() => {
        document.getElementById('success').style.display = "none";
    }, 5000);
}
