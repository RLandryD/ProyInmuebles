<%-- 
    Document   : Agregar
    Created on : 20/10/2018, 01:11:48 PM
    Author     : Mireles
--%>

<%@page import="java.awt.TrayIcon.MessageType"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
         <title>Bienes Raices</title>
        

    </head>
    
    
    
    <body>  
        <div class="container">
            <h1>Agregar Agente</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">                
                Nombre
                <input type="text" name="txtNom" class="form-control"/><br>
                Fecha nacimiento
                <input type="text" name="txtFec" class="form-control"/> <br>
                Especialidad
                <input type="text" name="txtEsp" class="form-control"/><br>
                Idiomas
                <input type="text" name="txtIdi" class="form-control"/><br>
                Telefono
                <input type="text" name="txtTel" class="form-control"/><br>
                Email
                <input type="text" name="txtEma" class="form-control"/><br>
                               
                
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>                                                
                <a href="Catalogo_a.jsp">Regresar</a>
            </form>
        </div>
        
        
    </body>
</html>
<%
       //CONECTANDO A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/proyectofinal";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       PreparedStatement ps;
        
                       
                                
                String Nombre, Fecha_nacimiento, Especialidad, Idiomas, Telefono, Email;
                                             
                Nombre = request.getParameter("txtNom");
                Fecha_nacimiento = request.getParameter("txtFec");
                Especialidad = request.getParameter("txtEsp");
                Idiomas = request.getParameter("txtIdi");
                Telefono = request.getParameter("txtTel");
                Email = request.getParameter("txtEma");
                
                if (Nombre != null && Fecha_nacimiento != null &&
                    Especialidad != null && Idiomas != null &&
                    Telefono != null && Email != null
                   ) {
                    
                    ps = con.prepareStatement("INSERT INTO AGENTES "
                                              + "(Nombre, Fecha_nacimiento, Especialidad, Idiomas, "
                                              + "Telefono, Email)"
                            + "VALUES('" + Nombre + "','" + Fecha_nacimiento + "','" + Especialidad 
                                 + "','" + Idiomas + "','" + Telefono + "','" + Email  + "')"
                    );// fin prepare
                    ps.executeUpdate();
                    response.sendRedirect("/AppWebBienesRaices/Agentes_a.jsp");

                }
            %>
       
