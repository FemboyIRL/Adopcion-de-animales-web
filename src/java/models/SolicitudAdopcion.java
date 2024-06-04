package models;

public class SolicitudAdopcion {
    private int id;
    private int idUsuario;
    private int idMascota;
    private String estadoSolicitud;
    private String informacionFormulario;
    private String nombreUsuario;
    private String correoElectronico;
    private String telefono;

    // Constructor que incluye todos los campos
    public SolicitudAdopcion(int id, int idUsuario, int idMascota, String estadoSolicitud, String informacionFormulario, String nombreUsuario, String correoElectronico, String telefono) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.idMascota = idMascota;
        this.estadoSolicitud = estadoSolicitud;
        this.informacionFormulario = informacionFormulario;
        this.nombreUsuario = nombreUsuario;
        this.correoElectronico = correoElectronico;
        this.telefono = telefono;
    }

    // Getters and setters for all fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdMascota() {
        return idMascota;
    }

    public void setIdMascota(int idMascota) {
        this.idMascota = idMascota;
    }

    public String getEstadoSolicitud() {
        return estadoSolicitud;
    }

    public void setEstadoSolicitud(String estadoSolicitud) {
        this.estadoSolicitud = estadoSolicitud;
    }

    public String getInformacionFormulario() {
        return informacionFormulario;
    }

    public void setInformacionFormulario(String informacionFormulario) {
        this.informacionFormulario = informacionFormulario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
