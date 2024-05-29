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
            // Obtener los parámetros del formulario
            String nombreUsuario = request.getParameter("txt");
            String correo = request.getParameter("email");
            String contrasena = request.getParameter("pswd");
            String tipoUsuario = "ciudadano"; 
            String estadoSesion = "cerrada"; 

            if (nombreUsuario == null || correo == null || contrasena == null || nombreUsuario.isEmpty() || correo.isEmpty() || contrasena.isEmpty()) {
               response.sendRedirect("screen.jsp?errorCampos=1");
            } else {
                Connection conn = null;
                PreparedStatement stmt = null;
                try {
                    Class.forName("org.sqlite.JDBC");
                    String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
                    conn = DriverManager.getConnection(url);

                    String sql = "INSERT INTO Usuarios (NombreUsuario, CorreoElectronico, Contrasena, TipoUsuario, EstadoSesion) VALUES (?, ?, ?, ?, ?)";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, nombreUsuario);
                    stmt.setString(2, correo);
                    stmt.setString(3, contrasena);
                    stmt.setString(4, tipoUsuario);
                    stmt.setString(5, estadoSesion);

                    int filasInsertadas = stmt.executeUpdate();

                    if (filasInsertadas > 0) {
                        response.sendRedirect("screen.jsp?registroExitoso=1");
                    } else {
                        response.sendRedirect("screen.jsp?errorRegistro=1");
                    }
                } catch (Exception e) {
                    response.sendRedirect("screen.jsp?error=1&mensaje=" + e.getMessage());
                } finally {
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
            }
        %>
    </body>
</html>
