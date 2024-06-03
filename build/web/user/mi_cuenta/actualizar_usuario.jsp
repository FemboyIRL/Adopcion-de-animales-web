<%@ page import="java.sql.*" %>
<%
    String nuevoNombreUsuario = request.getParameter("nombreUsuario");
    String nuevoCorreo = request.getParameter("correo");
    String nuevoTelefono = request.getParameter("telefono");

    String idUsuarioStr = (String) session.getAttribute("id");
    Integer idUsuario = Integer.parseInt(idUsuarioStr);

    String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
    String selectQuery = "SELECT NombreUsuario, CorreoElectronico, Telefono FROM Usuarios WHERE ID=?";
    String nombreUsuarioActual = "";
    String correoActual = "";
    String telefonoActual = "";

    try {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection(url);
        PreparedStatement pstmt = conn.prepareStatement(selectQuery);

        pstmt.setInt(1, idUsuario);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            nombreUsuarioActual = rs.getString("NombreUsuario");
            correoActual = rs.getString("CorreoElectronico");
            telefonoActual = rs.getString("Telefono");
        }

        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error al conectar con la base de datos o al obtener los datos del usuario.</p>");
    }

    if (nuevoNombreUsuario.equals(nombreUsuarioActual) && nuevoCorreo.equals(correoActual) && nuevoTelefono.equals(telefonoActual)) {
        out.println("<p>Los nuevos datos son iguales a los actuales. No se realizaron cambios.</p>");
        response.sendRedirect("screen.jsp?errorIguales=1");
    } else {
        String updateQuery = "UPDATE Usuarios SET NombreUsuario=?, CorreoElectronico=?, Telefono=? WHERE ID=?";

        try {
            Class.forName("org.sqlite.JDBC");
            Connection conn = DriverManager.getConnection(url);
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);

            pstmt.setString(1, nuevoNombreUsuario);
            pstmt.setString(2, nuevoCorreo);
            pstmt.setString(3, nuevoTelefono);
            pstmt.setInt(4, idUsuario);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<p>¡Los datos del usuario fueron actualizados con éxito!</p>");
                response.sendRedirect("screen.jsp?datosActualizados=1");
            } else {
                out.println("<p>No se pudo actualizar los datos del usuario. Por favor, inténtalo de nuevo.</p>");
                response.sendRedirect("screen.jsp?error=1");
            }

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error al conectar con la base de datos o al realizar la actualización del usuario.</p>");
            response.sendRedirect("screen.jsp?error=1");

        }
    }
%>
