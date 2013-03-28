package grailsapplication2

class Compra {

    String status;
    double monto;
    String fechaCompra;
    String fechaEntrega;
    TDC tarjeta;
    String proceso;
    static belongsTo = [usuario:Usuario]
    
    static constraints = {
    }
}
