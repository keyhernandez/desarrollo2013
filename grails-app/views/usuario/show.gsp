
<%@ page import="grailsapplication2.Usuario" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
  <title>Perfil</title>
</head>
<body> <section id="content"><!-- Define the content #2 section    <g:form name="carro" url="[action:'micarrito',controller:'Carrito']">  </g:form> -->
    <div class="col1">
      <div class="dbox">
        <div class="head">Opciones</div>
        <div class="tags">
          <ul>
            <li><a href="${createLink(controller:'Usuario',action:'edit', params:[id:session.usuario.id])}">Editar Datos Personales</a></li>
            <li><a href="${createLink(controller:'TDC',action:'list')}">Tarjetas de Credito</a></li>
            <li><a href="${createLink(controller:'TDC',action:'create')}">Agregar TDC</a></li>
            <li><a href="${createLink(controller:'Compra',action:'list')}">Compras/Ordenes</a></li>
            <li><a href="${createLink(controller:'Carrito',action:'micarrito')}">Mi Carrito</a></li>
            <li><a href="${createLink(controller:'Calificacion',action:'productos')}">Productos por Calificar</a></li>
            </table>
          </ul>
        </div>
      </div>
    </div>


    <div class="col2">
      <div class="dbox">
        <div class="head">Perfil</div>
        <div class="blist">
          <ul>

            <li>


              <div id="show-usuario" class="content scaffold-show" role="main">

                <g:if test="${flash.message}">
                  <div class="message" role="status">${flash.message}</div>
                </g:if>
                <ol class="property-list usuario">



                  <g:if test="${usuarioInstance?.nombre}">
                    <li class="fieldcontain">
                      <span id="nombre-label" class="property-label"><g:message code="usuario.nombre.label" default="Nombre" /></span>

                      <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${usuarioInstance}" field="nombre"/></span>

                    </li>
                  </g:if>

                  <g:if test="${usuarioInstance?.apellido}">
                    <li class="fieldcontain">
                      <span id="apellido-label" class="property-label"><g:message code="usuario.apellido.label" default="Apellido" /></span>

                      <span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${usuarioInstance}" field="apellido"/></span>

                    </li>
                  </g:if>

                  <g:if test="${usuarioInstance?.cedula}">
                    <li class="fieldcontain">
                      <span id="cedula-label" class="property-label"><g:message code="usuario.cedula.label" default="Cedula" /></span>

                      <span class="property-value" aria-labelledby="cedula-label"><g:fieldValue bean="${usuarioInstance}" field="cedula"/></span>

                    </li>
                  </g:if>

                  <g:if test="${usuarioInstance?.correo}">
                    <li class="fieldcontain">
                      <span id="correo-label" class="property-label"><g:message code="usuario.correo.label" default="Correo" /></span>

                      <span class="property-value" aria-labelledby="correo-label"><g:fieldValue bean="${usuarioInstance}" field="correo"/></span>

                    </li>
                  </g:if>

                  <g:if test="${usuarioInstance?.pais}">
                    <li class="fieldcontain">
                      <span id="pais-label" class="property-label"><g:message code="usuario.pais.label" default="Pais" /></span>

                      <span class="property-value" aria-labelledby="pais-label"><g:fieldValue bean="${usuarioInstance}" field="pais"/></span>

                    </li>
                  </g:if>

                  <g:if test="${usuarioInstance?.ciudad}">
                    <li class="fieldcontain">
                      <span id="ciudad-label" class="property-label"><g:message code="usuario.ciudad.label" default="Ciudad" /></span>

                      <span class="property-value" aria-labelledby="ciudad-label"><g:fieldValue bean="${usuarioInstance}" field="ciudad"/></span>

                    </li>
                  </g:if>

                  <g:if test="${usuarioInstance?.codpostal}">
                    <li class="fieldcontain">
                      <span id="codpostal-label" class="property-label"><g:message code="usuario.codpostal.label" default="Codpostal" /></span>

                      <span class="property-value" aria-labelledby="codpostal-label"><g:fieldValue bean="${usuarioInstance}" field="codpostal"/></span>

                    </li>
                  </g:if>

                  <g:if test="${usuarioInstance?.direccion}">
                    <li class="fieldcontain">
                      <span id="direccion-label" class="property-label"><g:message code="usuario.direccion.label" default="Direccion" /></span>

                      <span class="property-value" aria-labelledby="direccion-label"><g:fieldValue bean="${usuarioInstance}" field="direccion"/></span>

                    </li>
                  </g:if>

                  <g:if test="${usuarioInstance?.fechaNac}">
                    <li class="fieldcontain">
                      <span id="fechaNac-label" class="property-label"><g:message code="usuario.fechaNac.label" default="Fecha Nac" /></span>

                      <span class="property-value" aria-labelledby="fechaNac-label"><g:fieldValue bean="${usuarioInstance}" field="fechaNac"/></span>

                    </li>
                  </g:if>

                  </li>




                  </ul>
              </div>
              </div>
              </div>
              </section>	

              </ol>

              </div>
              </body>
              </html>
