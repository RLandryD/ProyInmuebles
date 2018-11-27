<%-- 
    Document   : verCasa
    Created on : 28/10/2018, 07:47:54 PM
    Author     : Rod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <!-- HEAD -->
    <head>
        <title>Proyecto Individual | Libro Nuevo</title>
        <%@include file="partials/head.jsp" %>
    </head>

    <body id="page-top">
        <!-- Barra de navegación -->
        <%@include file="partials/navbar.jsp" %>

        <!-- Contenido -->
        <div id="wrapper">

            <!-- Contenido -->
            <div id="content-wrapper">
                <div class="container">
                    <div class="card mx-auto">
                        <div class="card-header text-dark text-center">
                            <h3>Ver Casa <span class="fas fa-home"></span></h3>
                        </div>
                        <div class="card-body">
                            <input type="hidden" name="accion" value="insertar">
                            <div class="container">
                                <h4>Información de la Vivienda</h4><hr>
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label for="costo">Costo</label>
                                        <input class="form-control" 
                                               type="number" 
                                               name="costo" 
                                               id="costo"
                                               placeholder="Costo">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="calle">Calle</label>
                                        <input class="form-control" 
                                               type="text" 
                                               name="calle" 
                                               id="calle"
                                               placeholder="Calle">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="colonia">Colonia</label>
                                        <input class="form-control" 
                                               type="text" 
                                               name="colonia" 
                                               id="colonia"
                                               placeholder="Colonia">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label for="num_ext">Número Exterior</label>
                                        <input class="form-control" 
                                               type="text" 
                                               name="num_ext" 
                                               id="num_ext"
                                               placeholder="Número Exterior">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="num_int">Número Interior</label>
                                        <input class="form-control" 
                                               type="text" 
                                               name="num_int" 
                                               id="num_int"
                                               placeholder="Número Interior">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="habitaciones">Habitaciones</label>
                                        <input class="form-control" 
                                               type="text" 
                                               name="habitaciones" 
                                               id="habitaciones"
                                               placeholder="Habitaciones">

                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="medidas">Tipo</label>
                                        <select class="form-control" 
                                                id="tipo" 
                                                name="tipo">
                                            <option>Renta</option>
                                            <option>Venta</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="fecha">Fecha Límite</label>
                                        <input class="form-control" 
                                               type="date"
                                               id="fecha" 
                                               name="fecha">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="medidas">Medidas</label>
                                        <input class="form-control" 
                                               type="text" 
                                               name="medidas" 
                                               id="medidas"
                                               placeholder="Medidas">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="foto">Foto</label>
                                        <img width="50%" 
                                             src="https://image.mlive.com/home/mlive-media/width620/img/news_impact/photo/thatchjpg-36a53d8f5814f965.jpg">
                                    </div>
                                </div>
                                <br>
                                <h4>Información del Vendedor</h4><hr>
                                <div class="row">
                                    <div class="form-group col-md-3">
                                        <label for="nombre">Nombre(s)</label>
                                        <input class="form-control" 
                                               type="text" 
                                               name="nombre" 
                                               id="nombre"
                                               placeholder="Nombre(s)">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="apellido_paterno">Apellido Paterno</label>
                                        <input class="form-control" 
                                               type="text" 
                                               name="apellido_paterno" 
                                               id="apellido_paterno"
                                               placeholder="Apellido Paterno">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="apellido_materno">Apellido Materno</label>
                                        <input class="form-control" 
                                               type="text" 
                                               name="apellido_materno" 
                                               id="apellido_materno"
                                               placeholder="Apellido Materno">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="correo">Correo Electrónico</label>
                                        <input class="form-control" 
                                               type="email" 
                                               name="correo" 
                                               id="correo"
                                               placeholder="Correo Electrónico">
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
    </body>
</html>
