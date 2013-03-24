package grailsapplication2

class Usuario {

    String nombre;
String apellido;
String cedula;
String correo;
String pais;
String ciudad;
String codpostal;
String direccion;
String fechaNac;
String fechaRegistro;

    static hasMany=[compras:Compra]
    static constraints = {
    }
}
