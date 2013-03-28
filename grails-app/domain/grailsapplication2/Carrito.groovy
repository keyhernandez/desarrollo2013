package grailsapplication2

class Carrito {
    
    Integer cantidad;
  //  Compra compra;
  //  Producto producto;
    static belongsTo = [compra:Compra,producto: Producto]
    
    static constraints = {
    }
}
