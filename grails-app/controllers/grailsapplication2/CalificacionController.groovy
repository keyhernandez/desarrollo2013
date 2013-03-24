package grailsapplication2

import org.springframework.dao.DataIntegrityViolationException

class CalificacionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [calificacionInstanceList: Calificacion.list(params), calificacionInstanceTotal: Calificacion.count()]
    }

    def create() {
        [calificacionInstance: new Calificacion(params)]
    }

    def save() {
        def calificacionInstance = new Calificacion(params)
        if (!calificacionInstance.save(flush: true)) {
            render(view: "create", model: [calificacionInstance: calificacionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'calificacion.label', default: 'Calificacion'), calificacionInstance.id])
        redirect(action: "show", id: calificacionInstance.id)
    }

    def show(Long id) {
        def calificacionInstance = Calificacion.get(id)
        if (!calificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calificacion.label', default: 'Calificacion'), id])
            redirect(action: "list")
            return
        }

        [calificacionInstance: calificacionInstance]
    }

    def edit(Long id) {
        def calificacionInstance = Calificacion.get(id)
        if (!calificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calificacion.label', default: 'Calificacion'), id])
            redirect(action: "list")
            return
        }

        [calificacionInstance: calificacionInstance]
    }

    def update(Long id, Long version) {
        def calificacionInstance = Calificacion.get(id)
        if (!calificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calificacion.label', default: 'Calificacion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (calificacionInstance.version > version) {
                calificacionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'calificacion.label', default: 'Calificacion')] as Object[],
                          "Another user has updated this Calificacion while you were editing")
                render(view: "edit", model: [calificacionInstance: calificacionInstance])
                return
            }
        }

        calificacionInstance.properties = params

        if (!calificacionInstance.save(flush: true)) {
            render(view: "edit", model: [calificacionInstance: calificacionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'calificacion.label', default: 'Calificacion'), calificacionInstance.id])
        redirect(action: "show", id: calificacionInstance.id)
    }

    def delete(Long id) {
        def calificacionInstance = Calificacion.get(id)
        if (!calificacionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'calificacion.label', default: 'Calificacion'), id])
            redirect(action: "list")
            return
        }

        try {
            calificacionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'calificacion.label', default: 'Calificacion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'calificacion.label', default: 'Calificacion'), id])
            redirect(action: "show", id: id)
        }
    }
}
