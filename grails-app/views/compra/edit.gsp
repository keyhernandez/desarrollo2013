<%@ page import="grailsapplication2.Compra" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
  <title>Comprar</title>
</head>
<body>

  <div id="edit-compra" class="content scaffold-edit" role="main">

    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${compraInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${compraInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>
    <g:form method="post" > 
      <section id="content" align="center" >
        <div class="col2" >
          <div class="dbox">
            <div class="head">Pago</div> 
       <div class="tags"> Monto Total Bs.
         
      <g:hiddenField name="id" value="${compraInstance?.id}" />
      <g:hiddenField name="version" value="${compraInstance?.version}" />
      <g:hiddenField name="proceso" value="compra" />
      <g:hiddenField name="fechaCompra" value="${new Date().format("dd/MM/yyyy")}"/>
      <g:hiddenField name="status" value="En Proceso" />
      <g:field name="monto" value="${compraInstance.getMonto(compraInstance?.id)}" readonly="readonly">Monto Total Bs.</g:field>
       <g:render template="form"/>
      
            
                <g:actionSubmit class="save" action="update" value="Aceptar" />
           
               </div>
          </div>
        </div>
      </section>
              </g:form>
            </div>
            </body>
            </html>
