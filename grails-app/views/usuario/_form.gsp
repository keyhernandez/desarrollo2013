<%@ page import="grailsapplication2.Usuario" %>





<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${usuarioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} required">
	<label for="apellido">
		<g:message code="usuario.apellido.label" default="Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="" value="${usuarioInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required">
	<label for="cedula">
		<g:message code="usuario.cedula.label" default="Cedula" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cedula" required="" value="${usuarioInstance?.cedula}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'correo', 'error')} required">
	<label for="correo">
		<g:message code="usuario.correo.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="correo" required="" value="${usuarioInstance?.correo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'pais', 'error')} required">
	<label for="pais">
		<g:message code="usuario.pais.label" default="Pais" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="pais" required="" value="${usuarioInstance?.pais}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'ciudad', 'error')} required">
	<label for="ciudad">
		<g:message code="usuario.ciudad.label" default="Ciudad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ciudad" required="" value="${usuarioInstance?.ciudad}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'codpostal', 'error')} required">
	<label for="codpostal">
		<g:message code="usuario.codpostal.label" default="Codpostal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="codpostal" required="" value="${usuarioInstance?.codpostal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'direccion', 'error')} required">
	<label for="direccion">
		<g:message code="usuario.direccion.label" default="Direccion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="direccion" required="" value="${usuarioInstance?.direccion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'fechaNac', 'error')} required">
	<label for="fechaNac">
		<g:message code="usuario.fechaNac.label" default="Fecha Nac" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fechaNac" required="" value="${usuarioInstance?.fechaNac}"/>
</div>


