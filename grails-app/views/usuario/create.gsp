<%@ page import="grailsapplication2.Usuario" %>

<g:applyLayout name="main">
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
	<head>
		<meta name="layout" content="main">
		
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
        <center>
		
		
		<div id="create-usuario" class="content scaffold-create" role="main">
			<h1> Registrarse </h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${usuarioInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${usuarioInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Continuar" />
				</fieldset>
			</g:form>
		</div>
	</center>
        </body>
</g:applyLayout>
