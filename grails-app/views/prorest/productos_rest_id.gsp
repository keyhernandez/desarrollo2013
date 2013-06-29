<html>
    <head>
    </head>

    <body>
        <table border='1'>
            <tr>
                <td style='font-weight: bold'>id:</td><td>${p_rest.get('id')}</td>
            </tr>
            <tr>
                <td style='font-weight: bold'>nombre:</td><td>${p_rest.get('nombre')}</td>
            </tr>
            <tr>
                <td style='font-weight: bold'>categoria:</td><td>${p_rest.get('categoria')}</td>
            </tr>
            <tr>
                <td style='font-weight: bold'>imagen:</td>
                <td><img src="${p_rest.get('imagen')}"/></td>
            </tr>
        </table>
    </body>
</html>
