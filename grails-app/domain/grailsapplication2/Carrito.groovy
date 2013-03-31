package grailsapplication2

class Carrito {
    
    Integer cantidad;

    static belongsTo = [compra:Compra,producto: Producto]
    
    static constraints = {
    }
   
}
