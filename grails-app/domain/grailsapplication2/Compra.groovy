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
        status (nullable: true);
        fechaEntrega(nullable:true)
        tarjeta(nullable:true)
        status(nullable:true)
        monto (nullable:true)
        fechaCompra (nullable:true)
        
    }
}
