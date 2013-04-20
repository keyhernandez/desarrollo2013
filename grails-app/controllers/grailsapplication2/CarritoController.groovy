package grailsapplication2

import org.springframework.dao.DataIntegrityViolationException
import grailsapplication2.Compra
import grailsapplication2.Usuario
import grailsapplication2.Producto

class CarritoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }



    def create() {
        [carritoInstance: new Carrito(params)]
    }

    def save() {
        def carritoInstance = new Carrito(params)
        if (!carritoInstance.save(flush: true)) {
            render(view: "create", model: [carritoInstance: carritoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'carrito.label', default: 'Carrito'), carritoInstance.id])
        redirect(action: "show", id: carritoInstance.id)
    }

    def show(Long id) {
        def carritoInstance = Carrito.get(id)
        if (!carritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
            redirect(action: "list")
            return
        }

        [carritoInstance: carritoInstance]
    }

    def edit(Long id) {
        def carritoInstance = Carrito.get(id)
        if (!carritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
            redirect(action: "list")
            return
        }

        [carritoInstance: carritoInstance]
    }

    def update(Long id, Long version) {
        def carritoInstance = Carrito.get(id)
        if (!carritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (carritoInstance.version > version) {
                carritoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'carrito.label', default: 'Carrito')] as Object[],
                          "Another user has updated this Carrito while you were editing")
                render(view: "edit", model: [carritoInstance: carritoInstance])
                return
            }
        }

        carritoInstance.properties = params

        if (!carritoInstance.save(flush: true)) {
            render(view: "edit", model: [carritoInstance: carritoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'carrito.label', default: 'Carrito'), carritoInstance.id])
        redirect(action: "show", id: carritoInstance.id)
    }

    def delete(Long id) {
        println "parametros"
        println params
        def carritoInstance = Carrito.get(id)
        if (!carritoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
            redirect(action: "list")
            return
        }

        try {
            carritoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'carrito.label', default: 'Carrito'), id])
           
            redirect(action: "show", id: id)
        }
    }
    
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [carritoInstanceList: Carrito.list(params), carritoInstanceTotal: Carrito.count()]
    }
    
    def micarrito ={
        
    
        //        def user=Usuario.findById(session.usuario.id[0])
        //        
        //        def ultimaCompra=Compra.findByProcesoAndUsuario("carro",user)
        //        println ultimaCompra.id
        //        
        //        def productos=Carrito.findAllByCompra(ultimaCompra)
        //
        //        [carritoInstanceList1: productos, carritoInstanceTotal1: productos.size()]
        //       
       
        
    }
    
    
    def agregarAlcarro (Long idp, int cantidad) {
      
        
        def user= Usuario.findById(session.usuario.id[0])
        def producto=Producto.get(idp)
        
        //def consultaCompra=Compra.findByUsuario(user)
        def consultaCompra
        if (Compra.findByUsuario(user)!=null) {
            def c=Compra.executeQuery("select max(id) from Compra where usuario_id = ?",[user.id])[0]
            consultaCompra= Compra.findById(c)
           
        }
        else 
        { consultaCompra=null; 
        }
        if (consultaCompra==null){
            def compra=new Compra(monto:123,proceso:'carro',usuario:user)
            compra.save(flush:true)
            println(compra.id)
        
            def ultimaCompra=Compra.findByProcesoAndUsuario("carro",user)
            // def ultimaCompra= Compra.executeQuery("select max(id) from Compra where usuario_id = ? and proceso = 'carro'",[user.id])
        
            def carritoInstance = new Carrito(compra:ultimaCompra,producto:producto,cantidad:cantidad,subtotal:cantidad*producto.precio)
 
            carritoInstance.save(flush:true)
            println(carritoInstance.id)
       
        }
        else {
            if (consultaCompra.proceso!='carro')
            { println "else 1"
                def compra=new Compra(monto:123,proceso:'carro',usuario:user)
                compra.save(flush:true)
                println(compra.id)
        
                def ultimaCompra= Compra.findByProcesoAndUsuario("carro",user)
        
                def carritoInstance = new Carrito(compra:ultimaCompra,producto:producto,cantidad:cantidad,subtotal:cantidad*producto.precio)
                carritoInstance.save(flush:true)
                println(carritoInstance.id)
            }
            else if (consultaCompra.proceso=='carro' ) {
                def carritoInstance = new Carrito(compra:consultaCompra,producto:producto,cantidad:cantidad,subtotal:cantidad*producto.precio)
                carritoInstance.save(flush:true)
                println(carritoInstance.id)
            }
        }
     
        redirect (controller:'Producto', action:'show', id:producto.id)
    }
    
    def eliminarDelcarro(Long idp){
        def user= Usuario.findById(session.usuario.id[0])
        def producto=Producto.get(idp)
       
        def consultaCompra= Compra.findById(Compra.executeQuery("select max(id) from Compra where usuario_id = ?",[user.id])[0])
        
        def carro=Carrito.findByCompraAndProducto(consultaCompra,producto)
        carro.delete(flush:true)
        if (params.op=='x')
        redirect (action:micarrito)
        else
        redirect (controller:'Producto', action:'show', id:producto.id)
    }
}
