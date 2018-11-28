
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Proyecto web</title>
 <!-----------------MENU------------------------>   
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/jquery-3.3.1.min"></script>
  <script src="js/listas.js" type="text/javascript"></script>
  <meta charset="utf-8">
<!-----------------MENU------------------------>  
        
</head>

 </head>
 <body >

<!-----------------MENU------------------------>

<!-----------------MENU------------------->
        <%
            //CONECTANDO A LA BASE DE DATOS:
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
            rs = smt.executeQuery("select * from Agentes");
            //Creamo la Tabla:     
        %>
        <div class="container">            
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Nuevo Agente</button>
            <div style="padding-left: 800px">                  
                <!-- <input type="text" class="form-control" value="Buscar"/>                            -->
            </div>
        </div>  
              
        <br>
        <div class="container">               
            <!--<a  class="btn btn-success" href="Agregar_e.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
            
                 <table class="table table-borderless">
                    <thead>
                        <tr>
                            <th class="text-center">Agente</th>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Fecha Nacimiento</th>
                            <th class="text-center">Especialidad</th>
                            <th class="text-center">Idiomas</th>
                            <th class="text-center">Telefono</th>
                            <th class="text-center"> Email </th>
                            
                            <th class="text-center">Acciones</th>
                            
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td>  <img src="img/agente.jpeg" width="250" height="250"/> </td>
                            <td class="text-center"><%= rs.getString("Nombre_completo")%></td>
                            <td class="text-center"><%= rs.getString("Fecha_nacimiento")%></td>
                            <td class="text-center"><%= rs.getString("Especialidad")%></td>
                            <td class="text-center"><%= rs.getString("Idiomas")%></td>
                            <td class="text-center"><%= rs.getString("Telefono")%></td>
                            <td class="text-center"><%= rs.getString("Email")%></td>
                            
                            
                            <td class="text-center">
                                
                                <!-- <input type="hidden" value="<//%= rs.getInt("Id_Usuario")%>" id="Editar"/>
                                <input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/>  -->
                                <a href="Editar_agente.jsp?id=<%= rs.getInt("Id_Agente")%>" class="btn btn-primary">Editar</a>
                                <a href="Borrar_agente.jsp?id=<%= rs.getInt("Id_Agente")%>" class="btn btn-danger">Borrar</a>
                            </td>
                        </tr>
                        <%}%>
                </table>
            </div>  
                
                
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Agregar Agente</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <%--  <label>Id:</label> 
                                <input type="text" name="id" class="form-control"/><br> --%>
                                
                                <label>Nombre</label> 
                                <input type="text" name="txtNom" class="form-control"/><br>
                                
                                <label>Fecha nacimiento </label> 
                                <input type="text" name="txtFec" class="form-control"/>
                                
                                <label>Especialidad</label> 
                                <input type="text" name="txtEsp" class="form-control"/>
                                
                                <label>Idiomas</label> 
                                <input type="text" name="txtIdi" class="form-control"/>
                                
                                <label>Telefono</label> 
                                <input type="text" name="txtTel" class="form-control"/>
                                
                                <label>Email</label> 
                                <input type="text" name="txtEma" class="form-control"/>
                                
                                
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>                            
                                    <input type="submit" value="Guardar" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
            <%
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
                                              + "(Nombre_Completo, Fecha_nacimiento, Especialidad, Idiomas, "
                                              + "Telefono, Email)"
                            + "VALUES('" + Nombre + "','" + Fecha_nacimiento + "','" + Especialidad 
                                 + "','" + Idiomas + "','" + Telefono + "','" + Email  + "')"
                    );// fin prepare
                    ps.executeUpdate();
                    response.sendRedirect("/AppWebBienesRaices/Agentes_a.jsp");

                }
            %>
        <center>
            <a href="Agregar.jsp">Agregar Agentes</a><br/>
        <a href="catalogo.jsp">Catálogo</a><br/>
        
    </center>
        </div>        
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>    
        
    </body>
</html>