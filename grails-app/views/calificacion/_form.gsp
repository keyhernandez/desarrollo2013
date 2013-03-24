<%@ page import="grailsapplication2.Calificacion" %>



<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'comentario', 'error')} ">
	<label for="comentario">
		<g:message code="calificacion.comentario.label" default="Comentario" />
		
	</label>
	<g:textField name="comentario" value="${calificacionInstance?.comentario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'puntuacion', 'error')} required">
	<label for="puntuacion">
		<g:message code="calificacion.puntuacion.label" default="Puntuacion" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="puntuacion" type="number" value="${calificacionInstance.puntuacion}" required=""/>
</div>

