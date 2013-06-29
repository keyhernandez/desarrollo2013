class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

                "/rest/productos/$s?"(controller:"BusquedaProductos",action:"productos") {
            action = [GET:"show",PUT:"update",POST:"save"]
                }
                 "/rest/producto_id/$s?"(controller:"BusquedaProductos",action:"producto_id"){
            action = [GET:"show",PUT:"update",POST:"save"]
                }
                "/rest/categorias/$cat?/$s"(controller:"BusquedaProductos",action:"categorias"){
            action = [GET:"show",PUT:"update",POST:"save"]
                }
                 "/rest/nombre_producto/$cat?/$s"(controller:"BusquedaProductos",action:"nombre_producto"){
            action = [GET:"show",PUT:"update",POST:"save"]
                }
                
         "/rest/test/"(controller:"BusquedaProductos", action:"test")
        "/rest/consumirServicio/"(controller:"BusquedaProductos", action:"consumirServicio")

        // lectura del simulador
        "/rest/json_test/"(controller:"Prorest", action:"json_test")
        "/rest/productos_rest/"(controller:"Prorest", action:"productos_rest")
        "/rest/productos_rest_id/$id?"(controller:"Prorest", action:"productos_rest_id")

		"/"(view:"/index")
		"500"(view:'/error')
        "/"(controller:'index',action:'index')
        
	}
}
