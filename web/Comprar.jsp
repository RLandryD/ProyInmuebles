<%-- 
    Document   : verCasa
    Created on : 28/10/2018, 07:47:54 PM
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
<html lang="es">
    <!-- HEAD -->
    <head>
        <title></title>
        <%@include file="invitado/partials/head.jsp" %>
    </head>

    <body id="page-top">
        <!-- Barra de navegación -->
        <%@include file="invitado/partials/navbar.jsp" %>

        <!-- Contenido -->
        <div id="wrapper">

            <!-- Contenido -->
            <div id="content-wrapper">
                <div class="container">
                    <div class="card mx-auto">
                        <div class="card-header text-dark text-center">
                            <%
                        EntityManagerFactory emf = Persistence.createEntityManagerFactory("ProyInmueblesPU");
                        
                        PublicacionJpaController pub = new PublicacionJpaController(emf);
                        CasaJpaController casa = new CasaJpaController(emf);
                        UsuarioJpaController user = new UsuarioJpaController(emf);

                
                                
                        int id = 0, us = 0, cas = 0, tel = 0, hab = 0;
                        BigDecimal costo = new BigDecimal(0);
                        String nombre = null, app = null, apm = null, t = null,
                                calle = null, colonia = null, numext = null,
                                nint = null, activo = null, img = null,
                                med = null, tipo = null;
                        try{
                
                           id = Integer.parseInt(request.getParameter("id"));                
                              
                            us = pub.findPublicacion(id).getIdUsuario();
                            
                            
                            cas = pub.findPublicacion(id).getIdCasa();
                            img = cas + ".jpg";
                            
                            System.out.println(id);
                            System.out.println(us);
                            System.out.println(cas);
                            
                            activo = Arrays.toString(pub.findPublicacion(id).getEstatus().split(",")) ;
                            tipo = Arrays.toString(pub.findPublicacion(id).getEstatus().split(",")) ;
                                    
                            nombre = Arrays.toString(user.findUsuario(us).getNombre().split(","));
                            app = Arrays.toString(user.findUsuario(us).getApellidoPaterno().split(","));
                            apm = Arrays.toString(user.findUsuario(us).getApellidoMaterno().split(","));
                            tel = user.findUsuario(us).getTelefonoCelular();
                            
                            
                            calle = Arrays.toString(casa.findCasa(cas).getCalle().split(","));
                            colonia = Arrays.toString(casa.findCasa(cas).getColonia().split(","));
                            numext = Arrays.toString(casa.findCasa(cas).getNumExt().split(","));
                            med = Arrays.toString(casa.findCasa(cas).getMedidas().split(","));
                            nint = Arrays.toString(casa.findCasa(cas).getNumInt().split(","));
                            
                            costo = casa.findCasa(cas).getCosto();
                            hab = casa.findCasa(cas).getHabitaciones();
                            
                            
                            nombre = nombre.replace("[", "");
                            nombre = nombre.replace("]", "");
                            app = app.replace("[", "");
                            app = app.replace("]", "");
                            apm = apm.replace("[", "");
                            apm = apm.replace("]", "");
                            calle = calle.replace("[", "");
                            calle = calle.replace("]", "");
                            colonia = colonia.replace("[", "");
                            colonia = colonia.replace("]", "");
                            numext = numext.replace("[", "");
                            numext = numext.replace("]", "");
                            nint = nint.replace("[", "");
                            nint = nint.replace("]", "");
                            med = med.replace("[", "");
                            med = med.replace("]", "");
                            activo = activo.replace("[", "");
                            activo = activo.replace("]", "");
                            tipo = tipo.replace("[", "");
                            tipo = tipo.replace("]", "");
                            
                        }catch(Exception e){
                                System.out.println("Mensaje: " + e.getMessage());
                        }
                            System.out.println("nombre: " + nombre);
                            System.out.println("app: " + app);
                            System.out.println("apm: " + apm);
                            System.out.println("tel: " + tel);
                            System.out.println("calle: " + calle);
                            System.out.println("colonia: " + colonia);
                            System.out.println("next: " + numext);
                            System.out.println("costo: " + costo);
                            System.out.println("estado: " + activo);
                            System.out.println("nint: " + nint);
                            System.out.println("hab: " + hab);
                            System.out.println("med: " + med);
                            System.out.println("img: " + img);
                            System.out.println("tipo: " + tipo);
                            %>
                            <h3>Ver Casa <span class="fas fa-home"></span></h3>
                        </div>
                        <div class="card-body">
                            <input type="hidden" name="accion" value="insertar">
                            <div class="container">
                                <h4>Información de la Vivienda</h4><hr>
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label>Costo: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <%
                                                   out.print(costo);
                                               %>
                                        </label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="calle">Calle: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                                   out.print(calle);
                                               %>
                                        </label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="colonia">Colonia:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%
                                                   out.print(colonia);
                                               %>
                                        </label>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label for="num_ext">Número Exterior:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%
                                                   out.print(numext);
                                               %>
                                        </label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="num_int">Número Interior: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                out.print(nint);
                                               %>
                                        </label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="habitaciones">Habitaciones: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                                   out.print(hab);
                                               %>
                                        </label>

                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label for="medidas">Tipo: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                                   out.print(tipo);
                                               %>
                                        </label>
                                    </div>
                                <br>
                                
                                    <div class="form-group col-md-4">
                                        <label for="medidas">Medidas: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                                   out.print(med);
                                               %>
                                        </label>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <img width="300px" 
                                             src="img/<%
                                out.println(img);
                                             %>"/>
                                    </div>
                                </div>
                                <br>
                                <h4>Información del Vendedor</h4><hr>
                                <div class="row">
                                    <div class="form-group col-md-3">
                                        <label for="nombre">Nombre(s): &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                                   out.print(nombre);
                                        %>
                                        </label>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="apellido_paterno">Apellido Paterno: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                                   out.print(app);
                                        %>
                                        </label>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="apellido_materno">Apellido Materno: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                                   out.print(apm);
                                        %>
                                        </label>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="telefono">Teléfono: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%
                                                   out.print(tel);
                                        %>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="text-center">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <a href="">
                                            <button class="btn btn-info btn-block">Regresar</button>
                                        </a>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <a href="#">
                                            <button class="btn btn-success btn-block">Comprar</button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                        <center>
            <a href="Agregar.jsp">Agregar Agentes</a><br/>
            <a href ="Agentes_a.jsp">Ver agentes</a><br/>
        <a href="catalogo.jsp">Volver al Catálogo</a><br/>
        
        
    </center>
    </body>
</html>
