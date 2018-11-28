<%-- 
    Document   : verCasa
    Created on : 28/10/2018, 07:47:54 PM
    Author     : Rod
--%>
<%@page import="java.util.Arrays"%>
<%@page import="Controlador.PublicacionJpaController"%>
<%@page import="Controlador.CasaJpaController"%>
<%@page import="Controlador.UsuarioJpaController"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Publicacion"%>
<%@page import="Modelo.Casa"%>
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
        <title>Proyecto Individual | Modificar mi casa</title>
        <%@include file="invitado/partials/head.jsp" %>
    </head>

    <body id="page-top">
        <form action="" method="post">
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
                            EntityManager em = emf.createEntityManager();
                        
                            PublicacionJpaController pub = new PublicacionJpaController(emf);
                            CasaJpaController casa = new CasaJpaController(emf);
                            UsuarioJpaController user = new UsuarioJpaController(emf);
                            Publicacion P = null;
                            Casa C = null;
                            Usuario S = null;
                
                            int id = 0, us = 0, cas = 0, tel = 0, hab = 0;
                            BigDecimal costo = new BigDecimal(0);
                            String nombre = null, app = null, apm = null, t = null,
                                    calle = null, colonia = null, numext = null,
                                    nint = null, activo = null, img = null,
                                    med = null;
                            try{
                
                                id = Integer.parseInt(request.getParameter("id"));
                                us = pub.findPublicacion(id).getIdUsuario();
                                cas = pub.findPublicacion(id).getIdCasa();
                                img = cas + ".jpg";
                            
                                System.out.println(id);
                                System.out.println(us);
                                System.out.println(cas);
                            
                                activo = Arrays.toString(pub.findPublicacion(id).getEstatus().split(",")) ;
                            
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
                            
                            }catch(Exception e){
                                    System.out.println("Mensaje: " + e.getMessage());
                            }
                                %>
                                <h3>Ver Casa <span class="fas fa-home"></span></h3>

                            </div>
                            <div class="card-body">
                                <input type="hidden" name="accion" value="insertar">
                                <div class="container">
                                    <h4>Información de la Vivienda</h4><hr>
                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <label>Costo</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="costo" 
                                                   id="costo"
                                                   placeholder="Costo"
                                                   value="<%
                                                       out.print(costo);
                                                   %>"/>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Calle</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="calle" 
                                                   id="calle"
                                                   placeholder="Calle"
                                                   value="<%
                                                       out.print(calle);
                                                   %>"/>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Colonia</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="colonia" 
                                                   id="colonia"
                                                   placeholder="Colonia"
                                                   value="<%
                                                       out.print(colonia);
                                                   %>"/>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <label>Número Exterior</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="num_ext" 
                                                   id="num_ext"
                                                   placeholder="Número Exterior"
                                                   value="<%
                                                       out.print(numext);
                                                   %>"/>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Número Interior</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="num_int" 
                                                   id="num_int"
                                                   placeholder="Número Interior"
                                                   value="<%
                                    out.print(nint);
                                                   %>">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>Habitaciones</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="habitaciones" 
                                                   id="habitaciones"
                                                   placeholder="Habitaciones"
                                                   value="<%
                                                       out.print(hab);
                                                   %>"/>

                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label>Tipo</label>
                                            <select class="form-control" 
                                                    id="tipo" 
                                                    name="tipo">
                                                <option>Renta</option>
                                                <option>Venta</option>
                                            </select>
                                        </div>

                                        <br>
                                        <div class="form-group col-md-6">
                                            <label>Medidas</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="medidas" 
                                                   id="medidas"
                                                   placeholder="Medidas"
                                                   value="<%
                                                       out.print(med);
                                                   %>"/>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Foto</label>
                                            <img width="50%" 
                                                 src="img/<%
                                    out.println(img);
                                                 %>"/>
                                        </div>
                                    </div>
                                    <br>
                                    <h4>Información del Vendedor</h4><hr>
                                    <div class="row">
                                        <div class="form-group col-md-3">
                                            <label>Nombre(s)</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="nombre" 
                                                   id="nombre"
                                                   placeholder="Nombre(s)"
                                                   value ="<%
                                                       out.print(nombre)
                                            ;%>"/>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Apellido Paterno</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="apellido_paterno" 
                                                   id="apellido_paterno"
                                                   placeholder="Apellido Paterno"
                                                   value ="<%
                                                       out.print(app)
                                            ;%>"/>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Apellido Materno</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="apellido_materno" 
                                                   id="apellido_materno"
                                                   placeholder="Apellido Materno"
                                                   value ="<%
                                                       out.print(apm)
                                            ;%>" />
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Teléfono</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="telefono" 
                                                   id="telefono"
                                                   placeholder="Teléfono"
                                                   value ="<%
                                                       out.print(tel)
                                            ;%>"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="text-center">
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <a href="catalogo.jsp">
                                                <button class="btn btn-info btn-block">Regresar</button>
                                            </a>
                                        </div>

                                        <div class="form-group col-md-6">

                                            <button type ="submit" class="btn btn-success btn-block" >Modificar</button>
                                            <%
                                            
                                               /* String tipo;
                                                String nc, ncalle, ncolonia,
                                                    next, nnint, nhab, nmed,
                                                    nnombre, napp, napm, ntel;
                                                BigDecimal ncosto;
                                                try{
                                                    tipo = request.getParameter("tipo");
                                                    nc = request.getParameter("costo"); //bd es decimal
                                                    ncosto = new BigDecimal(nc);
                                                    ncalle = request.getParameter("calle");
                                                    ncolonia = request.getParameter("colonia");
                                                    next = request.getParameter("num_ext");
                                                    nnint = request.getParameter("num_int");
                                                    nhab = request.getParameter("habitaciones");    //bd es entero
                                                    nmed = request.getParameter("medidas");
                                                    nnombre = request.getParameter("nombre");
                                                    napp = request.getParameter("apellido_paterno");
                                                    napm = request.getParameter("apellido_materno");
                                                    ntel = request.getParameter("telefono");    //BD es entero
                                                    /*Los valores que comenté son los que me marcan error, 
                                                    espero que tú puedas hacer lo de mandar un String a la bd
                                                    como le hicimos en el tuyo.*/
                                                                                        
                                               /* 
                                                P = em.find(Publicacion.class, id);
                                                P.setEstatus(tipo);
                                            
                                                C = em.find(Casa.class, cas);
                                                C.setCosto(ncosto);
                                                C.setCalle(ncalle);
                                                C.setColonia(ncolonia);
                                                C.setNumExt(next);
                                                C.setNumInt(nnint);
                                                C.setHabitaciones(nhab);
                                                C.setMedidas(nmed);
                                                                                        
                                                S = em.find(Usuario.class, us);
                                                S.setNombre(nnombre);
                                                S.setApellidoPaterno(napp);
                                                S.setApellidoMaterno(napm);
                                                S.setTelefonoCelular(ntel);
                                                } catch (Exception e){
                                                    System.out.println(e.getMessage());
                                                }
                                            */
                                            %>
                                        </div>
                                        <center>
            <a href="Agregar.jsp">Agregar Agentes</a><br/>
            <a href ="Agentes_a.jsp">Ver agentes</a><br/>
        <a href="catalogo_a.jsp">Volver al Catálogo</a><br/>
        
        
    </center>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
