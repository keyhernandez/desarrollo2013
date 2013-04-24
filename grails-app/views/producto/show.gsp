
<%@ page import="grailsapplication2.Producto" %>
<%@ page import="grailsapplication2.Calificacion" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
  <title>${productoInstance?.nombre}</title>
</head>
<body>

  <div class="nav" role="navigation">
    <ul>

      <li><g:link class="list" action="list">Todos los items</g:link></li>

    </ul>
  </div>
  <div id="show-producto" class="content scaffold-show" role="main">
    <section id="content"><!-- Define the content #2 section    <g:form name="carro" url="[action:'micarrito',controller:'Carrito']">  </g:form> -->
      <div class="col1">
        <div class="dbox">
          <div class="head">Carrito</div>
          <div class="tags">
            <ul>
              <g:if test="${session.usuario}">
                <g:render template="/carrito/micarrito"/>
              </g:if>



            </ul>
          </div>
        </div>
      </div>

      <div class="col2">
        <div class="dbox">
          <div class="head">Detalle</div>
          <div class="blist">
            <ul>

              <li>
                <div class="img">
                  <a href="#">
                    <img src="http://localhost:7070/GrailsApplication2/producto/showImage/${productoInstance?.id}" />
                  </a>
                </div>
                <div class="desc">
                  <div class="d"><span>Date Added:</span> Thursday 27 March, 2012</div>
                  <h2><a >${productoInstance?.nombre}</a></h2>
                  <div class="d">Precio: <div class="price">Bs. ${productoInstance?.precio}</div></div>
                  <div class="d">${productoInstance?.descripcion}</div>
                  <div>
                    <div class="but" > 

                      <a href="https://twitter.com/share" class="twitter-share-button" data-lang="es" data-hashtags="RetroShop">
                        Twittear </a>
                      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id))
                        {js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}
                      (document,"script","twitter-wjs");
                      </script>
                    </div>
                    <g:if test="${session.usuario!=null}">
                      <g:if test="${grailsapplication2.TDC.findByUsuario(session.usuario[0])!=null}">
                        <div class="but">
                        <p>
                          <a href="${createLink(controller:'Carrito',action:'agregarAlcarro',params:[idp:productoInstance?.id,cantidad:1])}">Agrega al Carro</a>
                        </p><p></p>
                      </div>
                      </g:if>
                      <g:else>
                        <h3>Registra un metodo de pago, para poder agregar al carro</h3>
                      </g:else>
                    </g:if>
                     <g:else>
                       <h3>Haz login para agregar al carro</h3>
                     </g:else>
                  </div>
                </div>
              </li>




            </ul>
          </div>
        </div>
      </div>
      <div class="col2">
        <div class="dbox">
          <div class="head">Calificaciones / Comentarios </div>
          <div class="blist">
            <g:if test="${grailsapplication2.Calificacion.findAllByProducto(productoInstance)}">

              <table>
                <thead>
                  <tr>
                <g:sortableColumn property="puntuacion" title="Puntuacion" />
                <g:sortableColumn property="comentario" title="Comentario" />
                <g:sortableColumn property="usuario" title="Usuario" />
                </tr>
                </thead>
                <tbody>
                <g:each in="${grailsapplication2.Calificacion.findAllByProducto(productoInstance)}" status="i"var="c"> 
                  <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>${fieldValue(bean: c, field: "puntuacion")}</td>
                    <td>${fieldValue(bean: c, field: "comentario")}</td>
                    <td>${c.usuario.nombre}</td>
                  </tr>
                </g:each>
                </tbody>
              </table>

            </g:if>
          </div>
        </div>
      </div>
    </section>
  </ol>

</div>
</body>
</html>
