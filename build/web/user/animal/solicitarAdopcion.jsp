<%@ page import="java.sql.*" %>
<%
    String idUsuarioStr = (String) session.getAttribute("id");
    Integer idUsuario = Integer.parseInt(idUsuarioStr);
    String idMascota = request.getParameter("idMascota");
    if (session.getAttribute("id") == null) {
        response.sendRedirect("../../registerlogin/screen.jsp?errorSesion=1");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Formulario de Adopción</title>
        <style>
            form {
                max-width: 700px;
                margin: auto;
                padding: 1rem;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
            }
            label {
                display: block;
                margin-top: 0.5rem;
            }
            input, textarea {
                width: 95%;
                padding: 0.5rem;
                margin-top: 0.5rem;
                resize: none;
            }
            button {
                margin-top: 1rem;
                padding: 0.5rem 1rem;
                background-color: #28a745;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #218838;
            }
        </style>
    </head>
    <body>
        <h2>Formulario de Adopción</h2>
        <form action="procesarSolicitudAdopcion.jsp" method="post">
            <input type="hidden" name="idUsuario" value="<%= idUsuario%>">
            <input type="hidden" name="idMascota" value="<%= idMascota%>">

            <label for="razonAdopcion">¿Por qué quieres adoptar una mascota?</label>
            <textarea id="razonAdopcion" name="razonAdopcion" rows="3" required></textarea>

            <label for="tiempoDisponible">¿Cuánto tiempo puedes dedicarle diariamente a tu mascota?</label>
            <textarea id="tiempoDisponible" name="tiempoDisponible" rows="2" required></textarea>

            <label for="viviendaTipo">¿Qué tipo de vivienda tienes? (casa, apartamento, etc.)</label>
            <textarea id="viviendaTipo" name="viviendaTipo" rows="2" required></textarea>

            <label for="espacioDisponible">¿Tienes espacio al aire libre para la mascota?</label>
            <textarea id="espacioDisponible" name="espacioDisponible" rows="2" required></textarea>

            <label for="habitantesCasa">¿Cuántas personas viven en tu casa y quiénes son?</label>
            <textarea id="habitantesCasa" name="habitantesCasa" rows="2" required></textarea>

            <label for="otrasMascotas">¿Tienes otras mascotas? Si es así, ¿cuáles?</label>
            <textarea id="otrasMascotas" name="otrasMascotas" rows="2" required></textarea>

            <label for="experienciaMascotas">¿Tienes experiencia previa con mascotas? Si es así, describe.</label>
            <textarea id="experienciaMascotas" name="experienciaMascotas" rows="3" required></textarea>

            <label for="responsablePrincipal">¿Quién será el responsable principal del cuidado de la mascota?</label>
            <textarea id="responsablePrincipal" name="responsablePrincipal" rows="2" required></textarea>

            <label for="actividadDiaria">¿Cuál será la actividad diaria de la mascota (paseos, juegos, etc.)?</label>
            <textarea id="actividadDiaria" name="actividadDiaria" rows="2" required></textarea>

            <label for="veterinarioPlan">¿Tienes un veterinario de confianza? ¿Cuál es tu plan para las visitas veterinarias?</label>
            <textarea id="veterinarioPlan" name="veterinarioPlan" rows="3" required></textarea>

            <button type="submit">Enviar Solicitud</button>
        </form>
    </body>
</html>
