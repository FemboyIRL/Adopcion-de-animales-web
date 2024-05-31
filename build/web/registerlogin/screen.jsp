<!DOCTYPE html>
<html>
    <head>
        <title>Bienvenido a Patitas Felices</title>
        <link rel="stylesheet" type="text/css" href="slide navbar style.css">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="styles.css" rel="stylesheet">           
        <script defer src="script.js"></script>
    </head>
    <body>
        <div class="main">  	
            <input type="checkbox" id="chk" aria-hidden="true">
            <div class="signup">
                <form action="register.jsp" method="POST">
                    <label for="chk" aria-hidden="true"><a href="../index.jsp"><i class="fa-solid fa-circle-left"></i></a>Registrate</label>
                    <input type="text" name="txt" placeholder="Nombre de usuario" required="">
                    <input type="email" name="email" placeholder="Correo" required="">
                    <input type="password" name="pswd" placeholder="Contraseña" required="">
                    <button>Registrarse</button>
                </form>
            </div>

            <div class="login">
                <form action="login.jsp" method="POST">
                    <label for="chk" aria-hidden="true">Inicia Sesión</label>
                    <input type="email" name="email" placeholder="Correo" required="">
                    <input type="password" name="pswd" placeholder="Contraseña" required="">
                    <button type="submit">Iniciar Sesión</button>
                </form>
            </div>
        </div>
        <div id="error">
            <%
                String errorCampos = request.getParameter("errorCampos");
                String errorRegistro = request.getParameter("errorRegistro");
                String errorCredenciales = request.getParameter("errorCredenciales");
                String error = request.getParameter("error");

                if (errorCampos != null) {

                    out.print("<i class='fa-solid fa-circle-exclamation'></i> Todos los campos son obligatorios");
                } else if (errorRegistro != null) {
                    out.print("<i class='fa-solid fa-circle-exclamation'></i> Error al realizar el registro");
                } else if (error != null) {
                    String mensajeError = request.getParameter("mensaje");
                    out.print("<i class='fa-solid fa-circle-exclamation'></i> " + (mensajeError != null ? mensajeError : "Error desconocido"));
                } else if (errorCredenciales != null) {
                    out.print("<i class='fa-solid fa-circle-exclamation'></i> Usuario o contraseña incorrectos");
                }
            %>
        </div>
            <div id="success">
                <%
                String registroExistoso = request.getParameter("registroExitoso");
                if (registroExistoso != null) {
                    out.print("<i class='fa-regular fa-circle-check'></i> Registro exitoso");
                }
                %>
            </div>
    </body>
</html>