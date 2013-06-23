
<%@ page import="grailsapplication2.Producto" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="mobile">
    <meta name="viewport" content="width=device-width,user-scalable=no" />
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.js"></script>
  <g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
  <div data-role="header" data-position="fixed">
    <h1>Productos</h1>
    <div data-role="navbar">
      <ul>
        <li><a data-icon="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link data-icon="back" action="menucategorias">Atras</g:link></li>
      </ul>
    </div>
  </div>
  <div data-role="content">
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <ul data-role="listview" data-split-icon="gear" data-filter="true">
      <g:each in="${productoInstanceList}" status="i" var="productoInstance">
        <li>
       
        <img src="${createLink(controller:'producto', action:'showImage', id:productoInstance.id)}" width="50px" height="30px" float="left"/>                             
        <g:link action="showm" id="${productoInstance.id}">${productoInstance}</g:link>
          
        </li>
      </g:each>
      </ol>
      <fieldset class="pagination">
        <g:paginate total="${productoInstanceTotal}" />
      </fieldset>
  </div>
  <div data-role="footer">
  </div>
</body>
</html>
