package grailsapplication2

class Calificacion {

   int puntuacion;
    String comentario;
    
    static belongsTo = [producto:Producto, usuario:Usuario]
    static constraints = {
    }
}
