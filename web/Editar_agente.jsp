<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Mirelesa's books</title>
    </head>
    <body>
        <%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/proyectofinal";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       //Emnpezamos Listando los Datos de la Tabla Libros pero de la fila seleccionada
       PreparedStatement ps;
       ResultSet rs;
       int id=Integer.parseInt(request.getParameter("id"));
       ps=con.prepareStatement("select * from Agentes where Id_Agente="+id);
       rs=ps.executeQuery();
       while(rs.next()){
                         %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                ID
                <input type="text" name = "id" readonly="" class="form-control" value="<%= rs.getInt("Id_Agente")%>"/>
                <br>                
                 Nombre
                <input type="text" name="txtNom" class="form-control" value="<%= rs.getString("Nombre_completo")%>"/>
                <br>              
                Fecha nacimiento
                <input type="text" name="txtFec" class="form-control" value="<%= rs.getString("Fecha_nacimiento")%>"/>
                 <br>                 
                 Especialidad
                <input type="text" name="txtEsp" class="form-control" value="<%= rs.getString("Especialidad")%>"/>
                 <br>                 
                 Idiomas
                <input type="text" name="txtIdi" class="form-control" value="<%= rs.getString("Idiomas")%>"/>
                 <br>                 
                 Telefono
                <input type="text" name="txtTel" class="form-control" value="<%= rs.getString("Telefono")%>"/>
                 <br>                 
                 Email
                <input type="text" name="txtEma" class="form-control" value="<%= rs.getString("Email")%>"/>
                 <br>               
                 
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                
                <a href="Agentes_a.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
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
                                              
ps=con.prepareStatement("update agentes set Nombre_Completo='"+Nombre+"',Fecha_nacimiento='"+Fecha_nacimiento
                                + "',Especialidad='"+Especialidad+"', Idiomas='"+Idiomas+"',"
                                + " Telefono='"+Telefono+"',Email='"+Email+ "'where Id_Agente="+id);
           ps.executeUpdate();
              response.sendRedirect("Agentes_a.jsp");
           
       }
       
       
%>
