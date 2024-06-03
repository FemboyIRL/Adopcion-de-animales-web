<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pantalla de Inicio - Patitas Felices Veterinaria</title>
        <script defer src="script.js"></script>
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <nav class="navbar">
            <div class="navbar-container">
                <a href="../../index.jsp" class="navbar-logo">
                    <img src="../../assets/Icons/logo.png" alt="Patitas Felices Veterinaria">
                </a>
                <ul class="navbar-menu">
                    <li><a href="../../index.jsp">Inicio</a></li>
                    <li><a href="../adopciones/screen.jsp">Adopciones</a></li>
                    <li><a href="../como_adoptar/screen.jsp">¿Cómo adoptar?</a></li>
                    <li><a href="../dar_adopcion/screen.jsp">Dar en adopción</a></li>
                </ul>
                <% if (session.getAttribute(
                            "usuario") != null) { %>
                <div class="account">
                    <button onclick="window.location.href = '../mi_cuenta/screen.jsp'"><i class="fa-regular fa-user"></i></button>
                    <button onclick="window.location.href = '../mi_cuenta/screen.jsp'"><i class="fa-solid fa-sign-out"></i></button>
                </div>

                <% } else { %>
                <button class="navbar-login" onclick="window.location.href = 'registerlogin/screen.jsp'">Iniciar sesión</button>
                <% }%>
            </div>
        </nav>
        <div class="row">
            <div class="content">
                <div class="contentText">
                    <p><i class="fa-solid fa-paw"></i> Por favor, completa el formulario si deseas dar en adopción una mascota.</p>
                </div>
                <div class="adoptForm">
                    <form action="/Adopcion_de_animales_web/SvProcesarFormulario" method="POST" enctype="multipart/form-data" class="adoptForm">
                        <label for="motivo">Motivo de dar en adopción:</label>
                        <select name="motivo" id="motivo" onchange="mostrarOtroMotivo()">
                            <option value="falta_espacio">Falta de espacio</option>
                            <option value="cambio_circunstancias">Cambio de circunstancias personales</option>
                            <option value="no_puede_cuidar">No puedo cuidar a la mascota</option>
                            <option value="otro">Otro motivo</option>
                        </select>

                        <label for="otroMotivo" id="otroMotivoLabel" style="display: none;">Especifica el otro motivo:</label>
                        <textarea id="otroMotivo" name="otroMotivo" style="display: none; resize: none;"></textarea>

                        <label for="comportamiento">Tipo de comportamiento:</label>
                        <select name="comportamiento" id="comportamiento">
                            <option value="docil">Dócil</option>
                            <option value="activo">Activo</option>
                            <option value="agresivo">Agresivo</option>
                            <option value="timido">Tímido</option>
                        </select>

                        <label for="vacunada">¿La mascota está vacunada?</label>
                        <select name="vacunada" id="vacunada">
                            <option value="si">Sí</option>
                            <option value="no">No</option>
                        </select>

                        <label for="pertenece">¿La mascota te pertenece?</label>
                        <select name="pertenece" id="pertenece">
                            <option value="si">Sí</option>
                            <option value="no">No</option>
                        </select>

                        <label for="tipo">Tipo de mascota:</label>
                        <select name="tipo" id="tipo">
                            <option value="Perro">Perro</option>
                            <option value="Gato">Gato</option>
                            <option value="otro">Otro</option>
                        </select>

                        <label for="raza">Raza:</label>
                        <input type="text" id="raza" name="raza">

                        <label for="nombre">Nombre de la mascota:</label>
                        <input type="text" id="nombre" name="nombre">

                        <label for="tamaño">Tamaño de la mascota:</label>
                        <select name="tamaño" id="tamaño">
                            <option value="Pequeño">Pequeño</option>
                            <option value="Mediano">Mediano</option>
                            <option value="Grande">Grande</option>
                        </select>

                        <label for="edad">Edad de la mascota(en meses):</label>
                        <input type="number" id="edad" name="edad" min="0">

                        <label for="sexo">Sexo de la mascota:</label>
                        <select name="sexo" id="sexo">
                            <option value="Macho">Macho</option>
                            <option value="Hembra">Hembra</option>
                        </select>

                        <label for="imagen">Imagen de la mascota:</label>
                        <input type="file" id="imagen" name="imagen">

                        <input type="submit" value="Enviar">
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>
