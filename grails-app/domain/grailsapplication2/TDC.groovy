package grailsapplication2

class TDC {

    long numero;
    String marca;
    String fechaVence;
    
    static hasMany = [compras:Compra]
    static belongsTo = [usuario:Usuario]
    static constraints = {
    }
}
