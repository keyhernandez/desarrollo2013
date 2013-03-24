<%@ page import="grailsapplication2.TDC" %>



<div class="fieldcontain ${hasErrors(bean: TDCInstance, field: 'compras', 'error')} ">
	<label for="compras">
		<g:message code="TDC.compras.label" default="Compras" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${TDCInstance?.compras?}" var="c">
    <li><g:link controller="compra" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="compra" action="create" params="['TDC.id': TDCInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'compra.label', default: 'Compra')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: TDCInstance, field: 'fechaVence', 'error')} ">
	<label for="fechaVence">
		<g:message code="TDC.fechaVence.label" default="Fecha Vence" />
		
	</label>
	<g:textField name="fechaVence" value="${TDCInstance?.fechaVence}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: TDCInstance, field: 'marca', 'error')} ">
	<label for="marca">
		<g:message code="TDC.marca.label" default="Marca" />
		
	</label>
	<g:textField name="marca" value="${TDCInstance?.marca}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: TDCInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="TDC.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${TDCInstance.numero}" required=""/>
</div>

