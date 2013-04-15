package grailsapplication2
import grailsapplication2.Producto

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
    
    def getMonto ( idcompra) {
       // def compra=Compra.findById(idcompra)
        ArrayList idproductos= Carrito.executeQuery("select cast(producto_id as long) from Carrito where compra_id= ?",[idcompra])//findAllByCompra(compra)
      
        println "ids p $idproductos"
        def productos= Producto.findAllByIdInList(idproductos)
     //    def monto = Producto.executeQuery("select cast(sum(precio) as double) from Producto where id in $idproductos")
     
     //   PdfQR x= new PdfQR()
       // x.generarFactura()
       
       
        return monto
    }
}
