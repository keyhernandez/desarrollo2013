<%@ page import="grailsapplication2.Carrito" %>



<div class="fieldcontain ${hasErrors(bean: carritoInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="carrito.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidad" type="number" value="${carritoInstance.cantidad}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: carritoInstance, field: 'compra', 'error')} required">
	<label for="compra">
		<g:message code="carrito.compra.label" default="Compra" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="compra" name="compra.id" from="${grailsapplication2.Compra.list()}" optionKey="id" required="" value="${carritoInstance?.compra?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carritoInstance, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="carrito.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${grailsapplication2.Producto.list()}" optionKey="id" required="" value="${carritoInstance?.producto?.id}" class="many-to-one"/>
</div>

