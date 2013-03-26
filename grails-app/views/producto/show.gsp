
<%@ page import="grailsapplication2.Producto" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
  <title>${productoInstance?.nombre}</title>
</head>
<body>

  <div class="nav" role="navigation">
    <ul>

      <li><g:link class="list" action="list">Todos los items</g:link></li>

    </ul>
  </div>
  <div id="show-producto" class="content scaffold-show" role="main">
    <h1>${productoInstance?.nombre}</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list producto">

      <g:if test="${productoInstance?.screenshot}">
        <div>

          <img width="30%" height="30%" alt="Img" src="http://localhost:7070/GrailsApplication2/producto/showImage/${productoInstance?.id}">
        </div>
      </g:if>

      <g:if test="${productoInstance?.calificaciones}">
        <div>
          <span id="calificaciones-label" class="property-label"><g:message code="producto.calificaciones.label" default="Calificaciones" /></span>

          <g:each in="${productoInstance.calificaciones}" var="c">
            <span class="property-value" aria-labelledby="calificaciones-label"><g:link controller="calificacion" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
          </g:each>

        </div>
      </g:if>

      <g:if test="${productoInstance?.descripcion}">
        <div>


          <span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${productoInstance}" field="descripcion"/></span>

        </div>
      </g:if>


      <g:if test="${productoInstance?.precio}">
        <div>
          <span id="precio-label" class="property-label"><g:message code="producto.precio.label" default="Precio" /></span>

          <span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${productoInstance}" field="precio"/> Bs.</span>

        </div>
      </g:if>

      <a href="https://twitter.com/share" class="twitter-share-button" data-lang="es" data-hashtags="RetroShop">Twittear</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id))
        {js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}
      (document,"script","twitter-wjs");
      </script>

      

    </ol>

  </div>
</body>
</html>
