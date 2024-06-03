<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pantalla de Inicio - Patitas Felices Veterinaria</title>
        <script defer src="script.js"></script>
        <link rel="stylesheet" href="stylesIndex.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <nav class="navbar">
            <div class="navbar-container">
                <a href="index.jsp" class="navbar-logo">
                    <img src="assets/Icons/logo.png" alt="Patitas Felices Veterinaria">
                </a>
                <ul class="navbar-menu">
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="user/adopciones/screen.jsp">Adopciones</a></li>
                    <li><a href="user/como_adoptar/screen.jsp">¿Cómo adoptar?</a></li>
                    <li><a href="user/dar_adopcion/screen.jsp">Dar en adopción</a></li>
                </ul>
                <% if (session.getAttribute("usuario") != null) { %>
                <div class="account">
                    <button onclick="window.location.href = 'user/mi_cuenta/screen.jsp'"><i class="fa-regular fa-user"></i></button>
                    <button onclick="window.location.href = 'logout/logout.jsp'"><i class="fa-solid fa-sign-out"></i></button>
                </div>

                <% } else { %>
                <button class="navbar-login" onclick="window.location.href = 'registerlogin/screen.jsp'">Iniciar sesión</button>
                <% } %>

            </div>
        </nav>
        <div class="row">
            <div class="hero-card">
                <div class="hero">
                    <div class="hero-content">
                        <h1>Bienvenido a Patitas Felices Veterinaria</h1>
                        <p>Tu mejor amigo merece el mejor cuidado. Descubre más sobre nuestros servicios y cómo puedes adoptar o dar en adopción a una mascota.</p>
                        <button onclick="window.location.href = 'user/adopciones/screen.jsp'">   
                            Ver adopciones
                        </button>
                    </div>
                    <div class="hero-image">
                        <img src="assets/images/animales.jpg" alt="Patitas Felices">
                    </div>
                </div>
            </div>
        </div>
        <div class="row3">
            <div class="adopt-pet">
                <h2>¿Quieres <span>adoptar</span> una mascota?</h2>
            </div>
            <div class="cards-container">
                <div class="card" onclick="window.location.href = 'user/adopciones/screen.jsp?especie=Perro'">
                    <img src="assets/images/perros.jpg" alt="Perros">
                    <h3>Perros</h3>
                </div>
                <div class="card" onclick="window.location.href = 'user/adopciones/screen.jsp?especie=Gato'">
                    <img src="assets/images/gatos.jpg" alt="Gatos">
                    <h3>Gatos</h3>
                </div>
                <div class="card" onclick="window.location.href = 'user/adopciones/screen.jsp?especie=Otros'">
                    <img src="assets/images/otros.jpg" alt="Otros">
                    <h3>Otros</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="hero-card">
                <div class="hero">
                    <div class="hero-content">
                        <h1>Encuentra un <span>amigo</span> de Verdad</h1>                        
                        <p>Esta comprobado que tener una mascota en tu hogar mejora tu salud y humor.</p>
                        <button onclick="window.location.href = 'user/adopciones/screen.jsp'">   
                            BUSCAR MASCOTAS
                        </button>
                    </div>
                    <div class="hero-image">
                        <img src="assets/images/michi-atento.jpg" alt="Patitas Felices">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <h2>Últimas Publicaciones</h2>
            <div class="ultimas-publicaciones cards-container">
                <%
                    class Publicacion {

                        private int id;
                        private int idUsuario;
                        private String titulo;
                        private String contenido;
                        private String estado;
                        private String tipoPublicacion;

                        public Publicacion(int id, int idUsuario, String titulo, String contenido, String estado, String tipoPublicacion) {
                            this.id = id;
                            this.idUsuario = idUsuario;
                            this.titulo = titulo;
                            this.contenido = contenido;
                            this.estado = estado;
                            this.tipoPublicacion = tipoPublicacion;
                        }

                        // Getters y setters
                        public int getId() {
                            return id;
                        }

                        public int getIdUsuario() {
                            return idUsuario;
                        }

                        public String getTitulo() {
                            return titulo;
                        }

                        public String getContenido() {
                            return contenido;
                        }

                        public String getEstado() {
                            return estado;
                        }

                        public String getTipoPublicacion() {
                            return tipoPublicacion;
                        }
                    }

                    ArrayList<Publicacion> ultimasPublicaciones = new ArrayList<Publicacion>();

                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("org.sqlite.JDBC");
                        String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
                        conn = DriverManager.getConnection(url);

                        String sql = "SELECT * FROM Publicaciones ORDER BY ID DESC LIMIT 5";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();

                        while (rs.next()) {
                            int id = rs.getInt("ID");
                            int idUsuario = rs.getInt("IDUsuario");
                            String titulo = rs.getString("Titulo");
                            String contenido = rs.getString("Contenido");
                            String estado = rs.getString("Estado");
                            String tipoPublicacion = rs.getString("TipoPublicacion");

                            ultimasPublicaciones.add(new Publicacion(id, idUsuario, titulo, contenido, estado, tipoPublicacion));
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) {
                            rs.close();
                        }
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    }

                    for (Publicacion publicacion : ultimasPublicaciones) {
                %>
                <div class="card">
                    <h3><%= publicacion.getTitulo()%></h3>
                    <p><%= publicacion.getContenido()%></p>
                </div>
                <% } %>
            </div>
            <button>Ver más</button>
        </div>
        <div id="success">
            <%
                String loginExitoso = request.getParameter("loginExitoso");
                String sesionCerrada = request.getParameter("sesionCerrada");
                String registroMascota = request.getParameter("registroMascota");

                if (loginExitoso
                        != null) {
                    out.print("<i class='fa-regular fa-circle-check'></i> Inicio de sesión exitoso");
                    return;
                } else if (sesionCerrada
                        != null) {
                    out.print("<i class='fa-regular fa-circle-check'></i> Sesión cerrada exitosamente");
                    return;
                } else if (registroMascota != null) {
                    out.print("<i class='fa-regular fa-circle-check'></i> Mascota dada en adopciön correctamente");
                    return;
                }
            %>
        </div>
        <footer>
        </footer>
    </body>
</html>
