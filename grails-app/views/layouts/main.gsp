<!DOCTYPE html>
<html lang="es"><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <title><g:layoutTitle default="Retro shop SK"/> </title>
    <meta charset="utf-8">

    <!-- Link fonth -->
    <link href='http://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>

    <!-- Link styles -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
<!--<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    -->

    <!-- Link scripts -->
    <script src="${resource(dir: 'js', file: 'jquery.js')}" type="text/javascript"></script>
    <script src="${resource(dir: 'js', file: 'superfish.js')}"></script>
    <script>
        $(window).load(function() {
            $("ul.sf-menu").superfish({ 
                pathClass:  'current',
                delay:      2000,
                animation:   {opacity:'show',height:'show'},
                speed:       'slow',
                autoArrows:  true,
                dropShadows: true
            });
        });

        WebFontConfig = {google: {families: ['Yellowtail']}};
        (function() {
            var wf = document.createElement('script');
            wf.src = ('https:' == document.location.protocol ? 'https' : 'http') + '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
            wf.type = 'text/javascript';
            wf.async = 'true';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(wf, s);
        })();
    </script>

    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5.js"></script>
    <![endif]-->
    <g:layoutHead />
  </head>
<body>
    
    <header><!-- Define the header section of the page -->
        <div class="head_menus">
            <div class="menu"><!-- Define the topest menu -->
                <ul>
                    <li><a href="${createLink(uri: '/')}">Home</a></li>
                    <li><a href="#">Novedades</a></li>
                    <li><a href="#">Featured</a></li>
                    <li><a href="#">Top sells</a></li>
                    <li><a href="#">Especiales</a></li>
                    <li><a href="#">Ofertas</a></li>
                    <li><a href="#">Reviews</a></li>
                    <li><a href="#">Contactos</a></li>
                </ul>
            </div>

          <div class="box_currencies"><!-- Define currency switcher -->
              <g:form controller="Usuario">
                <g:actionSubmit value="Inicia Sesion" action="list" />
              </g:form>
          </div>
          
            <div class="search"><!-- Define the search element -->
                <form method="get" action="#">
                    <input type="text" onfocus="if(this.value =='Search' ) this.value=''" onblur="if(this.value=='') this.value='Search'" maxlength="300" size="10" value="Search" name="s">
                    <input type="image" alt="" src="${resource(dir: 'images', file: 'search_btn.gif')}">
                </form>
            </div>
        </div>

        <div class="logo"><!-- Define the logo element -->
            <a href="${createLink(uri: '/')}">
                <h1>Retro Shop SK</h1>
                <h3>Susana - Keyla</h3>
            </a>
        </div>
    </header>

    <nav><!-- Define the navigation menu -->
        <div>
            <ul class="sf-menu">
                <li><a href="#">Menu 1</a>
                    <ul>
                        <li><a href="#">Submenu 1</a></li>
                        <li><a href="#">Submenu 2</a></li>
                        <li><a href="#">Submenu 3</a></li>
                        <li><a href="#">Submenu 4</a></li>
                    </ul>
                </li>
                <li><a href="#">Menu 2</a>
                    <ul>
                        <li><a href="#">Submenu 21</a></li>
                        <li><a href="#">Submenu 22</a>
                            <ul>
                                <li><a href="#">Submenu a</a></li>
                                <li><a href="#">Submenu b</a>
                                    <ul>
                                        <li><a href="#">Submenu e</a></li>
                                        <li><a href="#">Submenu f</a></li>
                                        <li><a href="#">Submenu g</a></li>
                                        <li><a href="#">Submenu h</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Submenu c</a></li>
                                <li><a href="#">Submenu d</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Submenu 23</a></li>
                        <li><a href="#">Submenu 24</a></li>
                    </ul>
                </li>
                <li><a href="#">Menu 3</a>
                    <ul>
                        <li><a href="#">Submenu 31</a></li>
                        <li><a href="#">Submenu 32</a></li>
                        <li><a href="#">Submenu 33</a></li>
                        <li><a href="#">Submenu 34</a></li>
                    </ul>
                </li>
                <li><a href="#">Menu 4</a>
                    <ul>
                        <li><a href="#">Submenu 41</a></li>
                        <li><a href="#">Submenu 42</a></li>
                        <li><a href="#">Submenu 43</a></li>
                        <li><a href="#">Submenu 44</a></li>
                    </ul>
                </li>
                <li><a href="#">Menu 5</a></li>
                <li><a href="#">Menu 6</a></li>
                <li><a href="#">Menu 7</a></li>
                <li><a href="#">Menu 8</a></li>
                <li><a href="#">Menu 9</a></li>
            </ul>
        </div>
    </nav>
  <div id="left">
  <g:pageProperty name="page.left1"/>
  <g:pageProperty name="page.left2"/>
  </div>
  <div id="right">
  <g:pageProperty name="page.right1"/>
  <g:pageProperty name="page.right2"/>
  </div>
<g:layoutBody />
    <footer><!-- Define the footer section of the page -->
        <div>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">What's New?</a></li>
                <li><a href="#">Featured</a></li>
                <li><a href="#">Top sells</a></li>
                <li><a href="#">Specials</a></li>
                <li><a href="#">Extra</a></li>
                <li><a href="#">Reviews</a></li>
                <li><a href="#">Contacts</a></li>
            </ul>
            <p class="link"><a href="#">Keyla Hernandez, Susana Jeronimo</a></p>
        </div>
    </footer>

</body></html>