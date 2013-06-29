package grailsapplication2

import grails.converters.*

class ProrestController {

    /**
    * Metodo de lectura de servicios REST
    */

    def lector_rest(url, type){
        def url_local = new URL(url) 
        def response = ''
        if (type=='JSON'){
            response = JSON.parse(url_local.newReader()) 
        }else if(type=='XML'){
            response = XML.parse(url_local.newReader()) 
        }else{
            response = ''
        }
        def r = [:]
        //response.each { key, value ->
        //    println "$key = $value"
        //}
        for (x in response.keys()){
            r.put(x, response[x])
        }
        
        return r
    }

    /**
    * Simulador rest sin arrobas (ver si la fuente puede quitarselas
    */
    def json_test_noa = {
        render(text: '{"?xml":{"version":"1.0","encoding":"UTF-8"},"respuesta":{"estado":"ok","productos":{"pagina":"17","paginas":"18","porpagina":"5","total":"87","producto":[{"id":"131","nombre":"Balon de Futbol La Vinotinto Venezuela Buffecorp","descripcion":"Cocido a mano con medidas oficiales de la FIFA","categoria":"deportes","imagen":"http://172.16.65.131/proyecto/cybershop/presentacion/Images/131.jpg","precio":"174","peso":"-1","alto":"-1","ancho":"-1","profundidad":"-1","cantidad":"50"},{"id":"134","nombre":"Pelotas Medicinales De Softbol Worth 5-tools Kit De 3","descripcion":"Para entrenamiento de Lanzadores y Outfilders","categoria":"deportes","imagen":"http://172.16.65.131/proyecto/cybershop/presentacion/Images/134.jpg","precio":"779","peso":"-1","alto":"-1","ancho":"-1","profundidad":"-1","cantidad":"50"},{"id":"136","nombre":"Perrubia tipo pelota para jugadores de bowling","descripcion":"Da un mejor agarre de la bola ya que seca la mano del sudor","categoria":"deportes","imagen":"http://172.16.65.131/proyecto/cybershop/presentacion/Images/136.jpg","precio":"180","peso":"-1","alto":"-1","ancho":"-1","profundidad":"-1","cantidad":"50"},{"id":"137","nombre":"Coledeon o parche de piel para jugadores de Bowling","descripcion":"Creo una piel artificial pera evitar maltratar la piel","categoria":"deportes","imagen":"http://172.16.65.131/proyecto/cybershop/presentacion/Images/137.jpg","precio":"95","peso":"-1","alto":"-1","ancho":"-1","profundidad":"-1","cantidad":"50"},{"id":"139","nombre":"Mu&#241;equera Robbys para jugar bowling","descripcion":"Da soporte a la mu&#241;eca para un mejor release de la pelota","categoria":"deportes","imagen":"http://172.16.65.131/proyecto/cybershop/presentacion/Images/139.jpg","precio":"380","peso":"-1","alto":"-1","ancho":"-1","profundidad":"-1","cantidad":"50"}]}}}', contentType: 'text/json', enconding: 'UTF-8')
    
    }

    /*
    * Simulacion del servicio REST a leer (con arrobas!!)
    */

    def json_test = {
        render(text: '{"?xml":{"@version":"1.0","@encoding":"UTF-8"},"respuesta":{"@estado":"ok","productos":{"@pagina":"17","@paginas":"18","@porpagina":"5","@total":"87","producto":[{"@id":"131","@nombre":"Balon de Futbol La Vinotinto Venezuela Buffecorp","@descripcion":"Cocido a mano con medidas oficiales de la FIFA","@categoria":"deportes","@imagen":"http://172.16.65.131/proyecto/cybershop/presentacion/Images/131.jpg","@precio":"174","@peso":"-1","@alto":"-1","@ancho":"-1","@profundidad":"-1","@cantidad":"50"},{"@id":"134","@nombre":"Pelotas Medicinales De Softbol Worth 5-tools Kit De 3","@descripcion":"Para entrenamiento de Lanzadores y Outfilders","@categoria":"deportes","@imagen":"http://172.16.65.131/proyecto/cybershop/presentacion/Images/134.jpg","@precio":"779","@peso":"-1","@alto":"-1","@ancho":"-1","@profundidad":"-1","@cantidad":"50"},{"@id":"136","@nombre":"Perrubia tipo pelota para jugadores de bowling","@descripcion":"Da un mejor agarre de la bola ya que seca la mano del sudor","@categoria":"deportes","@imagen":"http://172.16.65.131/proyecto/cybershop/presentacion/Images/136.jpg","@precio":"180","@peso":"-1","@alto":"-1","@ancho":"-1","@profundidad":"-1","@cantidad":"50"},{"@id":"137","@nombre":"Coledeon o parche de piel para jugadores de Bowling","@descripcion":"Creo una piel artificial pera evitar maltratar la piel","@categoria":"deportes","@imagen":"http://172.16.65.131/proyecto/cybershop/presentacion/Images/137.jpg","@precio":"95","@peso":"-1","@alto":"-1","@ancho":"-1","@profundidad":"-1","@cantidad":"50"},{"@id":"139","@nombre":"Mu&#241;equera Robbys para jugar bowling","@descripcion":"Da soporte a la mu&#241;eca para un mejor release de la pelota","@categoria":"deportes","@imagen":"http://172.16.65.131/proyecto/cybershop/presentacion/Images/139.jpg","@precio":"380","@peso":"-1","@alto":"-1","@ancho":"-1","@profundidad":"-1","@cantidad":"50"}]}}}', contentType: 'text/json', enconding: 'UTF-8')
    
    }


    /**
    * controlador de muestra de productos 
    */
    def productos_rest = {
        def url_t = 'http://localhost:7070/GrailsApplication2/rest/json_test_noa/'
        //Obtener el array directamente desde el objeto JSON
        def r = lector_rest(url_t, 'JSON').get('respuesta').get('productos').get('producto')
        [p_rest: r]
    }

    /**
    * Simulador de vista de producto
    */
    def productos_rest_id = {
        def url_t = 'http://localhost:7070/GrailsApplication2/rest/json_test_noa/'
        //Obtener el array directamente desde el objeto JSON
        def r = lector_rest(url_t, 'JSON').get('respuesta').get('productos').get('producto')
        def a = [:]
        for (x in r){
            if (x.get('id') == params.id){
                a = x
            }
        }
        [p_rest: a]
    }
}

