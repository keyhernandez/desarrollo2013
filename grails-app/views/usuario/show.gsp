
<%@ page import="grailsapplication2.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-usuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list usuario">
			
				<g:if test="${usuarioInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="usuario.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${usuarioInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.cedula}">
				<li class="fieldcontain">
					<span id="cedula-label" class="property-label"><g:message code="usuario.cedula.label" default="Cedula" /></span>
					
						<span class="property-value" aria-labelledby="cedula-label"><g:fieldValue bean="${usuarioInstance}" field="cedula"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.ciudad}">
				<li class="fieldcontain">
					<span id="ciudad-label" class="property-label"><g:message code="usuario.ciudad.label" default="Ciudad" /></span>
					
						<span class="property-value" aria-labelledby="ciudad-label"><g:fieldValue bean="${usuarioInstance}" field="ciudad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.codpostal}">
				<li class="fieldcontain">
					<span id="codpostal-label" class="property-label"><g:message code="usuario.codpostal.label" default="Codpostal" /></span>
					
						<span class="property-value" aria-labelledby="codpostal-label"><g:fieldValue bean="${usuarioInstance}" field="codpostal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.compras}">
				<li class="fieldcontain">
					<span id="compras-label" class="property-label"><g:message code="usuario.compras.label" default="Compras" /></span>
					
						<g:each in="${usuarioInstance.compras}" var="c">
						<span class="property-value" aria-labelledby="compras-label"><g:link controller="compra" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.correo}">
				<li class="fieldcontain">
					<span id="correo-label" class="property-label"><g:message code="usuario.correo.label" default="Correo" /></span>
					
						<span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${usuarioInstance}" field="correo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.direccion}">
				<li class="fieldcontain">
					<span id="direccion-label" class="property-label"><g:message code="usuario.direccion.label" default="Direccion" /></span>
					
						<span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${usuarioInstance}" field="direccion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.fechaNac}">
				<li class="fieldcontain">
					<span id="fechaNac-label" class="property-label"><g:message code="usuario.fechaNac.label" default="Fecha Nac" /></span>
					
						<span class="property-value" aria-labelledby="fechaNac-label"><g:fieldValue bean="${usuarioInstance}" field="fechaNac"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.fechaRegistro}">
				<li class="fieldcontain">
					<span id="fechaRegistro-label" class="property-label"><g:message code="usuario.fechaRegistro.label" default="Fecha Registro" /></span>
					
						<span class="property-value" aria-labelledby="fechaRegistro-label"><g:fieldValue bean="${usuarioInstance}" field="fechaRegistro"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="usuario.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${usuarioInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usuarioInstance?.pais}">
				<li class="fieldcontain">
					<span id="pais-label" class="property-label"><g:message code="usuario.pais.label" default="Pais" /></span>
					
						<span class="property-value" aria-labelledby="pais-label"><g:fieldValue bean="${usuarioInstance}" field="pais"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${usuarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${usuarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
