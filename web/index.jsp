    <!DOCTYPE html>
    <html lang="es">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Pantalla de Inicio - Patitas Felices Veterinaria</title>
            <link rel="stylesheet" href="styles.css">
        </head>
        <body>
            <nav class="navbar">
                <div class="navbar-container">
                    <a href="../inicio/screen.jsp" class="navbar-logo">
                        <img src="assets/Icons/logo.png" alt="Patitas Felices Veterinaria">
                    </a>
                    <ul class="navbar-menu">
                        <li><a href="../inicio/screen.jsp">Inicio</a></li>
                        <li><a href="user/adopciones/screen.jsp">Adopciones</a></li>
                        <li><a href="como_adoptar.jsp">�C�mo adoptar?</a></li>
                        <li><a href="dar_adopcion.jsp">Dar en adopci�n</a></li>
                    </ul>
                    <!-- Cambiar por un if que si se hay datos de sesion guardados se muestre un boton para ir a mi cuenta y si no hay que se muestra el iniciar sesion -->
                    <button class="navbar-login"><a href="registerlogin/screen.jsp">Iniciar sesi�n</a></button>
                </div>
            </nav>
            <div class="row">
                <div class="hero-card">
                    <div class="hero">
                        <div class="hero-content">
                            <h1>Bienvenido a Patitas Felices Veterinaria</h1>
                            <p>Tu mejor amigo merece el mejor cuidado. Descubre m�s sobre nuestros servicios y c�mo puedes adoptar o dar en adopci�n a una mascota.</p>
                            <a href="adopciones.jsp" class="cta-button">Ver adopciones</a>
                        </div>
                        <div class="hero-image">
                            <img src="assets/images/animales.jpg" alt="Patitas Felices">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row2">
                <div class="adopt-pet">
                    <h2>�Quieres <span>adoptar</span> una mascota?</h2>
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
            <div class="row3">
                <div class="hero-card">
                    <div class="hero">
                        <div class="hero-content">
                            <h1>Encuentra un <span>amigo</span> de Verdad</h1>                        
                            <p>Esta comprobado que tener una mascota en tu hogar mejora tu salud y humor.</p>
                            <a href="adopciones.jsp" class="cta-button">BUSCAR MASCOTAS</a>
                        </div>
                        <div class="hero-image">
                            <img src="assets/images/michi-atento.jpg" alt="Patitas Felices">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row4">
                <div class="ultimas-publicaciones">

                </div>
            </div>
            <div class="row5">
                <div class="perros-adopcion">

                </div>
            </div>
            <div class="row6">
                <div class="gatos-adopcion">

                </div>
            </div>
            <div class="row7">
                <div class="otros-adopcion">

                </div>
            </div>
            <footer></footer>
        </body>
    </html>
