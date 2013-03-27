package grailsapplication2

class Carrito {
    
    Integer cantidad;
    Compra compra;
    Producto producto;
    static belongsTo = [Compra, Producto]
    
    static constraints = {
    }
}
