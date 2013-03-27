package grailsapplication2

class Usuario {

    String nombre;
    String apellido;
    String cedula;
    String correo;
    String pais;
    String ciudad;
    String codpostal;
    String direccion;
    String fechaNac;
    String fechaRegistro;
    String token;

    static hasMany=[compras:Compra]
    
    static constraints = {
        compras(nullable:true,blank:true)
        token (nullable:true,blank:true,maxSize: 100) 
        nombre(nullable:false,blank:false)
        apellido(nullable:false,blank:false)
        cedula(nullable:false,blank:false)
        correo (nullable:false,blank:false,email:true,unique:true)
        pais (nullable:false,blank:false)
        ciudad (nullable:false,blank:false)
        codpostal (nullable:false,blank:false)
        direccion (nullable:false,blank:false)
        fechaNac (nullable:false,blank:false)
    }
}
