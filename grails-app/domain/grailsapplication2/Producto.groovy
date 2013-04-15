package grailsapplication2

class Producto {

    String nombre;
    String descripcion;
    byte [] screenshot;
    double precio;
    String categoria;
 
  //  static hasMany = [carrito: Carrito]
    
    static constraints = {
        screenshot(nullable:true,maxSize:1073741824)
       // calificaciones(nullable:true,blank:true)
    }
}
