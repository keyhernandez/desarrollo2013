package grailsapplication2

class IndexController {

    def index() {
     def view="index"
        withMobileDevice {
            view = "indexm"
        }

       render(view: view)
    }
    
    def indexm(){
        def view="index"
        withMobileDevice {
            view = "indexm"
        }

       render(view: view)
    }
    
    def menu(){
        render(view:"menu")
    }
    
    
}
