package grailsapplication2

import org.springframework.dao.DataIntegrityViolationException

class TDCController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) { println params
        params.max = Math.min(max ?: 10, 100)
        def user=Usuario.findById(session.usuario.id[0])
        [TDCInstanceList: TDC.findAllByUsuario(user), TDCInstanceTotal: TDC.count()]
    }

    def create() {
        [TDCInstance: new TDC(params)]
    }

    def save() {
        params.usuario=Usuario.findById(session.usuario.id[0])
        def TDCInstance = new TDC(params)
        if (!TDCInstance.save(flush: true)) {
            render(view: "create", model: [TDCInstance: TDCInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'TDC.label', default: 'TDC'), TDCInstance.id])
        redirect(action:"list")
        //redirect(action: "show", id: TDCInstance.id)
    }

    def show(Long id) {
        def TDCInstance = TDC.get(id)
        if (!TDCInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TDC.label', default: 'TDC'), id])
            redirect(action: "list")
            return
        }

        [TDCInstance: TDCInstance]
    }

    def edit(Long id) {
        def TDCInstance = TDC.get(id)
        if (!TDCInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TDC.label', default: 'TDC'), id])
            redirect(action: "list")
            return
        }

        [TDCInstance: TDCInstance]
    }

    def update(Long id, Long version) {
        def TDCInstance = TDC.get(id)
        if (!TDCInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TDC.label', default: 'TDC'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (TDCInstance.version > version) {
                TDCInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'TDC.label', default: 'TDC')] as Object[],
                          "Another user has updated this TDC while you were editing")
                render(view: "edit", model: [TDCInstance: TDCInstance])
                return
            }
        }

        TDCInstance.properties = params

        if (!TDCInstance.save(flush: true)) {
            render(view: "edit", model: [TDCInstance: TDCInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'TDC.label', default: 'TDC'), TDCInstance.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def TDCInstance = TDC.get(id)
        if (!TDCInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'TDC.label', default: 'TDC'), id])
            redirect(action: "list")
            return
        }

        try {
            TDCInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'TDC.label', default: 'TDC'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'TDC.label', default: 'TDC'), id])
            redirect(action: "show", id: id)
        }
    }
}
