<%--APLICACION LIBRERIA--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>     
       <title>Reportes</title>
       
<!-----------------MENU------------------------>   
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/jquery-3.3.1.min"></script>
  <script src="js/listas.js" type="text/javascript"></script>
  <meta charset="utf-8">
<!-----------------MENU------------------------>

    </head>
    
    <body > 
   
<!-----------------MENU------------------------>

<!-----------------MENU------------------->
          <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/proyectofinal";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla libro
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from Venta");
            //Creamo la Tabla:     
        %>
    <!--
        <div class="container">            
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Nuevo Libro</button>
            <div style="padding-left: 800px">                  
                <input type="text" class="form-control" value="Buscar"/>                            
            </div>
        </div>  
    -->
              
        <br> 
        <div class="container">               
            <!--<a  class="btn btn-success" href="Agregar_e.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
            <br> <br> <br>
            <center>
                 <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" WIDTH="300" HEIGHT="80">No. Venta</th>
                            <th scope="col" WIDTH="200" HEIGHT="80" >Fecha</th>
                            <th scope="col" WIDTH="200" HEIGHT="80" >Usuario</th>
                            <th scope="col" WIDTH="200" HEIGHT="80" >Vivienda</th>
                            <th scope="col" WIDTH="200" HEIGHT="80" >Total</th>
                            </tr>
                    </thead>
                <% while (rs.next()) { %>
                    <tbody>
                        <tr>
                            <th scope="row" ><center><%= rs.getString("id")%></th>
                            <td ><center><%= rs.getString("fecha")%></td>
                            <td ><center> <%= rs.getString("id_usuario")%> </center></td>
                            <td ><center><%= rs.getString("id_casa")%></td>
                            <td ><center><%= rs.getString("total")%> <br> <br> <br< <br> <br> </td>
                    </tr>    
                    </tbody>
                        
                <%}%>
                </table>
                
            <a href="Agregar.jsp">Agregar Agentes</a><br/>
            <a href ="Agentes_a.jsp">Ver agentes</a><br/>
            <a href="catalogo_a.jsp">Catálogo</a><br/>
            <a href ="login.jsp">Cerrar sesión</a><br/>
            </center>
            </div>  
                        
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>