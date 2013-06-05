package grailsapplication2


import grails.test.mixin.*
import org.junit.*

/**
 * Pruebas unitarias del controlador manejador de las apis, BusquedaProductos
 */
@TestFor(BusquedaProductosController)
class BusquedaProductosControllerTests {

    /**
     * Creo las referencias de los objetos para que estos esten disponibles
     * en toda la clase
     */
    BusquedaProductosController b
    Producto p
    String pag_actual
    String reg_pagina
    String tipo_busqueda
    String argumento_ilike
    String valor_ilike


    /**
     * Inicializo los objetos
     */
    @Before
    void init(){
        print '\nPaso por init\n'
        b = new BusquedaProductosController()
        //p = new Producto()

        // Prueba con un ID ficticio, en este caso 1

        pag_actual = 1
        reg_pagina = 10
        tipo_busqueda = 'lista'
        argumento_ilike = null
        valor_ilike = null
    }


    /**
     * Pruebas del metodo hello
     */
    @Test
    void testHello() {
        print '\n\n paso por test \n\n'
        controller.hello()
        assert response.text == 'Hello!!'
        //assert b.hello() == 'Hello!!'
    }

    /**
     * test producto
     */
    @Test
    void testGetProducto() {
        controller.productos

        assert 'org.codehaus.groovy.grails.plugins.testing.GrailsMockHttpServletResponse' == response
        print response.getClass()

        //assert '{"book":"Great"}' == response.text
        //print '\n\nXML: ' + response.XML
    }


    /**
     * ejecucion de las pruebas del paginador
     */
    /*
    @Test
    void testPaginador(){
        //def p = Producto.list(sort: 'id')

        //controller.paginador(p, pag_actual, reg_pagina, tipo_busqueda, argumento_ilike, valor_ilike )
        //print '\n\na: ' + a
        //def p = Producto()
        //print '\n\np1: ' + Producto.list()

        print '\n\np2: ' + p.getClass()
        print '\n\np3: ' + p
        print '\n\np3: ' + controller.hello()
    }
    */

    /**
     * Cerramos todo
     */
    @After
    void teardown (){
        print '\nPaso por teardown\n'
        b = null;
    }
}
