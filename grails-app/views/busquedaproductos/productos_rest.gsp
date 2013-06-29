<html>
    <head>
    </head>

    <body>
        <g:each in="${p_rest}" status="i" var="x">
            cantidad: ${x.@cantidad},
            <br>
        </g:each>
    </body>
</html>
