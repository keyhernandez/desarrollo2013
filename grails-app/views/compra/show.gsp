
<%@ page import="grailsapplication2.Compra" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-compra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-compra" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list compra">
			
				<g:if test="${compraInstance?.fechaCompra}">
				<li class="fieldcontain">
					<span id="fechaCompra-label" class="property-label"><g:message code="compra.fechaCompra.label" default="Fecha Compra" /></span>
					
						<span class="property-value" aria-labelledby="fechaCompra-label"><g:fieldValue bean="${compraInstance}" field="fechaCompra"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compraInstance?.fechaEntrega}">
				<li class="fieldcontain">
					<span id="fechaEntrega-label" class="property-label"><g:message code="compra.fechaEntrega.label" default="Fecha Entrega" /></span>
					
						<span class="property-value" aria-labelledby="fechaEntrega-label"><g:fieldValue bean="${compraInstance}" field="fechaEntrega"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compraInstance?.monto}">
				<li class="fieldcontain">
					<span id="monto-label" class="property-label"><g:message code="compra.monto.label" default="Monto" /></span>
					
						<span class="property-value" aria-labelledby="monto-label"><g:fieldValue bean="${compraInstance}" field="monto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compraInstance?.productos}">
				<li class="fieldcontain">
					<span id="productos-label" class="property-label"><g:message code="compra.productos.label" default="Productos" /></span>
					
						<g:each in="${compraInstance.productos}" var="p">
						<span class="property-value" aria-labelledby="productos-label"><g:link controller="producto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${compraInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="compra.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${compraInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${compraInstance?.tarjeta}">
				<li class="fieldcontain">
					<span id="tarjeta-label" class="property-label"><g:message code="compra.tarjeta.label" default="Tarjeta" /></span>
					
						<span class="property-value" aria-labelledby="tarjeta-label"><g:link controller="TDC" action="show" id="${compraInstance?.tarjeta?.id}">${compraInstance?.tarjeta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${compraInstance?.id}" />
					<g:link class="edit" action="edit" id="${compraInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
