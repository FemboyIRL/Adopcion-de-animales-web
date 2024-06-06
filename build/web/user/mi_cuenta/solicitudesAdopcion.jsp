<%@page import="models.SolicitudAdopcion"%>
<%@page import="models.Usuario"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Solicitudes de Adopción</title>
        <link rel="stylesheet" href="stylesSolicitudes.css">
    </head>
    <body>
        <div class="container">
            <h2>Solicitudes de Adopción</h2>
            <%
                if (session.getAttribute("id") == null) {
                    response.sendRedirect("../../registerlogin/screen.jsp?errorSesion=1");
                    return;
                }
                String idMascotaStr = request.getParameter("idMascota");
                if (idMascotaStr == null) {
                    response.sendRedirect("screen.jsp");
                    return;
                }

                int idMascota = Integer.parseInt(idMascotaStr);
                String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                List<SolicitudAdopcion> solicitudes = new ArrayList<SolicitudAdopcion>();
                try {
                    Class.forName("org.sqlite.JDBC");
                    conn = DriverManager.getConnection(url);
                    String query = "SELECT sa.ID, sa.IDUsuario, sa.IDMascota, sa.EstadoSolicitud, sa.InformacionFormulario, u.NombreUsuario, u.CorreoElectronico, u.Telefono "
                            + "FROM SolicitudesAdopcion sa "
                            + "JOIN Usuarios u ON sa.IDUsuario = u.ID "
                            + "WHERE sa.IDMascota = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setInt(1, idMascota);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        SolicitudAdopcion solicitud = new SolicitudAdopcion(
                                rs.getInt("ID"),
                                rs.getInt("IDUsuario"),
                                rs.getInt("IDMascota"),
                                rs.getString("EstadoSolicitud"),
                                rs.getString("InformacionFormulario"),
                                rs.getString("NombreUsuario"),
                                rs.getString("CorreoElectronico"),
                                rs.getString("Telefono")
                        );
                        solicitudes.add(solicitud);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Error al conectar con la base de datos.</p>");
                    response.sendRedirect("screen.jsp");

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
            <div class="solicitudes-list">
                <% for (SolicitudAdopcion solicitud : solicitudes) {%>
                <div class="solicitud-card">
                    <img alt="imagenDueño" class="imagenPerfil" data-user-id="<%= solicitud.getIdUsuario()%>">
                    <p><strong>ID Usuario:</strong> <%= solicitud.getIdUsuario()%></p>
                    <p><strong>Nombre:</strong> <%= solicitud.getNombreUsuario()%></p>
                    <p><strong>Correo Electrónico:</strong> <%= solicitud.getCorreoElectronico()%></p>
                    <p><strong>Teléfono:</strong> <%= solicitud.getTelefono()%></p>
                    <p><strong>Estado de la Solicitud:</strong> <%= solicitud.getEstadoSolicitud()%></p>
                    <p><strong>Información:</strong> <%= solicitud.getInformacionFormulario()%></p>
                    <div class="actions">
                        <% if (solicitud.getEstadoSolicitud().equals("Pendiente")) {%>
                        <a href="aprobarSolicitud.jsp?idSolicitud=<%= solicitud.getId()%>" class="btn">Aprobar</a>
                        <a href="rechazarSolicitud.jsp?idSolicitud=<%= solicitud.getId()%>" class="btn" id="rechazar">Rechazar</a>
                        <% } %>
                    </div>
                </div>
                <% }%>
            </div>
            <a href="javascript:history.back()" class="btn">Volver</a>
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
