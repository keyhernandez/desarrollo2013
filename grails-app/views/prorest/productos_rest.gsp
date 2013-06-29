<html>
    <head>
    </head>

    <body>
        <table border='1'>
        <g:each in="${p_rest}" status="i" var="x">
            <tr>
                <td>
                    <a href='/GrailsApplication2/rest/productos_rest_id/${x.get("@id")}'>${x.get('@nombre')}</a>
                </td>
            </tr>
        </g:each>
        </table>
    </body>
</html>
