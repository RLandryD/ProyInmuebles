<%-- 
    Document   : catalogoDePrueba
    Created on : 26-nov-2018, 20:12:03
    Author     : Acceso01
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solo es de prueba</title>
    </head>
    <body>
        
        <%
            String user = null;
            if (session.getAttribute("user") == null) {
                response.sendRedirect("login.jsp");
                //Si no esta loggeado, lo mando al login
        %>
        
        <%
        } else {//Caso contrario
            user = (String) session.getAttribute("user");

            String userName = null;
            String sessionID = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        userName = cookie.getValue();
                    }
                    if (cookie.getName().equals("JSESSIONID")) {
                        sessionID = cookie.getValue();
                    }
                }
            }

        %>
        
        <!--En esta parte se puede mostrar contenido html -->
        
        <h1>Bienvenido ${usuario.nombre}!!!</h1>
        
        <% }%>

        ${mensaje}
    </body>
</html>
