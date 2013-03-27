package grailsapplication2

class Compra {

    String status;
    double monto;
    String fechaCompra;
    String fechaEntrega;
    TDC tarjeta;
   
    static belongsTo = Usuario
    
    static constraints = {
    }
}
