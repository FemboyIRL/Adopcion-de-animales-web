<%@page import="models.Animal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Adopción de Animales</title>

        <link rel="stylesheet" href="stylesAnimal.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    </head>
    <body>
        <nav class="navbar">
            <div class="navbar-container">
                <a href="../../index.jsp" class="navbar-logo">
                    <img src="../../assets/Icons/logo.png" alt="Patitas Felices Veterinaria">
                </a>
                <ul class="navbar-menu">
                    <li><a href="../../index.jsp">Inicio</a></li>
                    <li><a href="../adopciones/screen.jsp">Adopciones</a></li>
                    <li><a href="../como_adoptar/screen.jsp">¿Cómo adoptar?</a></li>
                    <li><a href="../dar_adopcion/screen.jsp">Dar en adopción</a></li>
                </ul>
                <% if (session.getAttribute(
                            "usuario") != null) { %>
                <div class="account">
                    <button onclick="window.location.href = '../mi_cuenta/screen.jsp'"><i class="fa-regular fa-user"></i></button>
                    <button onclick="window.location.href = '../mi_cuenta/screen.jsp'"><i class="fa-solid fa-sign-out"></i></button>
                </div>

                <% } else { %>
                <button class="navbar-login" onclick="window.location.href = 'registerlogin/screen.jsp'">Iniciar sesión</button>
                <% } %>
            </div>
        </nav>
        <header>
            <h1>Adopciones</h1>
        </header>
        <main>
            <section class="filtros">
                <h2>Buscar Animales</h2>
                <form id="filtros-form" method="get">
                    <label for="especie">Especie:</label>
                    <select id="especie" name="especie">
                        <option value="todos">Todos</option>
                        <option value="Perro">Perro</option>
                        <option value="Gato">Gato</option>
                    </select>

                    <label for="edad">Edad:</label>
                    <select id="edad" name="edad">
                        <option value="todas">Todas</option>
                        <option value="Cachorro">Cachorro</option>
                        <option value="Adulto">Adulto</option>
                    </select>

                    <label for="tamaño">Raza:</label>
                    <select id="tamaño" name="tamaño">
                        <option value="todos">Todos</option>
                        <option value="Pequeño">Pequeño</option>
                        <option value="Mediano">Mediano</option>
                        <option value="Grande">Grande</option>
                    </select>

                    <button type="submit">Buscar</button>
                </form>
            </section>
            <section class="animales">
                <h2>Animales Disponibles para Adopción</h2>
                <div id="lista-animales">
                    <%
                        String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
                        List<Animal> animales = new ArrayList<Animal>();
                        String especie = request.getParameter("especie");

                        StringBuilder sql = new StringBuilder("SELECT * FROM Mascotas WHERE 1=1");
                        if (especie != null && !especie.equals("todos")) {
                            sql.append(" AND especie = ?");
                        }

                        try {
                            Class.forName("org.sqlite.JDBC");
                            Connection conn = DriverManager.getConnection(url);
                            PreparedStatement pstmt = conn.prepareStatement(sql.toString());

                            int paramIndex = 1;
                            if (especie != null && !especie.equals("todos")) {
                                pstmt.setString(paramIndex++, especie);
                            }

                            ResultSet rs = pstmt.executeQuery();

                            if (!rs.isBeforeFirst()) { // No hay resultados
                                out.println("<p>No se encontraron animales.</p>");
                            }

                            while (rs.next()) {
                                Animal animal = new Animal(
                                        rs.getInt("ID"),
                                        rs.getString("Nombre"),
                                        rs.getInt("Edad"),
                                        rs.getString("Especie"),
                                        rs.getString("Raza"),
                                        rs.getString("OtrasCaracteristicas"),
                                        rs.getInt("IDUsuario"),
                                        rs.getString("Sexo"),
                                        rs.getString("Size")
                                );
                                animales.add(animal);
                            }

                            rs.close();
                            pstmt.close();
                            conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                            out.println("<p>Error al conectar con la base de datos.</p>");
                        }

                        for (Animal animal : animales) {
                    %>
                    <div class="card" onclick="location.href = '../animal/screen.jsp?id=<%= animal.getId()%>';">
                        <img src="../../assets/images/mascotas/<%= animal.getId()%>.jpg" alt="<%= animal.getNombre()%>">
                        <div class="intro">
                            <h3><%= animal.getNombre()%></h3>
                            <p>Edad: <%= animal.getEdad()%> meses</p>
                            <p>Especie: <%= animal.getEspecie()%></p>
                        </div>
                    </div>
                    <%
                        }
                    %>            
                </div>
            </section>
        </main>
        <script src="script.js"></script>
    </body>
</html>
