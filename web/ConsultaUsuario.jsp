<%-- 
    Document   : ConsultaCliente
    Created on : 28-oct-2018, 3:53:24
    Author     : Live
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resources/css/estilos2.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>Consultar Cliente</title>
    </head>
    <body>
        <form class="formulario-login" action="ConsultarUsuario" method="post">
            <fieldset>
                <legend>Consulta Usuario</legend>
                <BR>
                <center>
                    <img src="resources/img/consultausuario.png" width="100" height="100" style="border: 0">
                </center>
                <BR>
                <BR>
                <input type="text" name="alias" maxlength="50" placeholder="Alias" required>
                <BR>
                <BR>
                <center>
                    <input type="submit" value="Consultar">
                    <input type="reset" value="Borrar" />
                    <input type="button" onclick=" location.href = '#'" value="Cancelar" name="boton" />
                </center>
            </fieldset>
        </form>
    <center>
        <font color="red"><b> ${mensaje}</b></font>
    </center>
</body>
</html>
