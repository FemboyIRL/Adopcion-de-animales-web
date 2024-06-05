<%@ page import="java.sql.*" %>

<%
    if (session.getAttribute("id") == null) {
        response.sendRedirect("../../registerlogin/screen.jsp?errorSesion=1");
        return;
    }
    String idSolicitudStr = request.getParameter("idSolicitud");
    if (idSolicitudStr != null) {
        int idSolicitud = Integer.parseInt(idSolicitudStr);

        String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.sqlite.JDBC");
            conn = DriverManager.getConnection(url);
            String query = "DELETE FROM SolicitudesAdopcion WHERE ID = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, idSolicitud);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<p>La solicitud se eliminó correctamente.</p>");
                response.sendRedirect("screen.jsp?solicitudEliminada=1");
            } else {
                out.println("<p>No se encontró ninguna solicitud con el ID proporcionado.</p>");
                response.sendRedirect("screen.jsp?errorEliminar=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error al conectar con la base de datos.</p>");
            response.sendRedirect("screen.jsp?errorEliminar=2");
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
    } else {
        response.sendRedirect("screen.jsp?errorEliminar=3");
    }
%>
