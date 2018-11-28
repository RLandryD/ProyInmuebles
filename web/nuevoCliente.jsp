<%-- 
    Document   : nuevoCliente
    Created on : 26-nov-2018, 14:51:25
    Author     : Acceso01
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="app.controladores.nuevoCliente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente Nuevo</title>
        <%@include file="../partials/head.jsp" %>
    </head>
    <body id="page-top">
        <!-- Barra de navegación -->
        <%@include file="../partials/navbar.jsp" %>

        <!-- Contenido -->
        <div id="wrapper">
            <!-- Sidebar -->
            <br><br>

            <!-- Contenido -->
            <div id="content-wrapper">
                <div class="container">
                    <div class="card mx-auto">
                        <div class="card-header text-dark text-center">
                            <h3>Nuevo Cliente <span class="fas fa-user"></span></h3>
                        </div>
                        <div class="card-body">
                            <form method="post" action="http://localhost:8080/LocalProyInmuebles/nuevoCliente" >
                                <input type="hidden" name="accion" value="insertar">
                                <div class="container">
                                    <div class="row">
                                        <div class="form-group col-md-3">
                                            <label for="costo">Nombre(s)</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="nombre" 
                                                   id="nombre"
                                                   placeholder="Nombre(s)">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="calle">Contraseña</label>
                                            <input class="form-control" 
                                                   type="password" 
                                                   name="password" 
                                                   id="apellido_paterno"
                                                   placeholder="Contraseña">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="colonia">Telefono</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="telefono" 
                                                   id="apellido_materno"
                                                   placeholder="Telefono">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="colonia">RFC</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="rfc" 
                                                   id="edad"
                                                   placeholder="RFC">
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="form-group col-md-3">
                                            <label for="num_ext">Calle</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="calle" 
                                                   id="calle"
                                                   placeholder="Calle">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="num_int">Colonia</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="colonia" 
                                                   id="colonia"
                                                   placeholder="Colonia">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="num_ext">Ciudad</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="ciudad" 
                                                   id="num_ext"
                                                   placeholder="Ciudad">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="num_int">Tipo usuario</label>
                                            <select class="form-control" name="tipo"> 
                                                <option value="vendedor">Vendedor</option>
                                                <option value="VenCom">Vendedor y Comprador</option>
                                            </select>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label for="medidas">Correo</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="correo" 
                                                   id="correo"
                                                   placeholder="Correo">
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <div class="card-footer">
                            <div class="text-center">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <button class="btn btn-success btn-block" type="submit">Guardar</button>
                                        </form>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <a href="tablaClientes.jsp">
                                            <button class="btn btn-danger btn-block">Cancelar</button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        ${mensaje}
    </body>
</html>
