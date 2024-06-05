<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
     if (session.getAttribute("id") == null) {
        response.sendRedirect("../../registerlogin/screen.jsp?errorSesion=1");
        return;
    }
    String idMascotaStr = request.getParameter("idMascota");
    int idMascota = Integer.parseInt(idMascotaStr);

    String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.sqlite.JDBC");
        conn = DriverManager.getConnection(url);

        // Preparar la consulta para eliminar la mascota con el ID proporcionado
        String query = "DELETE FROM Mascotas WHERE ID = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, idMascota);

        // Ejecutar la consulta
        int rowsAffected = pstmt.executeUpdate();

        // Verificar si se eliminó correctamente la mascota
        if (rowsAffected > 0) {
            // La mascota se eliminó correctamente
            out.println("<p>La mascota se eliminó correctamente.</p>");
            response.sendRedirect("screen.jsp?mascotaEliminada=1");
        } else {
            // No se encontró ninguna mascota con el ID proporcionado
            out.println("<p>No se encontró ninguna mascota con el ID proporcionado.</p>");
            response.sendRedirect("screen.jsp?errorEliminar=1");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error al eliminar la mascota.</p>" + e);
        response.sendRedirect("screen.jsp?errorEliminar=1");

    } finally {
        // Cerrar la conexión y los recursos
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
