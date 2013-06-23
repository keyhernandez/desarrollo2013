
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
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
  <div data-role="header" data-position="fixed">
    <h1><g:message code="default.show.label" args="[entityName]" /></h1>
    <div data-role="navbar">
      <ul>
        <li><a data-icon="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link data-icon="back" data-ajax="false" action="categorias">Atras</g:link></li>
      </ul>
    </div>
  </div>
  <div data-role="content">
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <dl>


      <dd><g:fieldValue bean="${productoInstance}" field="nombre"/></dd>
      <dd><img src="${createLink(controller:'producto', action:'showImage', id:productoInstance?.id)}" width="100%" height="65%" float="left"/> </dd>

      <dt><g:message code="producto.categoria.label" default="Categoria" /></dt>

      <dd><g:fieldValue bean="${productoInstance}" field="categoria"/></dd>


      <dt><g:message code="producto.descripcion.label" default="Descripcion" /></dt>

      <dd><g:fieldValue bean="${productoInstance}" field="descripcion"/></dd>





      <dt><g:message code="producto.precio.label" default="Precio" /></dt>

      <dd><g:fieldValue bean="${productoInstance}" field="precio"/></dd>


    </dl>
    <g:form controller="Carrito">
      <g:hiddenField name="id" value="${productoInstance?.id}" />
      <g:hiddenField name="cantidad" value="1"/>
      <g:actionSubmit data-icon="check" action="agregarAlcarro" value="Agrega al carro" />
       
    </g:form>
  </div>
  <div data-role="footer">
  </div>
</body>
</html>
