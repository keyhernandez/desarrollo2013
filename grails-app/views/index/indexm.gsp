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

    </div>

    <div data-role="content" style=" background-color: buttonface;">
      <div style="width: 270px; height: 290px; position: relative; background-color: #fbfbfb; border: 1px solid #b8b8b8;">
        <img src="http://codiqa.com/static/images/v2/image.png" alt="image" style="position: absolute; top: 50%; left: 50%; margin-left: -16px; margin-top: -18px">
      </div>


      <a data-role="button" data-theme="a" href="${createLink(controller:'Index',action:'menu')}" data-icon="arrow-r"
         data-iconpos="right">
        Login
      </a>


    </div>
    <div data-role="footer">
    </div>
  </body>
</html>
