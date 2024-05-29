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
                    <li><a href="como_adoptar.jsp">¿Cómo adoptar?</a></li>
                    <li><a href="dar_adopcion.jsp">Dar en adopción</a></li>
                </ul>
                <button class="navbar-login">Iniciar sesión</button>
            </div>
        </nav>
        <div class="row">
            <div class="hero-card">
                <div class="hero">
                    <div class="hero-content">
                        <h1>Bienvenido a Patitas Felices Veterinaria</h1>
                        <p>Tu mejor amigo merece el mejor cuidado. Descubre más sobre nuestros servicios y cómo puedes adoptar o dar en adopción a una mascota.</p>
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
        <div class="row3">
            <div class="hero-card">
                <div class="hero">
                    <div class="hero-content">
                        <h1>Encuentra un <span>amigo</span> de Verdad</h1>                        
                        <p>Tu mejor amigo merece el mejor cuidado. Descubre más sobre nuestros servicios y cómo puedes adoptar o dar en adopción a una mascota.</p>
                        <a href="adopciones.jsp" class="cta-button">Ver adopciones</a>
                    </div>
                    <div class="hero-image">
                        <img src="assets/images/animales.jpg" alt="Patitas Felices">
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
