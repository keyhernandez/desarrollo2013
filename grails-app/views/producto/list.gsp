
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
    <h1>Productos</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
      <thead>
        <tr>

      <g:sortableColumn property="screenshot" title="${message(code: 'producto.screenshot.label', default: 'Screenshot')}" />

      <g:sortableColumn property="descripcion" title="${message(code: 'producto.descripcion.label', default: 'Descripcion')}" />

      <g:sortableColumn property="nombre" title="${message(code: 'producto.nombre.label', default: 'Nombre')}" />

      <g:sortableColumn property="precio" title="${message(code: 'producto.precio.label', default: 'Precio')}" />

      </tr>
      </thead>
      <tbody>
      <g:each in="${productoInstanceList}" status="i" var="productoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td>
        <g:link action="show" id="${productoInstance.id}">${fieldValue(bean: productoInstance, field: "id")}
          <img width="25%" height="10%" alt="Img" src="http://localhost:7070/GrailsApplication2/producto/showImage/${productoInstance.id}">
        </g:link>
      </td>

        <td>${fieldValue(bean: productoInstance, field: "descripcion")}</td>

        <td>${fieldValue(bean: productoInstance, field: "nombre")}</td>

        <td>${fieldValue(bean: productoInstance, field: "precio")}</td>

        </tr>
      </g:each>
      </tbody>
    </table>
    <div class="pagination">
      <g:paginate total="${productoInstanceTotal}" />
    </div>
  </div>
</body>
</html>
