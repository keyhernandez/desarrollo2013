<%@ page import="grailsapplication2.TDC" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'TDC.label', default: 'TDC')}" />
  <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>

  <div id="create-TDC" class="content scaffold-create" role="main">

<section id="content"><!-- Define the content #2 section    <g:form name="carro" url="[action:'micarrito',controller:'Carrito']">  </g:form> -->
      <div class="col3">
        <div class="dbox">
          <div class="head">TDC</div>
          <div class="tags">
            <ul>


              <g:hasErrors bean="${TDCInstance}">
                <ul class="errors" role="alert">
                  <g:eachError bean="${TDCInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                  </g:eachError>
                </ul>
              </g:hasErrors>
              <g:form action="save" >
               
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
