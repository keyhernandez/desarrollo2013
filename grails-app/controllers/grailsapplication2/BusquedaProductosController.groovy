package grailsapplication2

import grails.converters.*

/**
 * Controladores del API de busqueda de productos:
 *
 *
 *
 * Buscar por:<br>
 *    - id del producto (solo retorna un registro)<br>
 *        curl --request GET http://localhost:7070/GrailsApplication2/rest/productos/1 <br>
 * 	- todos los productos <br>
 *         http://localhost:7070/GrailsApplication2/rest/productos/ <br>
 * 	- nombre de producto <br>
 *    - categoria <br>
 *
 *
 */
class BusquedaProductosController {
    /**
     * Paginador automatico de registros. El primer objeto de la lista es un diccionario informativo
     *

     *
     * @param objeto: dominio/modelo groovy a paginar
     * @param parametros: parametros del request para definir numero de pagina actual
     * @param reg_pagina: numero de registros por pagina
     * @param tipo_busqueda: define si es una lista o ilike
     * @param argumento_ilike: es la columna al cual se le hara el ilike
     * @param valor_ilike: es el valor que se tomara para el ilike
     * @return lista con objetos de la busqueda cuyo primer objeto contiene la informacion del paginado<br>
     *
     * <b>r_count:</b> conteo de registros total del objeto <br>
     * <b>pag_actual:</b> pagina actual <br>
     * <b>reg_pagina:</b> registros por pagina <br>
     * <b>num_paginas:</b> numero de paginas en total <br>
     * <b>prev_page:</b> pagina anterior (false de no existir) <br>
     * <b>next_page:</b> pagina siguiente (false de no existir) <br>
     *
     */

    def paginador(objeto, pag_actual, reg_pagina, tipo_busqueda, argumento_ilike, valor_ilike){

        // preparar el objeto a retornar creando una lista compuesta haciendo las busquedas
        // del valor cero con los detalles del paginado dependiendo del tipo de busqueda
        def p = objeto
        //Producto p
        if (tipo_busqueda == 'lista'){
            p = objeto.list(sort: 'id')
            //render p + '<br>'

        } else if (tipo_busqueda == 'ilike') {
            println "argumento" + argumento_ilike + valor_ilike
            //render objeto == Producto + "<br>"
            //            p = objeto.findAll(sort: 'id') {
            //                //argumento_ilike =~ valor_ilike
            //                nombre =~ 'apple'
            //           
            //            }
            
            p = Producto.withCriteria {
                ilike('nombre','%'+valor_ilike+'%')
            }
            println "resultado  "+p
        }

        // cuantos registros en total tiene el objeto
        def r_count = p.size()

        if (r_count>0){
            // redondear hacia arriba siempre el numero de paginas
            def num_paginas = Math.ceil(r_count / reg_pagina).toInteger()

            // definir si la division del numero de paginas deja residuo
            def registros_ultima_pagina = r_count % reg_pagina

            // registro del que se iniciara el slice de la lista
            def inicio_actual = (pag_actual * reg_pagina) - reg_pagina + 1

            // registro del que se finalizara el slice de la lista cuando no es la ultima
            def fin_actual = pag_actual * reg_pagina

            // hay pagina siguiente? hay pagina anterior?
            //
            // definir pagina anterior
            def prev_page = false
            if (pag_actual > 1){
                prev_page = pag_actual - 1
            }
            // definir pagina siguiente
            def next_page = false
            if (pag_actual < num_paginas){
                next_page = pag_actual + 1
            }

            // rangos exactos para el slice
            def inicio_lista = inicio_actual - 1
            // definir el final exacto
            // y aqui si es la ultima pagina
            def fin_lista = fin_actual -1
            if (pag_actual == num_paginas & registros_ultima_pagina != 0){
                fin_lista = inicio_lista + registros_ultima_pagina - 1
            }
            // hacer slicing
            p = p[inicio_lista..fin_lista]
            // agregar los datos de
            p.add(0, [r_count: r_count, pag_actual: pag_actual, reg_pagina: reg_pagina,
                    num_paginas: num_paginas, prev_page: prev_page, next_page: next_page])
    
            return p
        }
        else { 
            return 0 
        }
    }

    /**
     * Obtiene un producto por ID directamente de la URL via GET
     *
     * ejemplo:
     * curl --request GET http://localhost:7070/GrailsApplication2/rest/producto_id/2
     *
     */
    def producto_id = {
        if (request.method == 'GET') {
           
            def p = Producto.findById(params.s)
            // la instancia retorna null en caso de
            // no obtener registros en el query
            if (p){
                render p as XML
            } else {
                render 'Error, no existe un producto con ese ID \n'
            }
        }
    }

    /**
     * Retorna todos los productos ordenados por ID en XML
     *
     * La paginacion es /rest/productos/$pag? donde pag equivale al numero de pagina, iniciando en 1.
     *
     */
    def productos = {
        String pag
        if (params.pag != null){
            pag = params.pag
        } else {
            pag = '1'
        }
        render paginador(Producto, pag.toInteger(), 10, 'lista', null, null) as XML
    }

    def categorias = {
        if (request.method == 'GET'){
            //render 'Pag: ' + params.pag + ' y categoria: ' + params.cat

            /*
            def prods = Producto.findAll(sort: 'id') {
            categoria =~ params.cat
            }
            //render 'Prods: ' + prods + '\n'
            render 'Aqui hay: ' + prods.size() + '\n'

            render 'Pagina: ' + params.pag.toInteger() + '\n'
            render 'Categoria: ' + params.cat + '\n'
             */
            println "param"+params
            render paginador(Producto, params.s.toInteger(), 10, 'ilike', 'categoria', params.cat) as JSON

            //for (x in paginador(Producto, params.pag.toInteger(), 12, 'ilike', 'categoria', 'laptops')){
            //    render x.id + ': ' + x.nombre + '\n'
            //}
        }
    }
    
    def nombre_producto = {
        if (request.method == 'GET'){
            println "param"+params
        
            def buscar = paginador(Producto, params.s.toInteger(), 10, 'ilike', 'nombre', params.cat)
            if (buscar!=0)
            render buscar as JSON
            else
            render "No hay productos con esa caracteristica"
        
        }
    }
    
    /**
     * Servicio de colocar calificaciones a los productos
     */
    def colocar_puntuacion = {
        if (request.method == 'POST') {

            def comentario = request.XML.comentario.toString()
            def producto_id = request.XML.producto_id.toString()
            def puntuacion = request.XML.puntuacion.toString()
            def usuario_id = request.XML.usuario_id.toString()

            def p = Producto.findById(producto_id)
            def u = Usuario.findById(usuario_id)
            def punt = new Calificacion(comentario: comentario,
                producto: p,
                puntuacion: puntuacion,
                usuario: u)

            if (punt.save()){
                render '\n\n\nFunciono\n\n\n'
                response.status = 201 // Created
                render punt as XML
            } else {
                render '\n\n\nXXX\n\n\n'
                response.status = 500 //Internal Server Error
                render "No se pudo crear un comentario... Este fue el error:\n ${punt.errors}"
            }
        }

    }

    def hello = {
        return 'Hello!!'
    }
}
