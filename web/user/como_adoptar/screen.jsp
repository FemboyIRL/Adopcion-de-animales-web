<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Como Adoptar</title>
        <link rel="stylesheet" href="stylesAdoptar.css">
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
                     <%
                            if (session.getAttribute(
                                    "usuario") != null) {
                        %>
                    <li><a href="../mis_solicitudes/screen.jsp">Mis Solicitudes</a></li>
                    <%
                    }
                    %>
                </ul>
                <% if (session.getAttribute(
                            "usuario") != null) { %>
                <div class="account">
                    <button onclick="window.location.href = '../mi_cuenta/screen.jsp'"><i class="fa-regular fa-user"></i></button>
                    <button onclick="window.location.href = '../../logout/logout.jsp'"><i class="fa-solid fa-sign-out"></i></button>
                </div>

                <% } else { %>
                <button class="navbar-login" onclick="window.location.href = '../../registerlogin/screen.jsp'">Iniciar sesión</button>
                <% }%>
            </div>
        </nav>
        <div class="container">
            <img src="../../assets/images/como_adoptar.jpg" alt="como_adoptar.jpg">
        </div>    

    </body>
</html>
