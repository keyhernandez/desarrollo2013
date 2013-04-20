package grailsapplication2
import grailsapplication2.Producto
import grailsapplication2.Usuario
import grailsapplication2.Carrito
class Compra {

    String status;
    double monto;
    String fechaCompra;
    String fechaEntrega;
    TDC tarjeta;
    String proceso;
    byte [] factura;
    static belongsTo = [usuario:Usuario]
    
    static constraints = {
        status (nullable: true)
        fechaEntrega(nullable:true)
        tarjeta(nullable:true)
        status(nullable:true)
        monto (nullable:true)
        fechaCompra (nullable:true)
        factura(nullable:true,maxSize:107374182)
    }
    
    def getMonto ( idcompra) {
       
        
        return  Carrito.executeQuery("select sum(subtotal) from Carrito where compra_id= ?",[idcompra])[0]
    
    }
    
    static ultimaCompra (iduser) {
       
        def user=Usuario.findById(iduser)
       
        def c=Compra.executeQuery("select max(id) from Compra where usuario_id = ? and proceso='carro'",[user.id])[0]
        
        return c
    }
}
