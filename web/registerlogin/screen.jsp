<!DOCTYPE html>
<html>
    <head>
        <title>Bienvenido a Patitas Felices</title>
        <link rel="stylesheet" type="text/css" href="slide navbar style.css">
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
        <link href="styles.css" rel="stylesheet">
    </head>
    <body>
        <div class="main">  	
            <input type="checkbox" id="chk" aria-hidden="true">
            <div class="signup">
                <form action="register.jsp" method="POST">
                    <label for="chk" aria-hidden="true">Sign up</label>
                    <input type="text" name="txt" placeholder="Nombre de usuario" required="">
                    <input type="email" name="email" placeholder="Correo" required="">
                    <input type="password" name="pswd" placeholder="Contraseña" required="">
                    <button>Sign up</button>
                </form>
            </div>

            <div class="login">
                <form action="login.jsp" method="POST">
                    <label for="chk" aria-hidden="true">Login</label>
                    <input type="email" name="email" placeholder="Correo" required="">
                    <input type="password" name="pswd" placeholder="Contraseña" required="">
                    <button type="submit">Login</button>
                </form>
            </div>
        </div>
    </body>
</html>