package grailsapplication2
import grails.converters.*

class SusyController {

    def index = {
        render UsuariosSusy.list() as XML
    }
    def test = {
        render UsuariosSusy.list() as XML
    }
}
