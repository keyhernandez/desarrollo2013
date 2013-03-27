<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
   <meta name="layout" content="main">
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
