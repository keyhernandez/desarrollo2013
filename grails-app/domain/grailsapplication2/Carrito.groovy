package grailsapplication2

class Carrito {
    
    Integer cantidad;
  //  Compra compra;
  //  Producto producto;
    static belongsTo = [compra:Compra,producto: Producto]
    
    static constraints = {
    }
    
    
      def micarrito (){
            
        def user=Usuario.findById(session.usuario.id)
        
        def ultimaCompra=Compra.findByProcesoAndUsuario("carro",user)

                def productos=Carrito.findAllByCompra(ultimaCompra)
        
               return productos
       
       
        
    }
}
