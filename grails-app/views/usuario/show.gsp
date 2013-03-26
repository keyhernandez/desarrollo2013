
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
    <h1 align="center">Perfil</h1>

    <table align="center">

      <tr>
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <ol class="property-list usuario">
        </tr>
        <tr>
        <g:if test="${usuarioInstance?.nombre}">

          <td> <span id="nombre-label" class="property-label"><g:message code="usuario.nombre.label" default="Nombre" /></span>
          </td>
          <td <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${usuarioInstance}" field="nombre"/></span>
          </td>

        </g:if>
        </tr>

        <tr>
        <g:if test="${usuarioInstance?.apellido}">
          <td>
            <span id="apellido-label" class="property-label"><g:message code="usuario.apellido.label" default="Apellido" /></span>
          </td>
          <td> <span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${usuarioInstance}" field="apellido"/></span>
          </td>

        </g:if>
        </tr>

        <tr>
        <g:if test="${usuarioInstance?.cedula}">

          <td>  <span id="cedula-label" class="property-label"><g:message code="usuario.cedula.label" default="Cedula" /></span>
          </td>
          <td>
            <span class="property-value" aria-labelledby="cedula-label"><g:fieldValue bean="${usuarioInstance}" field="cedula"/></span>
          </td>

        </g:if>
        </tr>

        <tr>
        <g:if test="${usuarioInstance?.fechaNac}">
          <td>
            <span id="fechaNac-label" class="property-label"><g:message code="usuario.fechaNac.label" default="Fecha Nac" /></span>
          </td>
          <td> <span class="property-value" aria-labelledby="fechaNac-label"><g:fieldValue bean="${usuarioInstance}" field="fechaNac"/></span>
          </td>

        </g:if>
        </tr>
        <tr>
        <g:if test="${usuarioInstance?.pais}">

          <td><span id="pais-label" class="property-label"><g:message code="usuario.pais.label" default="Pais" /></span>
          </td>
          <td>  <span class="property-value" aria-labelledby="pais-label"><g:fieldValue bean="${usuarioInstance}" field="pais"/></span>
          </td>
        </g:if>
        </tr>
        <tr>
        <g:if test="${usuarioInstance?.ciudad}">

           <td><span id="ciudad-label" class="property-label"><g:message code="usuario.ciudad.label" default="Ciudad" /></span>
 </td>
           <td><span class="property-value" aria-labelledby="ciudad-label"><g:fieldValue bean="${usuarioInstance}" field="ciudad"/></span>
 </td>

        </g:if>
        </tr> 
        <tr>
        <g:if test="${usuarioInstance?.codpostal}">

           <td><span id="codpostal-label" class="property-label"><g:message code="usuario.codpostal.label" default="Codpostal" /></span>
</td>
           <td><span class="property-value" aria-labelledby="codpostal-label"><g:fieldValue bean="${usuarioInstance}" field="codpostal"/></span>
</td>

        </g:if>
        </tr>
        <tr>
        <g:if test="${usuarioInstance?.direccion}">

           <td><span id="direccion-label" class="property-label"><g:message code="usuario.direccion.label" default="Direccion" /></span>
</td>
           <td><span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${usuarioInstance}" field="direccion"/></span>
</td>

        </g:if>
        </tr>
        <tr>
        <g:if test="${usuarioInstance?.correo}">

           <td><span id="correo-label" class="property-label"><g:message code="usuario.correo.label" default="Correo" /></span>
</td>
           <td><span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${usuarioInstance}" field="correo"/></span>
</td>

        </g:if>
        </tr>
        <tr>
        <g:if test="${usuarioInstance?.compras}">

           <td><span id="compras-label" class="property-label"><g:message code="usuario.compras.label" default="Compras" /></span>
</td>
          <g:each in="${usuarioInstance.compras}" var="c">
             <td><span class="property-value" aria-labelledby="compras-label"><g:link controller="compra" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
           </td>
          </g:each>


        </g:if>
        </tr>

        <tr> <td>
  <g:form>
    <fieldset class="buttons">
      <g:hiddenField name="id" value="${usuarioInstance?.id}" />
      <g:link class="edit" action="edit" id="${usuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
     
    </fieldset>
  </g:form> </td></tr>
        </table>
</div>
</body>
</html>
