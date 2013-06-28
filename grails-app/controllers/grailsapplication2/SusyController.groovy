package grailsapplication2

import grails.converters.*

/**
 * Clase Susy... maneja todos los webservices
 * de forma XYZ
 */
class SusyController {

    //def index = {
    //    render 'xxx'
    //}

    //def show = {
    //   render Susy.list() as JSON
    //}

    /*
    def index = {
        switch(request.method){
            case "POST":
                render "Create\n"
                break
            case "GET":
                render "Retrieve\n"
                break
            case "PUT":
                render "Update\n"
                break
            case "DELETE":
                render "Delete\n"
                break
        }
    }
    */
    /*
    Veamos que tal se lee esto
    y esto debe estar en una nueva linea
    y aqui otra mas
    * y esta inicia con asterisco

     */

    def index = {
        switch(request.method){
        /**
         * metodo GET
         */
            case "GET":
                if(params.s){
                    render Producto.findById(params.s) as XML
                }else{
                    render Producto.list() as XML
                }
                break

        /**
         * metodo DELETE
         */
            case "DELETE":
                if(params.s){
                    def miValor = Producto.findById(params.s)
                    if(miValor){
                        miValor.delete()
                        render "Borrado Exitosamente"
                    }
                    else{
                        response.status = 404 //Not Found
                        render "${params.s} no existe."
                    }
                }
                else{
                    response.status = 400 //Bad Request
                    render """DELETE request debe incluir el ID
                              Ejemplo: /rest/botona/id
                           """
                }
                break

        /**
         * metodo POST
         */
            case "POST":
                def nombre = request.XML.nombre.toString()
                def direccion = request.XML.direccion.toString()
                def email = request.XML.email.toString()

                println(nombre)
                println(direccion)
                println(email)

                def miValor = new Susy(email: email,
                                       nombre: nombre,
                                       direccion: direccion)
                if(miValor.save()){
                    response.status = 201 // Created
                    render miValor as XML
                }
                else{
                    response.status = 500 //Internal Server Error
                    render "No se pudo crear una instancia Susy por:\n ${miValor.errors}"
                }
                break

        /**
         * metodo PUT
         */
            case "PUT":
                println('\n\n')
                println(request.XML.id)
                println('\n\n')
                def miValor = Susy.findById(request.XML.id.toInteger())

                miValor.email = request.XML.email
                miValor.direccion = request.XML.direccion
                miValor.nombre = request.XML.nombre

                if(miValor.save()){
                    response.status = 200 // OK
                    render miValor as XML
                }
                else{
                    response.status = 500 //Internal Server Error
                    render "No se pudo actualizar Susy por:\n ${airport.errors}"
                }
                break

        }
    }

    def delete = {
        render Susy.find()
    }

    def valores = {
        [p: params]
    }

    def hey = {
        [botona: Susy.list()]
    }

    def test = {
        if (params.ve=='ve' && params.fr=='fr' ){
            flash.message = 'Login Correcto'
            session.user = 'Administrador'
        }else{
            flash.message = 'Login Incorrecto'
        }
        [p: params, s: Susy.list()]


    def logout = {
        session.user = null
        redirect(action: 'index')
    }



    }
}
