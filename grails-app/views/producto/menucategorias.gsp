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
			<h1>Productos</h1>
			<div data-role="navbar">
				<ul>
					<li><a data-icon="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link data-icon="back" data-ajax="false" controller='Index' action="menu">Atras</g:link></li>
				</ul>
			</div>
		</div>
     
    <div data-role="content" style=" background-color: buttonface;">
   
 
     <ul data-role="listview" data-divider-theme="b" data-inset="true">
            <li data-role="list-divider" role="heading">
                Categorias
            </li>
            <li data-theme="">
                <a href="${createLink(controller:'Producto',action:'categoriasm',params:[categoria:'Laptops'])}" data-transition="slide">
                    Laptos
                </a>
            </li>
            <li data-theme="c">
                <a href="${createLink(controller:'Producto',action:'categoriasm',params:[categoria:'Tablets'])}" data-transition="slide">
                    Tablets
                </a>
            </li>
            <li data-theme="c">
                <a href="${createLink(controller:'Producto',action:'categoriasm',params:[categoria:'GPS'])}" data-transition="slide">
                    GPS
                </a>
            </li>
            <li data-theme="c">
                <a href="${createLink(controller:'Producto',action:'categoriasm',params:[categoria:'Celulares'])}" data-transition="slide">
                    Celulares
                </a>
            </li>
            <li data-theme="c">
                <a href="${createLink(controller:'Producto',action:'categoriasm',params:[categoria:'Zapatos'])}" data-transition="slide">
                    Zapatos
                </a>
            </li>
            <li data-theme="c">
                <a href="${createLink(controller:'Producto',action:'categoriasm',params:[categoria:'Relojes'])}" data-transition="slide">
                    Relojes
                </a>
            </li>
        </ul>

     

   

    </div>
    <div data-role="footer">
    </div>
  </body>
</html>
