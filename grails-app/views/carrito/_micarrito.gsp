<%@ page import="grailsapplication2.Carrito" %>
<%@ page import="grailsapplication2.Producto" %>
<div class="list">

  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <table class="ajax">
    <thead>

      </tr>
    </thead>
    <tbody>


    <g:each in="${Producto.findAll("from Producto p where p.id in (select cast(producto_id as integer) from Carrito where compra_id= (select cast(max (id) as integer) from Compra where  proceso='carro'))")}" status="i" var="productoInstance" >

      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

        <td>
      <g:link action="show" id="${productoInstance.id}">
        <img width="50" height="50" alt="Img" src="http://localhost:7070/GrailsApplication2/producto/showImage/${productoInstance.id}">
      </g:link>
      </td>

      <td>${fieldValue(bean: productoInstance, field: "nombre")}</td>

      <td> <li><a href="${createLink(controller:'Carrito',action:'eliminarDelcarro', params:[idp:productoInstance.id])}">Eliminar</a></li></td>
      </tr>
    </g:each>
    
    
    </tbody>
   
    
  </table>
   <li><a href="">Terminar Compra</a></li>
</div>
