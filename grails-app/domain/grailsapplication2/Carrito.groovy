package grailsapplication2

class Carrito {
    
    Integer cantidad;
    Double subtotal;
    static belongsTo = [compra:Compra,producto: Producto]
    
    static constraints = {
    }
   
}
