
<%@ page import="grailsapplication2.Producto" %>
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
                  <h2><a href="${createLink(controller:'Carrito',action:'agregarAlcarro',params:[idp:productoInstance?.id,cantidad:5])}">${productoInstance?.nombre}</a></h2>
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
                    <div class="but"><p><a>Agrega al Carro</a></p><p></p></div>
                  </div>
                </div>
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
