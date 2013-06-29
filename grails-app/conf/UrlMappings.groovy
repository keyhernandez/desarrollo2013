class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }
        /**
         * Busqueda por IDs
          */
        "/rest/producto_id/$id?"(controller: "BusquedaProductos", action: "producto_id")

        /**
         * Busqueda de productos por pagina
          */
        "/rest/productos/$pag?"(controller: "BusquedaProductos", action: "productos")

        /**
         * Busqueda por categoria (retorna paginado)
         */
        "/rest/categorias/$cat?/$pag?"(controller:"BusquedaProductos", action:"categorias")

        /**
         * Busqueda por nomnre (retorna paginado)
         */
        "/rest/nombre_producto/$prod?/$pag?"(controller:"BusquedaProductos", action:"nombre_producto")

        /**
         * Colocar la puntiacion a un producto
          */
        "/rest/puntuacion/$prod_id?"(controller:"BusquedaProductos", action:"colocar_puntuacion")



        /**
        * lectura de rest
        */
        "/rest/json_test/"(controller:"Prorest", action:"json_test")
        "/rest/json_test_noa/"(controller:"Prorest", action:"json_test_noa")

        "/rest/productos_rest/"(controller:"Prorest", action:"productos_rest")
        "/rest/productos_rest_id/$id?"(controller:"Prorest", action:"productos_rest_id")


        "/"(view: "/index")
        "500"(view: '/error')

        //"/rest/api/$s?"(controller:"susy", action:"index")
        //"/rest/productos/$s?"(controller:"BusquedaProductos",action:"index")

    }
}
