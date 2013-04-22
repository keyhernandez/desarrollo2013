class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

                "/rest/productos/$s?"(controller:"BusquedaProductos",action:"index")
		"/"(view:"/index")
		"500"(view:'/error')
        
	}
}
