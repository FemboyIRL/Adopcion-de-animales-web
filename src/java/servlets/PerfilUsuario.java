package servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet(name = "PerfilUsuario", urlPatterns = {"/PerfilUsuario"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 50 // 50 MB
)

public class PerfilUsuario extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        InputStream fileContent = null;
        OutputStream outputStream = null;

        HttpSession session = request.getSession();
        if (session.getAttribute("id") == null) {
            response.sendRedirect("../../registerlogin/screen.jsp?errorSesion=1");
            return;
        }
        String idUsuarioStr = session.getAttribute("id").toString();
        int idUsuario = Integer.parseInt(idUsuarioStr);

        String uploadPath = "C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/images/fotoPerfil";
        Part filePart = request.getPart("profileImage");

        try {
            String fileName = idUsuario + ".jpg"; // Nombre del archivo de imagen basado en el ID de el usuario
            String filePath = uploadPath + File.separator + fileName;

            fileContent = filePart.getInputStream();
            outputStream = new FileOutputStream(filePath);
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace(); 
            response.sendRedirect("user/mi_cuenta/screen.jsp?error=1"); 

        } finally {
            if (fileContent != null) {
                fileContent.close();
            }
            if (outputStream != null) {
                outputStream.close();
            }
        }

        response.sendRedirect("user/mi_cuenta/screen.jsp?success=1");
    }
}
