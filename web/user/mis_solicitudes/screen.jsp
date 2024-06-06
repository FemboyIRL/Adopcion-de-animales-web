<%@page import="models.Usuario"%>
<%@page import="models.Animal"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.SolicitudAdopcion" %>

<%
    if (session.getAttribute("id") == null) {
        response.sendRedirect("../../registerlogin/screen.jsp?errorSesion=1");
        return;
    }

    String idUsuarioStr = (String) session.getAttribute("id");
    Integer idUsuario = Integer.parseInt(idUsuarioStr);

    // Conectar a la base de datos y obtener las solicitudes de adopción del usuario
    List<SolicitudAdopcion> solicitudes = new ArrayList<SolicitudAdopcion>();
    List<Animal> animales = new ArrayList<Animal>();
    String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.sqlite.JDBC");
        conn = DriverManager.getConnection(url);
        String query = "SELECT "
                + "sa.ID as solicitudID, sa.IDUsuario as solicitudIDUsuario, sa.IDMascota as solicitudIDMascota, sa.EstadoSolicitud, sa.InformacionFormulario, "
                + "u.NombreUsuario, u.CorreoElectronico, u.Telefono, "
                + "m.ID as mascotaID, m.Nombre as mascotaNombre, m.Edad as mascotaEdad, m.Especie, m.Raza, m.OtrasCaracteristicas, m.IDUsuario as mascotaIDUsuario, m.Sexo, m.Size "
                + "FROM SolicitudesAdopcion sa "
                + "JOIN Usuarios u ON m.IDUsuario = u.ID "
                + "JOIN Mascotas m ON sa.IDMascota = m.ID "
                + "WHERE sa.IDUsuario = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, idUsuario);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            SolicitudAdopcion solicitud = new SolicitudAdopcion(
                    rs.getInt("solicitudID"),
                    rs.getInt("solicitudIDUsuario"),
                    rs.getInt("solicitudIDMascota"),
                    rs.getString("EstadoSolicitud"),
                    rs.getString("InformacionFormulario"),
                    rs.getString("NombreUsuario"),
                    rs.getString("CorreoElectronico"),
                    rs.getString("Telefono")
            );
            solicitudes.add(solicitud);

            Animal animal = new Animal(
                    rs.getInt("mascotaID"),
                    rs.getString("mascotaNombre"),
                    rs.getInt("mascotaEdad"),
                    rs.getString("Especie"),
                    rs.getString("Raza"),
                    rs.getString("OtrasCaracteristicas"),
                    rs.getInt("mascotaIDUsuario"),
                    rs.getString("Sexo"),
                    rs.getString("Size")
            );
            animales.add(animal);
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
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mis Solicitudes</title>
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
                        <%                            if (session.getAttribute("usuario") != null) {
                        %>
                    <li><a href="screen.jsp">Mis Solicitudes</a></li>
                        <%
                            }
                        %>
                </ul>
                <% if (session.getAttribute("usuario") != null) { %>
                <div class="account">
                    <button onclick="window.location.href = '../mi_cuenta/screen.jsp'"><i class="fa-regular fa-user"></i></button>
                    <button onclick="window.location.href = '../../logout/logout.jsp'"><i class="fa-solid fa-sign-out"></i></button>
                </div>
                <% } else { %>
                <button class="navbar-login" onclick="window.location.href = 'registerlogin/screen.jsp'">Iniciar sesión</button>
                <% } %>
            </div>
        </nav>
        <div class="row">
            <div class="misSolicitudes">
                <h2>Mis Solicitudes de Adopción</h2>
                <% if (solicitudes.isEmpty()) { %>
                <p>No tienes solicitudes de adopción.</p>
                <% } else { %>
                <% for (int i = 0; i < solicitudes.size(); i++) {
                        SolicitudAdopcion solicitud = solicitudes.get(i);
                        Animal animal = animales.get(i);
                %>
                <div class="cardsContainer">
                    <div class="card">
                        <div class="informacionUsuario">
                            <h3>Información del Dueño</h3>
                            <img alt="imagenDueño" class="imagenPerfil" data-user-id="<%= animal.getIdUsuario()%>">
                            <p>Nombre Usuario: <%= solicitud.getNombreUsuario()%></p>
                            <p>Correo Electrónico: <%= solicitud.getCorreoElectronico()%></p>
                            <p>Teléfono: <%= solicitud.getTelefono()%></p>
                        </div>
                        <div class="informacionMascota">
                            <h3>Información de la Mascota</h3>
                            <img src="../../assets/images/mascotas/<%= animal.getId()%>.jpg">
                            <p>Nombre: <%= animal.getNombre()%></p>
                            <p>Edad: <%= animal.getEdad()%> meses</p>
                            <p>Especie: <%= animal.getEspecie()%></p>
                            <p>Raza: <%= animal.getRaza()%></p>
                            <p>Sexo: <%= animal.getSexo()%></p>
                            <p>Tamaño: <%= animal.getSize()%></p>
                            <p>Estado de la solicitud: <%= solicitud.getEstadoSolicitud()%></p>
                        </div>
                        <div class="acciones">
                            <form action="eliminarSolicitud.jsp" method="post">
                                <input type="hidden" name="idSolicitud" value="<%= solicitud.getId()%>">
                                <button type="submit" class="btn-eliminar"><i class="fa-solid fa-trash"></i> Eliminar</button>
                            </form>
                        </div>
                    </div>
                </div>
                <% } %>
                <% } %>
            </div>
        </div>
        <div id="success">
            <%
                String solicitudEliminada = request.getParameter("solicitudEliminada");

                if (solicitudEliminada
                        != null) {
                    out.print("<i class='fa-regular fa-circle-check'></i> La solicitud se eliminó correctamente.");
                }

            %>
        </div>
        <div id="error">
            <%                String errorEliminar = request.getParameter("errorEliminar");

                if (errorEliminar
                        != null) {
                    out.print("<i class='fa-regular fa-circle-check'></i> No se encontró ninguna solicitud con el ID proporcionado.");
                }
            %> 
        </div>
        <script>
            var images = document.querySelectorAll('.imagenPerfil');

            images.forEach(function (img) {
                var userId = img.getAttribute('data-user-id');
                var imgSrc = "../../assets/images/fotoPerfil/" + userId + ".jpg";
                var defaultSrc = "../../assets/images/fotoPerfil/user.png";

                img.onerror = function () {
                    img.src = defaultSrc;
                };

                img.src = imgSrc;
            });
        </script>

    </body>
</html>
