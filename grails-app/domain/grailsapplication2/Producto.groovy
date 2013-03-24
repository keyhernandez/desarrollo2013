package grailsapplication2

class Producto {

     String nombre;
String descripcion;
double precio;

    static belongsTo = Compra
    static hasMany = [calificaciones:Calificacion]
    static constraints = {
    }
}
