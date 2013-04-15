
<%@ page import="grailsapplication2.Compra" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
  <title>Compra</title>
</head>
<body>

  

          <div id="show-compra" class="content scaffold-show" role="main">



            <ol class="property-list compra">

              <section id="content">
    <div class="col3">
      <div class="dbox">
        <div class="head">Compra</div>

        <ul>
              <g:if test="${compraInstance?.fechaCompra}">
                <li class="fieldcontain">
                  <span id="fechaCompra-label" class="property-label"><g:message code="compra.fechaCompra.label" default="Fecha de Compra" /></span>

                  <span class="property-value" aria-labelledby="fechaCompra-label"><g:fieldValue bean="${compraInstance}" field="fechaCompra"/></span>

                </li>
              </g:if>

              <g:if test="${compraInstance?.fechaEntrega}">
                <li class="fieldcontain">
                  <span id="fechaEntrega-label" class="property-label"><g:message code="compra.fechaEntrega.label" default="Fecha Entrega" /></span>

                  <span class="property-value" aria-labelledby="fechaEntrega-label"><g:fieldValue bean="${compraInstance}" field="fechaEntrega"/></span>

                </li>
              </g:if>

              <g:if test="${compraInstance?.monto}">
                <li class="fieldcontain">
                  <span id="monto-label" class="property-label"><g:message code="compra.monto.label" default="Monto" /></span>

                  <span class="property-value" aria-labelledby="monto-label">Bs. <g:fieldValue bean="${compraInstance}" field="monto"/></span>

                </li>
              </g:if>



              <g:if test="${compraInstance?.status}">
                <li class="fieldcontain">
                  <span id="status-label" class="property-label"><g:message code="compra.status.label" default="Status" /></span>

                  <span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${compraInstance}" field="status"/></span>

                </li>
              </g:if>

              <g:if test="${compraInstance?.tarjeta}">
                <li class="fieldcontain">
                  <span id="tarjeta-label" class="property-label"><g:message code="compra.tarjeta.label" default="Tarjeta" /></span>

                  <span class="property-value" aria-labelledby="tarjeta-label"><g:link controller="TDC" action="show" id="${compraInstance?.tarjeta?.id}">${compraInstance?.tarjeta?.encodeAsHTML()}</g:link></span>

                </li>
              </g:if>



            </ol>

        </ul>
      </div>
           <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${compraInstance?.id}" />
        <g:link class="edit" action="edit" id="${compraInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
    </div>


   
  </div>
</body>
</html>
