package grailsapplication2

class Calificacion {

   int puntuacion;
    String comentario;
    
    static belongsTo = Producto
    static constraints = {
    }
}
