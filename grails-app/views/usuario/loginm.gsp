
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
   <meta name="layout" content="mobile">
   <meta name="viewport" content="width=device-width,user-scalable=no" />
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.2.0/jquery.mobile-1.2.0.min.js"></script>
    <title>Sample title</title>
  </head>
  <body>
    <center>
      <h3>Login</h3>
      <openid:hasLoginError>
        <div class="errors">
          <ul>
            <li><openid:renderLoginError /></li>
          </ul>
        </div>
      </openid:hasLoginError>
      <openid:form success="[action:'loggedin']" onshow="hide('redic')">
        <openid:input id="redic" size="40" value="https://www.google.com/accounts/o8/id" hidden=""/> 
        <br/> <openid:identifier />
        <g:submitButton name="login" value="Login" />
      </openid:form>
    <openid:identifier />
    

    </center>
  </body>
</html>
