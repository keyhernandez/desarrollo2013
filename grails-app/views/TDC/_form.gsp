<%@ page import="grailsapplication2.TDC" %>





<div class="fieldcontain ${hasErrors(bean: TDCInstance, field: 'marca', 'error')} ">
	<label for="marca">
		Vendor
		
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

<div class="fieldcontain ${hasErrors(bean: TDCInstance, field: 'fechaVence', 'error')} ">
	<label for="fechaVence">
		Fecha de Vencimiento
		
	</label>
	<g:textField name="fechaVence" value="${TDCInstance?.fechaVence}"/>
</div>






