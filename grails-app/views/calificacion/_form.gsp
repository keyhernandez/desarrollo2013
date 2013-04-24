<%@ page import="grailsapplication2.Calificacion" %>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'puntuacion', 'error')} required">
	<label for="puntuacion">
		<g:message code="calificacion.puntuacion.label" default="Puntuacion" />
		<span class="required-indicator">*</span>
	</label>
  <g:select id="calificacion" name="puntuacion" from="${1..5}"  required="" value="${calificacionInstance?.puntuacion}" />

	
</div>

<div class="fieldcontain ${hasErrors(bean: calificacionInstance, field: 'comentario', 'error')} ">
	<label for="comentario">
		<g:message code="calificacion.comentario.label" default="Comentario" />
		
	</label>
	<g:textField name="comentario" value="${calificacionInstance?.comentario}"/>
</div>






