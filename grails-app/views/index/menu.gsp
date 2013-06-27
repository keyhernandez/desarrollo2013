<!doctype html>
<html>
  <head>
    <meta name="layout" content="mobile">
    <meta name="viewport" content="width=device-width,user-scalable=no" />
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.js"></script>

    <title>RetroShop</title>
  </head>
  <body>
    <div data-role="header" data-position="fixed">
			<h1>RetroShop</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link data-icon="grid" data-ajax="false" action="list">Salir</g:link></li>
				</ul>
			</div>
		</div>
     
    <div data-role="content" style=" background-color: buttonface;">
   
     <div class="ui-grid-b">
            <div class="ui-block-a">
              <a href="">
                <div style="width: 100px; height: 100px; position: relative; background-color: #fbfbfb; border: 1px solid #b8b8b8;">
                    <img src="${createLinkTo(dir:'images', file:'icono-mi-cuenta.png')}" alt="image" style="position: relative;width: 100px; height: 100px">
                </div>
              </a>
              <div><center>
                    <a href="" data-transition="fade">
                        Mi Cuenta
                    </a></center>
                </div>
            </div>
            <div class="ui-block-b">
              <a href="${createLink(controller:'Producto',action:'menucategorias')}">
                <div style="width: 100px; height: 100px; position: relative; background-color: #fbfbfb; border: 1px solid #b8b8b8;">
                    <img src="${createLinkTo(dir:'images', file:'producto.jpg')}" alt="image" style="position: relative; width: 100px; height: 100px">
                </div>
                </a>
               <div><center>
                    <a href="${createLink(controller:'Producto',action:'menucategorias')}" data-transition="fade">
                        Productos
                    </a></center>
                </div>
            </div>
            <div class="ui-block-c">
              <a href="">
                <div style="width: 100px; height: 100px; position: relative; background-color: #fbfbfb; border: 1px solid #b8b8b8;">
                                   <img src="${createLinkTo(dir:'images', file:'salir.jpg')}" alt="image" style="position: relative; width: 100px; height: 100px">
                </div>
                </a>
              <div><center>
                    <a href="" data-transition="fade">
                        Logout
                    </a>
              </center>  
              </div>
              
            </div>
        </div>

     

   

    </div><div data-theme="a" data-role="footer" data-position="fixed">
        <h5>
            Desarrollo
        </h5>
    </div>
  </body>
</html>
