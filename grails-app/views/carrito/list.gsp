
<%@ page import="grailsapplication2.Carrito" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carrito.label', default: 'Carrito')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-carrito" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-carrito" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="cantidad" title="${message(code: 'carrito.cantidad.label', default: 'Cantidad')}" />
					
						<th><g:message code="carrito.compra.label" default="Compra" /></th>
					
						<th><g:message code="carrito.producto.label" default="Producto" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carritoInstanceList}" status="i" var="carritoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carritoInstance.id}">${fieldValue(bean: carritoInstance, field: "cantidad")}</g:link></td>
					
						<td>${fieldValue(bean: carritoInstance, field: "compra")}</td>
					
						<td>${fieldValue(bean: carritoInstance, field: "producto")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carritoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
