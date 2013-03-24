<%@ page import="grailsapplication2.Compra" %>



<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'fechaCompra', 'error')} ">
	<label for="fechaCompra">
		<g:message code="compra.fechaCompra.label" default="Fecha Compra" />
		
	</label>
	<g:textField name="fechaCompra" value="${compraInstance?.fechaCompra}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'fechaEntrega', 'error')} ">
	<label for="fechaEntrega">
		<g:message code="compra.fechaEntrega.label" default="Fecha Entrega" />
		
	</label>
	<g:textField name="fechaEntrega" value="${compraInstance?.fechaEntrega}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'monto', 'error')} required">
	<label for="monto">
		<g:message code="compra.monto.label" default="Monto" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monto" value="${fieldValue(bean: compraInstance, field: 'monto')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'productos', 'error')} ">
	<label for="productos">
		<g:message code="compra.productos.label" default="Productos" />
		
	</label>
	<g:select name="productos" from="${grailsapplication2.Producto.list()}" multiple="multiple" optionKey="id" size="5" value="${compraInstance?.productos*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="compra.status.label" default="Status" />
		
	</label>
	<g:textField name="status" value="${compraInstance?.status}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'tarjeta', 'error')} required">
	<label for="tarjeta">
		<g:message code="compra.tarjeta.label" default="Tarjeta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tarjeta" name="tarjeta.id" from="${grailsapplication2.TDC.list()}" optionKey="id" required="" value="${compraInstance?.tarjeta?.id}" class="many-to-one"/>
</div>

