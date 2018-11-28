<%-- 
    Document   : tablaClientes
    Created on : 26-nov-2018, 17:00:47
    Author     : Acceso01
--%>

<%@page import="app.persistencia.ClienteBD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="app.modelo.Cliente"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de clientes</title>
        <%@include file="../partials/head.jsp" %>
        <style href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"></style>
        <style href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css"></style>
    </head>
    <body>
        <body id="page-top">
        <!-- Barra de navegación -->
        <%@include file="../partials/navbar.jsp" %>

        <!-- Contenido -->
        <div id="wrapper">
            <!-- Sidebar -->
            

            <!-- Contenido -->
            <div id="content-wrapper">
                <div class="container">
                    <div class="alert alert-success" role="alert">
                        ${mensaje}
                    </div>

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Clientes Registrados en el Sistema
                            <a href="http://localhost:8080/LocalProyInmuebles/administrador/cliente/nuevoCliente.jsp">
                                <button class="btn btn-success fas fa-plus pull-right" 
                                        name="nuevo" 
                                        title="Nuevo" 
                                        type="submit">
                                </button>
                            </a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" 
                                       id="dataTable" 
                                       width="100%" 
                                       cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre(s)</th>
                                            <th>Calle</th>
                                            <th>Colonia</th>
                                            <th>Ciudad</th>
                                            <th>RFC</th>
                                            <th>Telefono</th>
                                            <th>Correo</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                <%-- Lista de todos los clientes --%>
                <%! int controlarCliente = 0;%>
                <%                ArrayList<Cliente> lista = ClienteBD.TodosClientes();
                    for (Cliente c : lista) {
                        controlarCliente++;

                %>    
                                        
                                        <tr>
                                            <td><%= controlarCliente%></td>
                                            <td><%= c.getNombre()%></td>
                                            <td><%= c.getCalle()%></td>
                                            <td><%= c.getColonia()%></td>
                                            <td><%= c.getCiudad()%></td>
                                            <td><%= c.getRfc()%></td>
                                            <td><%= c.getTelefono()%></td>
                                            <td><%= c.getCorreo()%></td>
                                            <td>
                                                <div class="btn-group-vertical">
                                                    <form action="http://localhost:8080/LocalProyInmuebles/verCliente" method="post">
                                                        <input type="hidden" name="id" value="<%= c.getId_cliente()%>">
                                                        <button class="btn btn-primary fas fa-eye" type="submit" title="Ver"></button>
                                                    </form>

                                                    <form action="http://localhost:8080/LocalProyInmuebles/modificarClienteUno" method="post">
                                                        <input type="hidden" name="id" value="<%= c.getId_cliente()%>">
                                                        <button class="btn btn-warning fas fa-pencil-alt" type="submit" title="Modificar"></button>
                                                    </form>

                                                    <form action="http://localhost:8080/LocalProyInmuebles/eliminarCliente" method="post">
                                                        <input type="hidden" name="id" value="<%= c.getId_cliente()%>">
                                                        <button class="btn btn-danger fas fa-trash" type="submit" title="Eliminar"></button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                    <%
                    }
                    controlarCliente = 0;
                %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sticky Footer -->
                <%@include file="../partials/footer.jsp" %>
            </div>
            <!-- /.content-wrapper -->
        </div>
        <!-- /#wrapper -->
        
        <!-- Demo scripts for this page-->
        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTable').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        'copy', 'csv', 'excel', 'pdf', 'print'
                    ]
                });
            });
        </script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    </body>
</html>
