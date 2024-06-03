<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
    <%@ page import="java.sql.*" %>
    <%
        String correo = request.getParameter("email");
        String contrasena = request.getParameter("pswd");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("org.sqlite.JDBC");
            String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
            conn = DriverManager.getConnection(url);

            String sql = "SELECT * FROM Usuarios WHERE CorreoElectronico = ? AND Contrasena = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, correo);
            stmt.setString(2, contrasena);

            rs = stmt.executeQuery();

            if (rs.next()) {
                String nombreUsuario = rs.getString("NombreUsuario");
                String id = rs.getString("id");
                session.setAttribute("id", id);
                session.setAttribute("usuario", nombreUsuario);
                session.setAttribute("email", correo);
                
                response.sendRedirect("../index.jsp?loginExitoso=1");
            } else {
                response.sendRedirect("screen.jsp?errorCredenciales=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("screen.jsp?error=1&mensaje=" + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
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
</body>
</html>
