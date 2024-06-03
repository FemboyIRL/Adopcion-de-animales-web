<%@page import="models.Usuario"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, java.nio.file.*, java.sql.*, javax.servlet.http.*, javax.servlet.*, javax.servlet.annotation.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Mi Cuenta</title>
        <link href="styles.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script defer src="script.js"></script>
    </head>
    <body>
        <nav class="navbar">
            <div class="navbar-container">
                <a href="index.jsp" class="navbar-logo">
                    <img src="../../assets/Icons/logo.png" alt="Patitas Felices Veterinaria">
                </a>
                <ul class="navbar-menu">
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="user/adopciones/screen.jsp">Adopciones</a></li>
                    <li><a href="user/como_adoptar/screen.jsp">¿Cómo adoptar?</a></li>
                    <li><a href="user/dar_adopcion/screen.jsp">Dar en adopción</a></li>
                </ul>
                <% if (session.getAttribute("usuario") != null) { %>
                <div class="account">
                    <button onclick="window.location.href = 'user/mi_cuenta/screen.jsp'"><i class="fa-regular fa-user"></i></button>
                    <button onclick="window.location.href = 'logout/logout.jsp'"><i class="fa-solid fa-sign-out"></i></button>
                </div>

                <% } else { %>
                <button class="navbar-login" onclick="window.location.href = 'registerlogin/screen.jsp'">Iniciar sesión</button>
                <% }%>
            </div>
        </nav>
        <%
            if (session.getAttribute("id") == null) {
                response.sendRedirect("../../registerlogin/screen.jsp?errorSesion=1");
                return;
            }

            String idUsuarioStr = (String) session.getAttribute("id");
            Integer idUsuario = Integer.parseInt(idUsuarioStr);
            Usuario usuario = null;

            String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("org.sqlite.JDBC");
                conn = DriverManager.getConnection(url);
                String query = "SELECT * FROM Usuarios WHERE ID = ?";

                pstmt = conn.prepareStatement(query);
                pstmt.setInt(1, idUsuario);

                rs = pstmt.executeQuery();

                if (rs.next()) {
                    usuario = new Usuario(
                            rs.getInt("ID"),
                            rs.getString("NombreUsuario"),
                            rs.getString("CorreoElectronico"),
                            rs.getString("Contrasena"),
                            rs.getString("TipoUsuario"),
                            rs.getString("EstadoSesion"),
                            rs.getString("Telefono")
                    );
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error al conectar con la base de datos.</p>");
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
        <div class="container">
            <div class="info">
                <h2>Mi Cuenta</h2>
                <form action="/Adopcion_de_animales_web/PerfilUsuario" method="post" enctype="multipart/form-data" class="form-section" id="imageForm">
                    <img id="imagenPerfil" alt="Imagen-Perfil" width="150">
                    <div>
                        <input type="file" name="profileImage" accept="image/*" id="fileInput" style="display: none;">
                        <button type="button" class="btn" onclick="document.getElementById('fileInput').click();">
                            <i class="fas fa-upload"></i> Seleccionar Imagen
                        </button>
                    </div>
                </form>
                <div>
                    <label>Nombre de Usuario:</label>
                    <p><%= usuario.getNombreUsuario()%></p>
                </div>
                <div>
                    <label>Correo Electrónico:</label>
                    <p><%= usuario.getCorreoElectronico()%></p>
                </div>
                <div>
                    <label>Teléfono:</label>
                    <p><%= usuario.getTelefono()%></p>
                </div>
                <a href="#" class="btn" onclick="openModal()">Editar información <i class="fa-solid fa-pencil"></i></a>
                <a href="../../logout/logout.jsp" class="btn">Cerrar Sesión</a>
            </div>

            <div class="publicaciones">
                <h2>Mis Publicaciones</h2>
                <!-- Ejemplo de una tarjeta de publicación -->
                <div class="card">
                    <h3>Nombre de la Mascota</h3>
                    <p>Edad: 2 años</p>
                    <p>Especie: Perro</p>
                    <p>Raza: Labrador</p>
                    <p>Sexo: Macho</p>
                    <p>Otras Características: Juguetón, amigable</p>
                </div>
                <!-- Repetir para más publicaciones -->
            </div>
        </div>
        <!-- Modal -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>Editar información</h2>
                <form action="actualizar_usuario.jsp" method="post">
                    <label for="nombreUsuario">Nombre:</label>
                    <input type="text" id="nombreUsuario" name="nombreUsuario" value="<%= usuario.getNombreUsuario()%>" required><br><br>

                    <label for="correo">Correo Electrónico:</label>
                    <input type="email" id="correo" name="correo" value="<%= usuario.getCorreoElectronico()%>" required><br><br>

                    <label for="telefono">Teléfono:</label>
                    <input type="tel" id="telefono" name="telefono" value="<%= usuario.getTelefono()%>" required> <br><br>

                    <input type="submit" value="Guardar cambios" class="btn">
                </form>
            </div>
        </div>
        <script>
           var img = document.getElementById('imagenPerfil');
           var imgSrc = "../../assets/images/fotoPerfil/<%= idUsuario%>.jpg";
           var defaultSrc = "../../assets/images/fotoPerfil/user.png";

            img.onerror = function () {
                img.src = defaultSrc;
            };

            img.src = imgSrc;
        </script>
    </body>
</html>
