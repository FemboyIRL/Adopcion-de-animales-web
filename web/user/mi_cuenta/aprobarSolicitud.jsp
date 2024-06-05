<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Aprobar Solicitud</title>
        <link rel="stylesheet" href="stylesAdopcion.css">
    </head>
    <body>
        <div class="container">
            <h2>Aprobar Solicitud</h2>
            <%
                if (session.getAttribute("id") == null) {
                    response.sendRedirect("../../registerlogin/screen.jsp?errorSesion=1");
                    return;
                }
                String idSolicitudStr = request.getParameter("idSolicitud");
                if (idSolicitudStr == null) {
                    out.println("<p>Error: ID de solicitud no especificado.</p>");
                    return;
                }

                int idSolicitud = Integer.parseInt(idSolicitudStr);
                String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";

                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    Class.forName("org.sqlite.JDBC");
                    conn = DriverManager.getConnection(url);
                    String query = "UPDATE SolicitudesAdopcion SET EstadoSolicitud = 'Aprobada' WHERE ID = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setInt(1, idSolicitud);
                    int rowsAffected = pstmt.executeUpdate();

                    if (rowsAffected > 0) {
                        out.println("<p>Solicitud aprobada exitosamente.</p>");
                        response.sendRedirect("screen.jsp?solicitudAprobada=1");

                    } else {
                        out.println("<p>Error: no se encontró la solicitud especificada.</p>");
                        response.sendRedirect("screen.jsp?errorSolicitud=1");

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Error al conectar con la base de datos.</p>");
                    response.sendRedirect("screen.jsp?errorSolicitud=1");

                } finally {
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
            <a href="javascript:history.back()" class="btn">Volver</a>
        </div>
    </body>
</html>
