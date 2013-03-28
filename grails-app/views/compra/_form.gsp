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

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'proceso', 'error')} ">
	<label for="proceso">
		<g:message code="compra.proceso.label" default="Proceso" />
		
	</label>
	<g:textField name="proceso" value="${compraInstance?.proceso}"/>
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

<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="compra.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${grailsapplication2.Usuario.list()}" optionKey="id" required="" value="${compraInstance?.usuario?.id}" class="many-to-one"/>
</div>

