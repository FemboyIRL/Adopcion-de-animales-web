<%
    class Usuario {

        private int id;
        private String nombreUsuario;
        private String correoElectronico;
        private String contrasena;
        private String tipoUsuario;
        private String estadoSesion;
        private String telefono;

        public Usuario(int id, String nombreUsuario, String correoElectronico, String contrasena, String tipoUsuario, String estadoSesion, String telefono) {
            this.id = id;
            this.nombreUsuario = nombreUsuario;
            this.correoElectronico = correoElectronico;
            this.contrasena = contrasena;
            this.tipoUsuario = tipoUsuario;
            this.estadoSesion = estadoSesion;
            this.telefono = telefono;
        }

        public int getId() {
            return id;
        }

        public String getNombreUsuario() {
            return nombreUsuario;
        }

        public String getCorreoElectronico() {
            return correoElectronico;
        }

        public String getContrasena() {
            return contrasena;
        }

        public String getTipoUsuario() {
            return tipoUsuario;
        }

        public String getEstadoSesion() {
            return estadoSesion;
        }

        public String getTelefono() {
            return telefono;
        }
    }

    class Animal {

        private int id;
        private String nombre;
        private int edad;
        private String especie;
        private String raza;
        private String otrasCaracteristicas;
        private int idUsuario;
        private String Sexo;

        public Animal(int id, String nombre, int edad, String especie, String raza, String otrasCaracteristicas, int idUsuario, String Sexo) {
            this.id = id;
            this.nombre = nombre;
            this.edad = edad;
            this.especie = especie;
            this.raza = raza;
            this.otrasCaracteristicas = otrasCaracteristicas;
            this.idUsuario = idUsuario;
            this.Sexo = Sexo;
        }

        public int getId() {
            return id;
        }

        public String getNombre() {
            return nombre;
        }

        public int getEdad() {
            return edad;
        }

        public String getEspecie() {
            return especie;
        }

        public String getRaza() {
            return raza;
        }

        public String getOtrasCaracteristicas() {
            return otrasCaracteristicas;
        }

        public int getIdUsuario() {
            return idUsuario;
        }

        public String getSexo() {
            return Sexo;
        }
    }

%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detalles del Animal</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <nav class="navbar">
            <div class="navbar-container">
                <a href="../../index.jsp" class="navbar-logo">
                    <img src="../../assets/Icons/logo.png" alt="Patitas Felices Veterinaria">
                </a>
                <ul class="navbar-menu">
                    <li><a href="../../index.jsp">Inicio</a></li>
                    <li><a href="screen.jsp">Adopciones</a></li>
                    <li><a href="../como_adoptar/screen.jsp">¿Cómo adoptar?</a></li>
                    <li><a href="../dar_adopcion/screen.jsp">Dar en adopción</a></li>
                </ul>
                <% if (session.getAttribute(
                            "usuario") != null) { %>
                <div class="account">
                    <button onclick="window.location.href = 'user/mi_cuenta/screen.jsp'"><i class="fa-regular fa-user"></i></button>
                    <button onclick="window.location.href = 'user/mi_cuenta/screen.jsp'"><i class="fa-solid fa-sign-out"></i></button>
                </div>

                <% } else { %>
                <button class="navbar-login" onclick="window.location.href = 'registerlogin/screen.jsp'">Iniciar sesión</button>
                <% } %>
            </div>
        </nav>
        <main class="container">
            <%
                String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
                Animal animal = null;
                Usuario usuario = null;
                String mascotaId = request.getParameter("id");

                try {
                    Class.forName("org.sqlite.JDBC");
                    Connection conn = DriverManager.getConnection(url);
                    Statement stmt = conn.createStatement();
                    String query = "SELECT "
                            + "Mascotas.ID AS MascotaID, "
                            + "Mascotas.Nombre AS NombreMascota, "
                            + "Mascotas.Edad, "
                            + "Mascotas.Especie, "
                            + "Mascotas.Raza, "
                            + "Mascotas.OtrasCaracteristicas, "
                            + "Mascotas.Sexo, "
                            + "Usuarios.ID AS UsuarioID, "
                            + "Usuarios.NombreUsuario, "
                            + "Usuarios.CorreoElectronico, "
                            + "Usuarios.Contrasena, "
                            + "Usuarios.TipoUsuario, "
                            + "Usuarios.EstadoSesion, "
                            + "Usuarios.Telefono "
                            + "FROM Mascotas "
                            + "JOIN Usuarios ON Mascotas.IDUsuario = Usuarios.ID "
                            + "WHERE Mascotas.ID = " + mascotaId;

                    ResultSet rs = stmt.executeQuery(query);
                    if (rs.next()) {
                        animal = new Animal(
                                rs.getInt("MascotaID"),
                                rs.getString("NombreMascota"),
                                rs.getInt("Edad"),
                                rs.getString("Especie"),
                                rs.getString("Raza"),
                                rs.getString("OtrasCaracteristicas"),
                                rs.getInt("UsuarioID"),
                                rs.getString("Sexo")
                        );

                        usuario = new Usuario(
                                rs.getInt("UsuarioID"),
                                rs.getString("NombreUsuario"),
                                rs.getString("CorreoElectronico"),
                                rs.getString("Contrasena"),
                                rs.getString("TipoUsuario"),
                                rs.getString("EstadoSesion"),
                                rs.getString("Telefono")
                        );
                    }

                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (animal
                        != null) {
            %>    
            <div class="left-column">
                <div class="card">
                    <div class="informacionContacto">
                        <div class="imagenAnimal">
                            <img src="../../assets/images/mascotas/<%= animal.getId()%>.jpg" alt="<%= animal.getNombre()%>">
                        </div>
                        <div class="infoUsuario">
                            <h2>Información de Contacto</h2>
                            <p><i class="fa-regular fa-envelope"></i> <%= usuario.getCorreoElectronico()%></p>
                            <p><i class="fa-solid fa-phone"></i> <%= usuario.getTelefono()%></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-column">
                <div class="card" id="datosAnimal">
                    <form action="solicitud_adopcion.jsp" method="post">
                        <div class="animal-detalle">
                            <h2>Hola, mi nombre es <span><%= animal.getNombre()%></span></h2>
                            <p><span>Especie:</span> <%= animal.getEspecie()%></p>
                            <p><span>Sexo:</span> <%= animal.getSexo()%></p>
                            <p><span>Raza:</span> <%= animal.getRaza()%></p>
                            <p><span>Descripción:</span></p>
                            <p><span><%= animal.getOtrasCaracteristicas()%></span></p>
                        </div>
                        <input type="hidden" name="idMascota" value="<%= animal.getId()%>">
                        <button type="submit">SOLICITAR ADOPCIÓN</button>
                    </form>
                </div>
            </div>


            <%
            } else {
            %>
            <p>Animal no encontrado.</p>
            <%
                }
            %>
        </main>
    </body>
</html>
