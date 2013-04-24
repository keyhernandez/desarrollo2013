package grailsapplication2

import grails.converters.*
import org.springframework.dao.DataIntegrityViolationException

class CompraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def user=Usuario.get(session.usuario.id[0])
        def compras=Compra.findAllByUsuarioAndProceso(user,'compra')
        [compraInstanceList: compras, compraInstanceTotal: compras.size()]
    }

    def create() {
        [compraInstance: new Compra(params)]
    }

    def save() {
        def compraInstance = new Compra(params)
        if (!compraInstance.save(flush: true)) {
            render(view: "create", model: [compraInstance: compraInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'compra.label', default: 'Compra'), compraInstance.id])
        redirect(action: "show", id: compraInstance.id)
    }

    def show(Long id) {
        def compraInstance = Compra.get(id)
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        [compraInstance: compraInstance]
    }

    def edit(Long id) {
        def compraInstance = Compra.get(id)
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        [compraInstance: compraInstance]
    }

    def update(Long id, Long version) {
        def compraInstance = Compra.get(id)
        def usuario=Usuario.findById(session.usuario.id[0])
        PdfQR x= new PdfQR()
        compraInstance.factura=x.generarFactura(compraInstance.id)
        
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (compraInstance.version > version) {
                compraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'compra.label', default: 'Compra')] as Object[],
                          "Another user has updated this Compra while you were editing")
                render(view: "edit", model: [compraInstance: compraInstance])
                return
            }
        }

        compraInstance.properties = params

        if (!compraInstance.save(flush: true)) {
            render(view: "edit", model: [compraInstance: compraInstance])
            return
        }
        File f=new File(usuario.nombre+"-"+id+".pdf")
        f.delete()
        sendMail{
            multipart true
            to "$usuario.correo","kmhernandez.11@est.ucab.edu.ve"
            from "admin@retro.com"
            subject "Orden de Compra"
            html "Factura de la compra realizada"
            attachBytes usuario.nombre+"-"+id+".pdf",'application/pdf',compraInstance.factura
        }
        sendMail{
            
            to "$usuario.correo","kmhernandez.11@est.ucab.edu.ve"
            from "admin@retro.com"
            subject "Califica los productos"
            html "Te recordamos que debes calificar los productos de tu compra a traves del siguiente link http://localhost:7070/GrailsApplication2/calificacion/productos"
            
        }
        
        flash.message = message(code: 'default.updated.message', args: [message(code: 'compra.label', default: 'Compra'), compraInstance.id])
        redirect(action: "show", id: compraInstance.id)
    }

    def delete(Long id) {
        def compraInstance = Compra.get(id)
        if (!compraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
            return
        }

        try {
            compraInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'compra.label', default: 'Compra'), id])
            redirect(action: "show", id: id)
        }
    }
    
    def renderFactura() {                              //for pdf file download  
        def compraInstance = Compra.get(params.id)  
        response.setContentType('application/pdf')  
        byte[] pdf = compraInstance.factura 
        response.outputStream << pdf  
    } 
    
    def entrega(){
        def compraInstance = Compra.get(params.id)
        compraInstance.fechaEntrega= new Date().format("dd/MM/yyyy HH:mm")
        compraInstance.status="Entregada"
        compraInstance.save(flush:true)
        render compraInstance as XML
    }
}
