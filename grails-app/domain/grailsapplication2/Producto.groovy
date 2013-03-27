package grailsapplication2

class Producto {

    String nombre;
    String descripcion;
    byte [] screenshot;
    double precio;
    String categoria;
 
    static hasMany = [calificaciones:Calificacion, carrito: Carrito]
    
    static constraints = {
        screenshot(maxSize:1073741824)
        calificaciones(nullable:true,blank:true)
    }
}
