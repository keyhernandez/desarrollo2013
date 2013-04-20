package grailsapplication2

import org.springframework.dao.DataIntegrityViolationException
import org.compass.core.engine.SearchEngineQueryParseException

class ProductoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    static String WILDCARD = "*"
    def searchableService
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [productoInstanceList: Producto.list(params), productoInstanceTotal: Producto.count()]
    }

    def create() {
        [productoInstance: new Producto(params)]
    }

    def save() {
        def productoInstance = new Producto(params)
        if (!productoInstance.save(flush: true)) {
            render(view: "create", model: [productoInstance: productoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'producto.label', default: 'Producto'), productoInstance.id])
        redirect(action: "show", id: productoInstance.id)
    }

    def show(Long id) {
        def productoInstance = Producto.get(id)
        
        if (!productoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        [productoInstance: productoInstance]
    }

    def edit(Long id) {
        def productoInstance = Producto.get(id)
        if (!productoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        [productoInstance: productoInstance]
    }

    def update(Long id, Long version) {
        def productoInstance = Producto.get(id)
        if (!productoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (productoInstance.version > version) {
                productoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'producto.label', default: 'Producto')] as Object[],
                          "Another user has updated this Producto while you were editing")
                render(view: "edit", model: [productoInstance: productoInstance])
                return
            }
        }

        productoInstance.properties = params

        if (!productoInstance.save(flush: true)) {
            render(view: "edit", model: [productoInstance: productoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'producto.label', default: 'Producto'), productoInstance.id])
        redirect(action: "show", id: productoInstance.id)
    }

    def delete(Long id) {
        def productoInstance = Producto.get(id)
        if (!productoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        try {
            productoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "show", id: id)
        }
    }
    
     def showImage = {
        def imagen = Producto.get( params.id )
        response.outputStream << imagen.screenshot
        response.outputStream.flush()
    }
    
    

    def categorias(Integer max, String categoria){
        params.max = Math.min(max ?: 10, 100)
        def productos= Producto.executeQuery("from Producto where categoria= ?", [categoria])
        println(productos)
        [productoInstanceList : productos, productoInstanceTotal:Producto.count()]
    }
    
    def search = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            String searchTerm = WILDCARD+ params.q + WILDCARD
         //   println (Producto.search("*Apple*"))
            return [searchResult: searchableService.search(searchTerm, params)] //searchTerm, params
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }
  def indexAll = {
        Thread.start {
            searchableService.index()
        }
        render("bulk index started in a background thread")
    }

    def unindexAll = {
        searchableService.unindex()
        render("unindexAll done")
    }

}
