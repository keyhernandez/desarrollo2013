package grailsapplication2
import grails.converters.*


class BusquedaProductosController {

        def index = {
        switch(request.method){
            // obtener un registro
            case "GET":

                if(params.s){
                    render Producto.findById(params.s) as XML
                }else{
                    render Producto.list() as XML
                }
                break
                
            // crear una compra
            case "POST":
                println('Me leo 01')
                /*
                String status;
                double monto;
                String fechaCompra;
                String fechaEntrega;
                TDC tarjeta;
                String proceso;
                byte [] factura;
                static belongsTo = [usuario:Usuario]
                */
               
                def status = request.XML.nombre.toString()
                def monto = request.XML.monto.toDouble()
                def fechaCompra = request.XML.fecha_compra.toString()
                def fechaEntrega = request.XML.fecha_entrega.toString()
                def tarjeta = request.XML.tarjeta.toInteger()
                def proceso = request.XML.proceso.toString()
                def usuario = request.XML.usuario.toInteger()

                def miValor = new Compra(status: status,
                                           monto: monto,
                                           fechaCompra: fechaCompra,
                                           fechaEntrega: fechaEntrega,
                                           tarjeta: TDC.findById(tarjeta),
                                           proceso: proceso, 
                                           usuario: Usuario.findById(usuario)
                                           )
                
                if(miValor.save()){
                    println('\n\n\nCompra!!\n\n\n')
                    response.status = 201 // Compra ejecutada con exito
                    miValor.status = 'Compra Ejecutada'
                    render miValor as XML
                }
                else{
                    response.status = 500 //Internal Server Error
                    render "No se pudo crear la compra:\n ${miValor.errors}"
                }
                
                break

            
        }
    }
}
