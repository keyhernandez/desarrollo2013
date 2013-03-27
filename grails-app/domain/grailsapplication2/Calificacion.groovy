package grailsapplication2

class Calificacion {

   int puntuacion;
    String comentario;
    
    static belongsTo = [Producto, Usuario]
    static constraints = {
    }
}
