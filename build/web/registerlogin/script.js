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

document.addEventListener('DOMContentLoaded', (event) => {
    // Registro de validaciones del formulario
    const registerForm = document.getElementById('registerForm');
    registerForm.addEventListener('submit', (e) => {
        const username = document.getElementById('registerUsername').value.trim();
        const email = document.getElementById('registerEmail').value.trim();
        const password = document.getElementById('registerPassword').value.trim();

        if (!username) {
            alert('Por favor ingresa un nombre de usuario.');
            e.preventDefault();
            return;
        }

        if (!validateEmail(email)) {
            alert('Por favor ingresa un correo válido.');
            e.preventDefault();
            return;
        }

        if (password.length < 6) {
            alert('La contraseña debe tener al menos 6 caracteres.');
            e.preventDefault();
        }
    });

    // Inicio de sesión de validaciones del formulario
    const loginForm = document.getElementById('loginForm');
    loginForm.addEventListener('submit', (e) => {
        const email = document.getElementById('loginEmail').value.trim();
        const password = document.getElementById('loginPassword').value.trim();

        if (!validateEmail(email)) {
            alert('Por favor ingresa un correo válido.');
            e.preventDefault();
            return;
        }

        if (password.length < 6) {
            alert('La contraseña debe tener al menos 6 caracteres.');
            e.preventDefault();
        }
    });

    // Función de validación de correo electrónico
    function validateEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(String(email).toLowerCase());
    }
});
