
<%@ page import="grailsapplication2.Calificacion" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'calificacion.label', default: 'Calificacion')}" />
  <title>Calificaciones</title>
</head>
<body>
  
  <div id="list-calificacion" class="content scaffold-list" role="main">
    
    <section id="content">
      <div class="dbox">
        <div class="list">
    <h1>Productos por calificar</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">"Calificacion exitosa"</div>
    </g:if>
    <table>
      <thead>
      
      </thead>
      <tbody>
      <g:each in="${productoInstanceList}" status="i" var="productoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td width=150px align="center">
        <g:link action="create" params="${[producto:productoInstance.id]}">
          <img width="100" height="100" alt="Img" src="http://localhost:7070/GrailsApplication2/producto/showImage/${productoInstance.id}">
        </g:link>
        </td>

        <td>${fieldValue(bean: productoInstance, field: "nombre")}</td>
        <td>${fieldValue(bean: productoInstance, field: "descripcion")}</td>





        </tr>




      </g:each>
      </tbody>
    </table>
        </div>
      </div>
    </section>
    <div class="pagination">
      <g:paginate total="${productoInstanceTotal}" />
    </div>
  </div>
</body>
</html>
