
<%@ page import="grailsapplication2.Usuario" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

  <section id="content">
 <div class="col3">
      <div class="dbox">
        <div class="head">Revisa tu correo</div>
    <ol class="property-list usuario">




      <h3>
Bienvenid@ ${usuarioInstance?.nombre}!,
        Revisa tu correo para activar tu cuenta
      </h3>

    </ol>
    <g:form>

    </g:form>
      </div> </div>
  </section>
</body>
</html>

