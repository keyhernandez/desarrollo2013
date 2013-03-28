<%@ page import="grailsapplication2.Calificacion" %>



<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'comentario', 'error')} ">
	<label for="comentario">
		<g:message code="calificacion.comentario.label" default="Comentario" />
		
	</label>
	<g:textField name="comentario" value="${calificacionInstance?.comentario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="calificacion.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="producto" name="producto.id" from="${grailsapplication2.Producto.list()}" optionKey="id" required="" value="${calificacionInstance?.producto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'puntuacion', 'error')} required">
	<label for="puntuacion">
		<g:message code="calificacion.puntuacion.label" default="Puntuacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="puntuacion" type="number" value="${calificacionInstance.puntuacion}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="calificacion.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${grailsapplication2.Usuario.list()}" optionKey="id" required="" value="${calificacionInstance?.usuario?.id}" class="many-to-one"/>
</div>

