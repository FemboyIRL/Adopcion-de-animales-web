package models;

public class Usuario {
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
