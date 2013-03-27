<%@ page import="grailsapplication2.Usuario" %>

<g:applyLayout name="main">
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
        <center>	
          <a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="apellido" title="${message(code: 'usuario.apellido.label', default: 'Apellido')}" />
					
						<g:sortableColumn property="cedula" title="${message(code: 'usuario.cedula.label', default: 'Cedula')}" />
					
						<g:sortableColumn property="ciudad" title="${message(code: 'usuario.ciudad.label', default: 'Ciudad')}" />
					
						<g:sortableColumn property="codpostal" title="${message(code: 'usuario.codpostal.label', default: 'Codpostal')}" />
					
						<g:sortableColumn property="correo" title="${message(code: 'usuario.correo.label', default: 'Correo')}" />
					
						<g:sortableColumn property="direccion" title="${message(code: 'usuario.direccion.label', default: 'Direccion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "apellido")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "cedula")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "ciudad")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "codpostal")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "correo")}</td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "direccion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceTotal}" />
			</div>
		</div>
        </center>
        </body>
</g:applyLayout>