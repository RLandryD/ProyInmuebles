<%-- 
    Document   : verCliente
    Created on : 26-nov-2018, 17:35:42
    Author     : Acceso01
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Ver Cliente</title>
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
                            <h3>Ver Cliente <span class="fas fa-user"></span></h3>
                        </div>
                        <div class="card-body">
                            <form method="post" action="" >
                                <input type="hidden" name="accion" value="insertar">
                                <div class="container">
                                    <div class="row">
                                        <div class="form-group col-md-3">
                                            <label for="costo">Nombre(s)</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="nombre" 
                                                   id="nombre"
                                                   placeholder="Nombre(s)" value="${usuario.nombre}">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="calle">Contraseña</label>
                                            <input class="form-control" 
                                                   type="password" 
                                                   name="password" 
                                                   id="apellido_paterno"
                                                   placeholder="Contraseña" value="${usuario.password}">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="colonia">Telefono</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="telefono" 
                                                   id="apellido_materno"
                                                   placeholder="Telefono" value="${usuario.telefono}">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="colonia">RFC</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="rfc" 
                                                   id="edad"
                                                   placeholder="RFC" value="${usuario.rfc}">
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
                                                   placeholder="Calle" value="${usuario.calle}">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="num_int">Colonia</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="colonia" 
                                                   id="colonia"
                                                   placeholder="Colonia" value="${usuario.colonia}">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="num_ext">Ciudad</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="ciudad" 
                                                   id="num_ext"
                                                   placeholder="Ciudad" value="${usuario.ciudad}">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="num_int">Tipo usuario</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="tipo" 
                                                   id="num_ext"
                                                   placeholder="Tipo" value="${usuario.tipo}">
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
                                                   placeholder="Correo" value="${usuario.correo}">
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <div class="card-footer">
                            <div class="text-center">
                                <div class="row">
                                    <div class="form-group col-md-3"></div>
                                    <div class="form-group col-md-6">
                                        <a class="btn btn-info btn-block" href="http://localhost:8080/LocalProyInmuebles/administrador/cliente/tablaClientes.jsp">
                                            Regresar
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
