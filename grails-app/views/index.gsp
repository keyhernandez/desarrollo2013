<!DOCTYPE html>
<html lang="es"><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <title>'Retro shop SK' </title>
    <meta charset="utf-8">

    <!-- Link fonth -->
    <link href='http://fonts.googleapis.com/css?family=Yellowtail' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>

    <!-- Link styles -->
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">

    <!-- Link scripts -->
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/superfish.js"></script>
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
</head>
<body>

    <header><!-- Define the header section of the page -->
        <div class="head_menus">
            <div class="menu"><!-- Define the topest menu -->
                <ul>
                    <li><a href="#">Home</a></li>
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
              
                  <g:actionSubmit value="Inicia Sesion" action="login" /> 
              </g:form> 
             <!-- <g:link controller="Usuario" action="list">Inicia Sesion</g:link>-->
           </div>

            <div class="search"><!-- Define the search element -->
                <form method="get" action="#">
                    <input type="text" onfocus="if(this.value =='Search' ) this.value=''" onblur="if(this.value=='') this.value='Search'" maxlength="300" size="10" value="Search" name="s">
                    <input type="image" alt="" src="images/search_btn.gif">
                </form>
            </div>
        </div>

        <div class="logo"><!-- Define the logo element -->
            <a href="#">
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

    <section id="banners"><!-- Banners section -->
        <ul>
            <li><a href="#"><img alt="" src="images/b1.png"></a></li>
            <li><a href="#"><img alt="" src="images/b2.png"></a></li>
            <li><a href="#"><img alt="" src="images/b3.png"></a></li>
        </ul>
    </section>

    <section id="content"><!-- Define the content section -->
        <div class="dbox">
            <div class="head">Productos Populares <g:link controller="Usuario" action="list">INICIAR APLICACION</g:link> </div>
            <div class="list">
                <ul>
                    <li>
                        <a href="#">
                            <img src="images/coin.png" />
                            <span class="title">Item</span>
                            <span class="price"><p>$10.00</p></span>
                            <div class="but"><p>Agrega al carro</p><p></p></div>
                        </a>
                    </li>
                    <li class="vsep"></li>
                    <li>
                        <a href="#">
                            <img src="images/coin2.png" />
                            <span class="title">Item title</span>
                            <span class="price"><p>$15.00</p><del>$35.00</del></span>
                            <div class="but"><p>Add to Cart</p><p></p></div>
                        </a>
                    </li>
                    <li class="vsep"></li>
                    <li>
                        <a href="#">
                            <img src="images/coin.png" />
                            <span class="title">Item title</span>
                            <span class="price"><p>$20.00</p></span>
                            <div class="but"><p>Add to Cart</p><p></p></div>
                        </a>
                    </li>
                    <li class="vsep"></li>
                    <li>
                        <a href="#">
                            <img src="images/coin2.png" />
                            <span class="title">Item title</span>
                            <span class="price"><p>$25.00</p></span>
                            <div class="but"><p>Add to Cart</p><p></p></div>
                        </a>
                    </li>
                    <li class="vsep"></li>
                    <li>
                        <a href="#">
                            <img src="images/coin.png" />
                            <span class="title">Item title</span>
                            <span class="price"><p>$30.00</p></span>
                            <div class="but"><p>Add to Cart</p><p></p></div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>

    <section id="breadcrumb"><!-- Define the breadcrumb section -->
        <div class="breadcrumb">
            <a class="headerNavigation" href="#">Top</a> » 
            <a class="headerNavigation" href="#">Catalog</a> » 
            <a class="headerNavigation last" href="#">Coins</a>
        </div>
    </section>

    <section id="content"><!-- Define the content #2 section -->
        <div class="col1">
            <div class="dbox">
                <div class="head">Tag Cloud</div>
                <div class="tags">
                    <ul>
                        <li><a href="#">Tag 1</a></li>
                        <li><a href="#">Tag 2</a></li>
                        <li><a href="#">Tag 3</a></li>
                        <li><a href="#">Tag 4</a></li>
                        <li><a href="#">Tag 5</a></li>
                        <li><a href="#">Tag 6</a></li>
                        <li><a href="#">Tag 7</a></li>
                        <li><a href="#">Tag 8</a></li>
                        <li><a href="#">Tag 9</a></li>
                        <li><a href="#">Tag 10</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col2">
            <div class="dbox">
                <div class="head">Another products</div>
                <div class="blist">
                    <ul>
                        <li>
                            <div class="img">
                            <a href="#">
                                <img src="images/coin3.png" />
                            </a>
                            </div>
                            <div class="desc">
                                <div class="d"><span>Date Added:</span> Thursday 27 March, 2012</div>
                                <h2><a href="#">Coin title 1</a></h2>
                                <div class="d">Price: <div class="price">$39.99</div></div>
                                <div class="d">Some text description here some text description here some text description here some text description here some text description here some text description here some text description here some text description here some text description here</div>
                                <div>
                                    <div class="but"><p>Details</p><p></p></div>
                                    <div class="but"><p>Add to Cart</p><p></p></div>
                                </div>
                            </div>
                        </li>
                        <li class="sep"></li>
                        <li>
                            <div class="img">
                            <a href="#">
                                <img src="images/coin4.png" />
                            </a>
                            </div>
                            <div class="desc">
                                <div class="d"><span>Date Added:</span> Monday 26 March, 2012</div>
                                <h2><a href="#">Coin title 2</a></h2>
                                <div class="d">Price: <div class="price">$49.99</div></div>
                                <div class="d">Some text description here some text description here some text description here some text description here some text description here some text description here some text description here some text description here some text description here</div>
                                <div>
                                    <div class="but"><p>Details</p><p></p></div>
                                    <div class="but"><p>Add to Cart</p><p></p></div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

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