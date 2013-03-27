package grailsapplication2

class Carrito {
    
    Integer cantidad;
    static belongsTo = Compra, Producto
    
    static constraints = {
    }
}
