<%@ page import="grailsapplication2.Usuario" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

<section id="content"><!-- Define the content #2 section    <g:form name="carro" url="[action:'micarrito',controller:'Carrito']">  </g:form> -->
    <div class="col3">
      <div class="dbox">
        <div class="head">Registro</div>

        <div id="create-usuario" class="content scaffold-create" role="main">
          
         
          <g:hasErrors bean="${usuarioInstance}">
            <ul class="errors" role="alert">
              <g:eachError bean="${usuarioInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
              </g:eachError>
            </ul>
          </g:hasErrors>

          <g:form action="save" class="simpleform" >
            <fieldset class="form">
            
              <g:render template="form"/>
         
            </fieldset>
            <fieldset class="buttons">
              <g:submitButton name="create" class="save" value="Continuar" />
            </fieldset>
          </g:form>
          
        </div>
      </div>
    </div>
</div>
  </section>
        </body>
        </html>
