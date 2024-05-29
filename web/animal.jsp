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
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Detalles del Animal</h1>
    </header>
    <main>
        <%
            class Animal {
                private int id;
                private String nombre;
                private String edad;
                private String especie;
                private String size;
                private String imagen;

                public Animal(int id, String nombre, String edad, String especie, String size, String imagen) {
                    this.id = id;
                    this.nombre = nombre;
                    this.edad = edad;
                    this.especie = especie;
                    this.size = size;
                    this.imagen = imagen;
                }

                public int getId() { return id; }
                public String getNombre() { return nombre; }
                public String getEdad() { return edad; }
                public String getEspecie() { return especie; }
                public String getSize() { return size; }
                public String getImagen() { return imagen; }
            }

            String url = "jdbc:sqlite:/C:/Users/luisr/OneDrive/Escritorio/Escuela del mal/Desarrollo web/Paginas/Adopcion de animales web/web/assets/bd/centroAdopcion.db";
            Animal animal = null;
            String nombre = request.getParameter("nombre");

            try {
                Class.forName("org.sqlite.JDBC");
                Connection conn = DriverManager.getConnection(url);
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM animales WHERE nombre = '" + nombre + "'");

                if (rs.next()) {
                    animal = new Animal(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("edad"),
                        rs.getString("especie"),
                        rs.getString("size"),
                        rs.getString("imagen")
                    );
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

            if (animal != null) {
        %>
        <div class="animal-detalle">
            <img src="<%= animal.getImagen() %>" alt="<%= animal.getNombre() %>">
            <h2><%= animal.getNombre() %></h2>
            <p>Especie: <%= animal.getEspecie() %></p>
            <p>Edad: <%= animal.getEdad() %></p>
            <p>Tamaño: <%= animal.getSize() %></p>
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
