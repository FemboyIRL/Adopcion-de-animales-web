package models;

public class Animal {
    private int id;
    private String nombre;
    private int edad;
    private String especie;
    private String raza;
    private String otrasCaracteristicas;
    private int idUsuario;
    private String sexo;
    private String size;
    
    public Animal(int id, String nombre, int edad, String especie, String raza, String otrasCaracteristicas, int idUsuario, String sexo, String size) {
        this.id = id;
        this.nombre = nombre;
        this.edad = edad;
        this.especie = especie;
        this.raza = raza;
        this.otrasCaracteristicas = otrasCaracteristicas;
        this.idUsuario = idUsuario;
        this.sexo = sexo;
        this.size = size;
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
        return sexo;
    }
    
    public String getSize(){
        return size;
    }
}

