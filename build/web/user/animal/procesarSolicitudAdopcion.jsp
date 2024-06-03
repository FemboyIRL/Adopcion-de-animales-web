<%@ page import="java.sql.*" %>
<%
    String idUsuarioStr = request.getParameter("idUsuario");
    if (idUsuarioStr == null || idUsuarioStr.isEmpty()) {
        response.sendRedirect("../../registerlogin/screen.jsp?errorSesion=1");
        return;
    }

    int idUsuario = Integer.parseInt(idUsuarioStr);
    int idMascota = Integer.parseInt(request.getParameter("idMascota"));
    String razonAdopcion = request.getParameter("razonAdopcion");
    String tiempoDisponible = request.getParameter("tiempoDisponible");
    String viviendaTipo = request.getParameter("viviendaTipo");
    String espacioDisponible = request.getParameter("espacioDisponible");
    String habitantesCasa = request.getParameter("habitantesCasa");
    String otrasMascotas = request.getParameter("otrasMascotas");
    String experienciaMascotas = request.getParameter("experienciaMascotas");
    String responsablePrincipal = request.getParameter("responsablePrincipal");
    String actividadDiaria = request.getParameter("actividadDiaria");
    String veterinarioPlan = request.getParameter("veterinarioPlan");

    String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
    String sql = "INSERT INTO SolicitudesAdopcion (IDUsuario, IDMascota, EstadoSolicitud, InformacionFormulario) VALUES (?, ?, ?, ?)";
    
    StringBuilder infoFormulario = new StringBuilder();
    infoFormulario.append("Razón para Adoptar: ").append(razonAdopcion).append("\n");
    infoFormulario.append("Tiempo Disponible: ").append(tiempoDisponible).append("\n");
    infoFormulario.append("Tipo de Vivienda: ").append(viviendaTipo).append("\n");
    infoFormulario.append("Espacio Disponible: ").append(espacioDisponible).append("\n");
    infoFormulario.append("Habitantes en la Casa: ").append(habitantesCasa).append("\n");
    infoFormulario.append("Otras Mascotas: ").append(otrasMascotas).append("\n");
    infoFormulario.append("Experiencia con Mascotas: ").append(experienciaMascotas).append("\n");
    infoFormulario.append("Responsable Principal: ").append(responsablePrincipal).append("\n");
    infoFormulario.append("Actividad Diaria: ").append(actividadDiaria).append("\n");
    infoFormulario.append("Plan Veterinario: ").append(veterinarioPlan).append("\n");

    try {
        Class.forName("org.sqlite.JDBC");
        Connection conn = DriverManager.getConnection(url);
        PreparedStatement pstmt = conn.prepareStatement(sql);

        pstmt.setInt(1, idUsuario);
        pstmt.setInt(2, idMascota);
        pstmt.setString(3, "Pendiente"); // Estado inicial de la solicitud
        pstmt.setString(4, infoFormulario.toString());

        pstmt.executeUpdate();

        pstmt.close();
        conn.close();

        response.sendRedirect("../../index.jsp?solicitudCreada=1"); // Redirige a una página de confirmación

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error al procesar la solicitud de adopción.</p>" + e);
    }
%>
