
<%@ page import="grailsapplication2.Carrito" %>
<%@ page import="grailsapplication2.Carrito" %>
<div class="list">

  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
  <table class="ajax">
    <thead>
      <tr>

    <g:sortableColumn property="screenshot" title="${message(code: 'producto.screenshot.label', default: 'Screenshot')}" />


    <g:sortableColumn property="nombre" title="${message(code: 'producto.nombre.label', default: 'Nombre')}" />

    <g:sortableColumn property="precio" title="${message(code: 'producto.precio.label', default: 'Precio')}" />

    </tr>
    </thead>
    <tbody>
    
   
      
    <g:each in="${Carrito.micarrito()" var="productoInstance">    
      
       
      
    </g:each>
    </tbody>
  </table>
</div>