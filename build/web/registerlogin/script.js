    const urlParams = new URLSearchParams(window.location.search);
    const errorCampos = urlParams.get('errorCampos');
    const errorRegistro = urlParams.get('errorRegistro');
    const errorCredenciales = urlParams.get('errorCredenciales');
    const error = urlParams.get('error');
    const registroExitoso = urlParams.get('registroExitoso');

    if (errorCampos) {
        document.getElementById('error').style.display = "block";
        setTimeout(() => {
            document.getElementById('error').style.display = "none";
        }, 5000); 
    } else if (errorRegistro) {
        document.getElementById('error').style.display = "block";
        setTimeout(() => {
            document.getElementById('error').style.display = "none";
        }, 5000);
    } else if (errorCredenciales) {
        document.getElementById('error').style.display = "block";
        setTimeout(() => {
            document.getElementById('error').style.display = "none";
        }, 5000);
    } else if (error) {
        document.getElementById('error').style.display = "block";
        setTimeout(() => {
            document.getElementById('error').style.display = "none";
        }, 5000);
    } else if (registroExitoso) {
        document.getElementById('success').style.display = "block";
        setTimeout(() => {
            document.getElementById('success').style.display = "none";
        }, 5000);
    }
