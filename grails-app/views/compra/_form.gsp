<%@ page import="grailsapplication2.Compra" %>








<div class="fieldcontain ${hasErrors(bean: compraInstance, field: 'tarjeta', 'error')} required">
	<label for="tarjeta">
		<g:message code="compra.tarjeta.label" default="Tarjeta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tarjeta" name="tarjeta.id" from="${grailsapplication2.TDC.list()}" optionKey="id" required="" value="${compraInstance?.tarjeta?.id}" class="many-to-one"/>
</div>



