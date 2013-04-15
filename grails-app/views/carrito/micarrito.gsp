<%@ page import="grailsapplication2.Carrito" %>
<%@ page import="grailsapplication2.Producto" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
  <title>Productos</title>
</head>
<body>
  
  
  <div id="list-producto" class="content scaffold-list" role="main">
    <div id="show-producto" class="content scaffold-show" role="main">
        
    <section id="content"><!-- Define the content #2 section    <g:form name="carro" url="[action:'micarrito',controller:'Carrito']">  </g:form> -->
      <div class="col3">
        <div class="dbox">
          <div class="head">Carrito</div>
          <div class="tags">
            <ul>
              
              <!--<g:render template="/carrito/micarrito"/> -->
              
              
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

      <td> <li><a href="${createLink(controller:'Carrito',action:'eliminarDelcarro', params:[idp:productoInstance.id,op:'x'])}">Eliminar</a></li></td>
      </tr>
    </g:each>
    
    
    </tbody>
   
    
  </table>
   <li><a href="${createLink(controller:'Compra',action:'edit',id:19)}">Finalizar</a></li>
       
            </ul>
          </div>
        </div>
      </div>
    </div>
      
  </div>
    
    
 
</body>
</html>
