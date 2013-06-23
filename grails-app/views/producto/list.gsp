
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
    <section id="content">
      <div class="dbox">
        <div class="list">
    <h1>Productos</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table >
      <thead>
        <tr>

      <g:sortableColumn property="screenshot" title="Screenshot" />

      
      <g:sortableColumn property="nombre" title="${message(code: 'producto.nombre.label', default: 'Nombre')}" />
      
      <g:sortableColumn property="descripcion" title="${message(code: 'producto.descripcion.label', default: 'Descripcion')}" />


      <g:sortableColumn property="precio" title="${message(code: 'producto.precio.label', default: 'Precio')}" />

      </tr>
      </thead>
      <tbody>
      <g:each in="${productoInstanceList}" status="i" var="productoInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td width=150px align="center">
        <g:link action="show" id="${productoInstance.id}">
          <img width="100" height="100" alt="Img" src="${createLink(controller:'producto', action:'showImage', id:productoInstance?.id)}">
        </g:link>
      </td>

             <td>${fieldValue(bean: productoInstance, field: "nombre")}</td>
        <td>${fieldValue(bean: productoInstance, field: "descripcion")}</td>

 

        <td>${fieldValue(bean: productoInstance, field: "precio")}</td>

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
