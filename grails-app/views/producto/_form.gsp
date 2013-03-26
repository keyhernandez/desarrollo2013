<%@ page import="grailsapplication2.Producto" %>



<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'screenshot', 'error')} required">
	<label for="screenshot">
		<g:message code="producto.screenshot.label" default="Screenshot" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="screenshot" name="screenshot" />
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'calificaciones', 'error')} ">
	<label for="calificaciones">
		<g:message code="producto.calificaciones.label" default="Calificaciones" />
		
	</label>
	<g:select name="calificaciones" from="${grailsapplication2.Calificacion.list()}" multiple="multiple" optionKey="id" size="5" value="${productoInstance?.calificaciones*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="producto.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${productoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'categoria', 'error')} ">
	<label for="categoria">
		<g:message code="producto.categoria.label" default="Categoria" />
		
	</label>
	<g:textField name="categoria" value="${productoInstance?.categoria}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="producto.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${productoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'precio', 'error')} required">
	<label for="precio">
		<g:message code="producto.precio.label" default="Precio" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precio" value="${fieldValue(bean: productoInstance, field: 'precio')}" required=""/>
</div>

