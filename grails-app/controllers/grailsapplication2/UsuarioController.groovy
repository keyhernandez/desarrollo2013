package grailsapplication2

import org.springframework.dao.DataIntegrityViolationException

class UsuarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }

    def create() {
        [usuarioInstance: new Usuario(params)]
    }

    def save() {
        def usuarioInstance = new Usuario(params)
        usuarioInstance.fechaRegistro=new Date().format("dd/MM/yyyy")
        usuarioInstance.token= session.openidIdentifier
        if (!usuarioInstance.save(flush: true)) {
            render(view: "create", model: [usuarioInstance: usuarioInstance])
            return
        }
        sendMail{
            to "kmhernandez.11@est.ucab.edu.ve"
            from "admin@retro.com"
            subject "Bienvenido a Retro Shop - Activa tu Cuenta"
            html "Te has registrado en Retro Shop! \n Para comenzar, haz click en el siguiente link  http://localhost:7070/GrailsApplication2/usuario/show/$usuarioInstance.id"
        }
       // flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
        redirect(action: "activar", id:usuarioInstance.id)
       
//render(view:'activar', model:[id:usuarioInstance.id])
    }

    def show(Long id) {
        def usuarioInstance = Usuario.get(id)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        [usuarioInstance: usuarioInstance]
    }

     def activar(Long id) { println id
        def usuarioInstance = Usuario.get(id)
        [usuarioInstance: usuarioInstance]
        flash.message= "Bienvenido $usuarioInstance.nombre, revisa tu correo para activar tu cuenta"
        redirect (uri:'/')
       
    }
    def edit(Long id) {
        def usuarioInstance = Usuario.get(id)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        [usuarioInstance: usuarioInstance]
    }

    def update(Long id, Long version) {
        def usuarioInstance = Usuario.get(id)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (usuarioInstance.version > version) {
                usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'usuario.label', default: 'Usuario')] as Object[],
                          "Another user has updated this Usuario while you were editing")
                render(view: "edit", model: [usuarioInstance: usuarioInstance])
                return
            }
        }

        usuarioInstance.properties = params

        if (!usuarioInstance.save(flush: true)) {
            render(view: "edit", model: [usuarioInstance: usuarioInstance])
            return
        }

     //   flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
        sendMail{
            to "kmhernandez.11@est.ucab.edu.ve"
            from "admin@retro.com"
            subject "Modificacion de tu perfil en RetroShop"
            html "Hola, $usuarioInstance.nombre $usuarioInstance.apellido , recientemente has realizado cambios en tu perfil de RetroShop, si los desconoces comunicate con el equipo de RetroShop mediante registro.retroshop@gmail.com"
        }
        redirect(action: "show", id: usuarioInstance.id)
    }

    def delete(Long id) {
        def usuarioInstance = Usuario.get(id)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        try {
            usuarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "show", id: id)
        }
    }
    def login = { 
        
    }
    def loggedin = { 
        def token=session.openidIdentifier
        def user=Usuario.executeQuery("from Usuario where token= ?",[token])
        if (user){
            session.usuario=user;
            redirect(uri:'/')
    }
    else 
    {
        redirect(action:"create")
    }
}

    def logout = {
        session.usuario=null;
        session.openidIdentifier=null;
        redirect(uri:'/')
    }
}
