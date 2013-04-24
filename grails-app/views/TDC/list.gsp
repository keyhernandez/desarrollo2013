
<%@ page import="grailsapplication2.TDC" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'TDC.label', default: 'TDC')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>

  <div id="list-TDC" class="content scaffold-list" role="main">
   
    <section id="content"><!-- Define the content #2 section    <g:form name="carro" url="[action:'micarrito',controller:'Carrito']">  </g:form> -->
      <div class="col3">
        <div class="dbox">
          <div class="head">Tarjetas</div>
          <div class="tags">
            <ul>
    
    <table>
      <thead>
        <tr>

      <g:sortableColumn property="fechaVence" title="${message(code: 'TDC.fechaVence.label', default: 'Fecha Vencimiento')}" />

      <g:sortableColumn property="marca" title="${message(code: 'TDC.marca.label', default: 'Marca')}" />

      <g:sortableColumn property="numero" title="${message(code: 'TDC.numero.label', default: 'Numero')}" />



      </tr>
      </thead>
      <tbody>
      <g:each in="${TDCInstanceList}" status="i" var="TDCInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

          <td><g:link action="show" id="${TDCInstance.id}">${fieldValue(bean: TDCInstance, field: "fechaVence")}</g:link></td>

        <td>${fieldValue(bean: TDCInstance, field: "marca")}</td>

        <td>${fieldValue(bean: TDCInstance, field: "numero")}</td>

        <td><g:link class="edit" action="edit" id="${TDCInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        </td>
        <td>
        <g:hiddenField name="id" value="${TDCInstance.id}" />
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
        </td>
        </tr>
      </g:each>
      </tbody>
    </table>
              
            </ul>
          </div>
        </div>
        </div>
      </div>
    </section>
    <div class="pagination">
      <g:paginate total="${TDCInstanceTotal}" />
    </div>
  </div>
</body>
</html>
