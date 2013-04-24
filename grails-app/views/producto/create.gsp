<%@ page import="grailsapplication2.Producto" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

  <div id="create-producto" class="content scaffold-create" role="main">

      <section id="content"><!-- Define the content #2 section    <g:form name="carro" url="[action:'micarrito',controller:'Carrito']">  </g:form> -->
      <div class="col3">
        <div class="dbox">
          <div class="head">TDC</div>
          <div class="tags">
            <ul>

              <g:hasErrors bean="${productoInstance}">
                <ul class="errors" role="alert">
                  <g:eachError bean="${productoInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                  </g:eachError>
                </ul>
              </g:hasErrors>
              <g:form action="save"  enctype="multipart/form-data">

                <g:render template="form"/>

                <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />

              </g:form>
            </ul> 
          </div> 
        </div>
      </div>
    </section>
  </div>
</body>
</html>
