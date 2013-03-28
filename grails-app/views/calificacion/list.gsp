
<%@ page import="grailsapplication2.Calificacion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'calificacion.label', default: 'Calificacion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-calificacion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-calificacion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="comentario" title="${message(code: 'calificacion.comentario.label', default: 'Comentario')}" />
					
						<th><g:message code="calificacion.producto.label" default="Producto" /></th>
					
						<g:sortableColumn property="puntuacion" title="${message(code: 'calificacion.puntuacion.label', default: 'Puntuacion')}" />
					
						<th><g:message code="calificacion.usuario.label" default="Usuario" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${calificacionInstanceList}" status="i" var="calificacionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${calificacionInstance.id}">${fieldValue(bean: calificacionInstance, field: "comentario")}</g:link></td>
					
						<td>${fieldValue(bean: calificacionInstance, field: "producto")}</td>
					
						<td>${fieldValue(bean: calificacionInstance, field: "puntuacion")}</td>
					
						<td>${fieldValue(bean: calificacionInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${calificacionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
