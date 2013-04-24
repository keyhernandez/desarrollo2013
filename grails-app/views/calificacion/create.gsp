<%@ page import="grailsapplication2.Calificacion" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'calificacion.label', default: 'Calificacion')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

  <div id="create-calificacion" class="content scaffold-create" role="main">
     <section id="content">
      <div class="dbox">
        <div class="list">
    <h1>Calificar Producto</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:form action="save" params="${[idp:params.producto]}">
      <a href="#">
        <img width="100" height="100" alt="Img" src="http://localhost:7070/GrailsApplication2/producto/showImage/${params.producto}" />
      </a>
      <fieldset class="form">
        <g:render template="form"/>
      </fieldset>
      <fieldset class="buttons">
        <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
      </fieldset>
    </g:form>
        </div>
      </div>
     </section>
  </div>
</body>
</html>
