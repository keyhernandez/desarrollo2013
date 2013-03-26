
<%@ page import="grailsapplication2.Usuario" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>


  <div id="show-usuario" class="content scaffold-show" role="main">
    <h1> Activa tu cuenta </h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list usuario">




      <h3>
Bienvenid@ ${usuarioInstance?.nombre}!,
        Revisa tu correo para activar tu cuenta
      </h3>

    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${usuarioInstance?.id}" />

        <g:form>

          <g:actionSubmit value="Continuar" action="${createLink(uri: '/')}" /> 
        </g:form> 
      </fieldset>
    </g:form>
  </div>
</body>
</html>

