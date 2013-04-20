
<%@ page import="grailsapplication2.Compra" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'compra.label', default: 'Compra')}" />
  <title>Ordenes</title>
</head>
<body>

  <div id="list-compra" class="content scaffold-list" role="main">
    <section id="content">
      <div class="dbox">
        <div class="list">	


          <h1>Mis órdenes</h1>
          <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
          </g:if>
          <table width=800px align="center">
            <thead>
              <tr>

            <g:sortableColumn property="id" title="${message(code: 'compra.fechaCompra.label', default: 'Nro. de Orden')}" />
            
            <g:sortableColumn property="fechaCompra" title="${message(code: 'compra.fechaCompra.label', default: 'Fecha Compra')}" />

            

            <g:sortableColumn property="monto" title="${message(code: 'compra.monto.label', default: 'Monto')}" />



            <g:sortableColumn property="status" title="${message(code: 'compra.status.label', default: 'Status')}" />

            <th><g:message code="compra.tarjeta.label" default="Tarjeta" /></th>
            
            <g:sortableColumn property="fechaEntrega" title="${message(code: 'compra.fechaEntrega.label', default: 'Fecha Entrega')}" />

            <g:sortableColumn property="factura" title="${message(code: 'compra.factura.label', default: 'Factura')}" />

            </tr>
            </thead>
            <tbody>
            <g:each in="${compraInstanceList}" status="i" var="compraInstance">
              <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                 <td width=100px align="center">#<g:link action="show" id="${compraInstance.id}">${fieldValue(bean: compraInstance, field: "id")}</g:link>#</td>
                <td align="center"><g:link action="show" id="${compraInstance.id}">${fieldValue(bean: compraInstance, field: "fechaCompra")}</g:link></td>

             

              <td align="center"> ${fieldValue(bean: compraInstance, field: "monto")}</td>


              <td align="center">${fieldValue(bean: compraInstance, field: "status")}</td>

              <td align="center">${fieldValue(bean: compraInstance, field: "tarjeta")}</td>
              
               <td align="center">${fieldValue(bean: compraInstance, field: "fechaEntrega")}</td>

              <td align="center"> <a href="${createLink(uri:'/compra/renderFactura/'+compraInstance?.id)}">Ver factura</a> </td>

              </tr>
            </g:each>
            </tbody>
            
          </table>
        </div>
      </div>
    </section>
          <div class="pagination">
            <g:paginate total="${compraInstanceTotal}" />
          </div>
        </div>
        </body>
        </html>
