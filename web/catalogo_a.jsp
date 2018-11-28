<%-- 
    Document   : catalogo
    Created on : 29/10/2018, 01:18:55 AM
    Author     : Rod
--%>
<%@page import="java.util.Arrays"%>
<%@page import="Controlador.PublicacionJpaController"%>
<%@page import="Controlador.CasaJpaController"%>
<%@page import="Controlador.UsuarioJpaController"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyecto Grupal | Casas Ofertadas</title>
        <%@include file="invitado/partials/head.jsp" %>
        <style href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"></style>
        <style href="https://cdn.datatables.net/buttons/1.5.2/css/buttons.dataTables.min.css"></style>
    </head>

    <body id="page-top">
        <!-- Barra de navegación -->
        <%@include file="invitado/partials/navbar.jsp" %>

        <!-- Contenido -->
        <div id="wrapper">

            <!-- Contenido -->
            <div id="content-wrapper">
                <div class="container">
                    <div class="alert alert-success" role="alert">
                        Bienvenido.
                    </div>

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Casas Registradas en el Sistema
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr>
                                            <%
                        EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProyInmueblesPU");
                        
                        PublicacionJpaController pub = new PublicacionJpaController(emf);
                        CasaJpaController casa = new CasaJpaController(emf);
                        UsuarioJpaController user = new UsuarioJpaController(emf);
                        int id, usuario, idc;
                        
                        String desc, estado, calle, colonia, caimg, dir,
                                numext, usern, activo, total;
                        Date fecha;
                        
                        BigDecimal costo;
                        
                        for (int i = 0; i < pub.findPublicacionEntities().size(); i++) {
                            activo = Arrays.toString(pub.findPublicacionEntities().get(i).getEstatus().split(",")) ;
                            activo = activo.replace("[", "");
                            activo = activo.replace("]", "");
                            System.out.println(activo);
                            
                        if (activo.equals("no")){
                            continue;
                        }
                        
                        id = pub.findPublicacionEntities().get(i).getId();
                        usuario = pub.findPublicacionEntities().get(i).getIdUsuario();
                        desc = Arrays.toString(pub.findPublicacionEntities().get(i).getDescripcion().split(","));
                        fecha = pub.findPublicacionEntities().get(i).getFechaPublicacion();
                        desc = Arrays.toString(pub.findPublicacionEntities().get(i).getDescripcion().split(","));
                        estado = Arrays.toString(pub.findPublicacionEntities().get(i).getEstatus().split(","));
                        idc = pub.findPublicacionEntities().get(i).getIdCasa();
                        
                        calle = Arrays.toString(casa.findCasa(idc).getCalle().split(","));
                        colonia = Arrays.toString(casa.findCasa(idc).getColonia().split(","));
                        numext = Arrays.toString(casa.findCasa(idc).getNumExt().split(","));
                        costo = casa.findCasa(idc).getCosto();
                        System.out.println(costo);
                        usern = Arrays.toString(user.findUsuario(usuario).getNombre().split(","));
                       desc = desc.replace("[", "");
                       desc = desc.replace("]", "");
                       estado = estado.replace("[", "");
                       estado = estado.replace("]", "");
                       calle = calle.replace("[", "");
                       calle = calle.replace("]", "");
                       numext = numext.replace("[", "");
                       numext = numext.replace("]", "");
                       colonia = colonia.replace("[", "");
                       colonia = colonia.replace("]", "");
                       usern = usern.replace("[", "");
                       usern = usern.replace("]", "");
                       dir = calle + " #" + numext + " Col. " + colonia;
                       caimg = idc + ".jpg";
                       System.out.println(caimg);
                       
                        
                        total = String.format("%,.2f\n", costo);
                                            %>
                                            <td class="text-center">
                                                <a href="#" onclick="">
                                                    <img src="img/<%
                                out.println(caimg);
                                                         %>"
                                                         width="auto" 
                                                         height="100">
                                                    <h4>
                                                        <%
                                out.println(dir);
                                                        %></h4>
                                                </a>
                                                <form action="Modificar.jsp">
                                                    <h5>

                                                        <%
                                                            out.println(usern);
                                                        %>
                                                        <input type="hidden" name ="id" value ="<%
                                                            out.print(id);
                                                        %>"/>

                                                    </h5>
                                                    Desde <h4><strong>$
                                                                <%
                                                                    out.print(total);
                                                                %>
                                                            </strong></h4>
                                                    <button class="btn btn-success btn-flat">Modificar</button>
                                                </form>
                                            </td>

                                            <%
                                                }
                                            %>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Sticky Footer -->
                    <%@include file="invitado/partials/footer.jsp" %>
                </div>
                <!-- /.content-wrapper -->
                <center>
            <a href="Agregar.jsp">Agregar Agentes</a><br/>
            <a href ="Agentes_a.jsp">Ver agentes</a><br/>
        
        
    </center>
            </div>
            <!-- /#wrapper -->

            <!-- Demo scripts for this page-->
            <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
            <!--<script>
                                                    $(document).ready(function () {
                                                        $('#dataTable').DataTable({
                                                            dom: 'Bfrtip',
                                                            buttons: [
                                                                'copy', 'csv', 'excel', 'pdf', 'print'
                                                            ]
                                                        });
                                                    });
            </script>-->
            <script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
            <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
            <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
            <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
    </body>
</html>
