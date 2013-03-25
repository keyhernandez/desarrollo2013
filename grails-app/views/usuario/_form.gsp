<%@ page import="grailsapplication2.Usuario" %>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} ">
  <label for="nombre">
    <g:message code="usuario.nombre.label" default="Nombre" />

  </label>
  <g:textField name="nombre" value="${usuarioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} ">
  <label for="apellido">
    <g:message code="usuario.apellido.label" default="Apellido" />

  </label>
  <g:textField name="apellido" value="${usuarioInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} ">
  <label for="cedula">
    <g:message code="usuario.cedula.label" default="Cedula" />

  </label>
  <g:textField name="cedula" value="${usuarioInstance?.cedula}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'fechaNac', 'error')} ">
  <label for="fechaNac">
    Fecha de Nacimiento

  </label>
  <g:textField name="fechaNac" value="${usuarioInstance?.fechaNac}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'pais', 'error')} ">
  <label for="pais">
    <g:message code="usuario.pais.label" default="Pais" />

  </label>
  <g:textField name="pais" value="${usuarioInstance?.pais}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'ciudad', 'error')} ">
  <label for="ciudad">
    <g:message code="usuario.ciudad.label" default="Ciudad" />

  </label>
  <g:textField name="ciudad" value="${usuarioInstance?.ciudad}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'codpostal', 'error')} ">
  <label for="codpostal">
    Codigo postal

  </label>
  <g:textField name="codpostal" value="${usuarioInstance?.codpostal}"/>
</div>
<!--
<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'compras', 'error')} ">
        <label for="compras">
<g:message code="usuario.compras.label" default="Compras" />
                
        </label>
<g:select name="compras" from="${grailsapplication2.Compra.list()}" multiple="multiple" optionKey="id" size="5" value="${usuarioInstance?.compras*.id}" class="many-to-many"/>
</div>

-->

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'direccion', 'error')} ">
  <label for="direccion">
    <g:message code="usuario.direccion.label" default="Direccion" />

  </label>
  <g:textField name="direccion" value="${usuarioInstance?.direccion}"/>
</div>


<!--<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'fechaRegistro', 'error')} ">
        <label for="fechaRegistro">
<g:message code="usuario.fechaRegistro.label" default="Fecha Registro" />
                
        </label>
<g:textField name="fechaRegistro" value="${usuarioInstance?.fechaRegistro}"/>
</div>
-->




<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'correo', 'error')} ">
  <label for="correo">
    <g:message code="usuario.correo.label" default="Correo" />

  </label>
  <g:textField name="correo" value="${usuarioInstance?.correo}"/>
</div>