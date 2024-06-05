package servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "SvProcesarFormulario", urlPatterns = {"/SvProcesarFormulario"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
    maxFileSize = 1024 * 1024 * 10,      // 10 MB
    maxRequestSize = 1024 * 1024 * 50    // 50 MB
)

public class SvProcesarFormulario extends HttpServlet {

    protected void doPost(  HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Verificación de la sesión del usuario
        HttpSession session = request.getSession();
        if (session.getAttribute("id") == null) {
            response.sendRedirect("../../registerlogin/screen.jsp?errorSesion=1");
            return;
        }

        String idUsuarioStr = session.getAttribute("id").toString();
        int idUsuario = Integer.parseInt(idUsuarioStr);

        // Obtener y validar los parámetros del formulario
        String motivo = request.getParameter("motivo");
        String comportamiento = request.getParameter("comportamiento");
        String vacunada = request.getParameter("vacunada");
        String pertenece = request.getParameter("pertenece");
        String tipo = request.getParameter("tipo");
        String raza = request.getParameter("raza");
        String nombre = request.getParameter("nombre");
        String tamaño = request.getParameter("tamaño");
        String edadStr = request.getParameter("edad");
        String sexo = request.getParameter("sexo");
        Part imagenPart = request.getPart("imagen");

        if (motivo == null || comportamiento == null || vacunada == null || pertenece == null ||
            tipo == null || raza == null || nombre == null || tamaño == null || 
            edadStr == null || sexo == null || imagenPart == null) {
            response.sendRedirect("index.jsp?error=1");
            return;
        }

        int edad = 0;
        try {
            edad = Integer.parseInt(edadStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("index.jsp?errorEdad=1");
            return;
        }

        StringBuilder otrasCaracteristicas = new StringBuilder();
        otrasCaracteristicas.append("Motivo de dar en adopción: ").append(motivo).append("\n");
        otrasCaracteristicas.append("Tipo de comportamiento: ").append(comportamiento).append("\n");
        otrasCaracteristicas.append("La mascota está vacunada: ").append(vacunada).append("\n");
        otrasCaracteristicas.append("La mascota te pertenece: ").append(pertenece).append("\n");

        String uploadPath = "C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/images/mascotas";
        String url = "jdbc:sqlite:C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
        String insertQuery = "INSERT INTO Mascotas (Nombre, Edad, Especie, Raza, OtrasCaracteristicas, IDUsuario, Sexo, Size) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        int idMascota = 0;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet generatedKeys = null;
        InputStream fileContent = null;
        OutputStream outputStream = null;

        try {
            conn = DriverManager.getConnection(url);
            pstmt = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, nombre);
            pstmt.setInt(2, edad);
            pstmt.setString(3, tipo);
            pstmt.setString(4, raza);
            pstmt.setString(5, otrasCaracteristicas.toString());
            pstmt.setInt(6, idUsuario);
            pstmt.setString(7, sexo);
            pstmt.setString(8, tamaño);
            pstmt.executeUpdate();
            generatedKeys = pstmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                idMascota = generatedKeys.getInt(1);
            }

            // Guardar la imagen con el ID de la mascota
            String fileName = idMascota + ".jpg"; // Nombre del archivo de imagen basado en el ID de la mascota
            String filePath = uploadPath + File.separator + fileName;

            fileContent = imagenPart.getInputStream();
            outputStream = new FileOutputStream(filePath);
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (generatedKeys != null) {
                try { generatedKeys.close(); } catch (SQLException ignore) {}
            }
            if (pstmt != null) {
                try { pstmt.close(); } catch (SQLException ignore) {}
            }
            if (conn != null) {
                try { conn.close(); } catch (SQLException ignore) {}
            }
            if (fileContent != null) {
                try { fileContent.close(); } catch (IOException ignore) {}
            }
            if (outputStream != null) {
                try { outputStream.close(); } catch (IOException ignore) {}
            }
        }

        // Redireccionar a otra página
        response.sendRedirect("index.jsp?registroMascota=1");
    }
}
