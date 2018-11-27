<%-- 
    Document   : Catálogo
    Created on : 21/10/2018, 03:35:57 PM
    Author     : win 10
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Proyecto Grupal | Casas Ofertadas</title>
        <%@include file="/invitado/partials/head.jsp" %>
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
                        Aquí va el mensaje.
                    </div>
                    <!-- Espacio de inicio-->

                    <br/><br/><br/><br/>
                    <body>
                        <form action="VenderU" method="post">
                            <table>


                                <th width="30%"></th><th width="70%"/>
                                <tr>
                                    <td rowspan="2" align="right">
                                        <img style = "width: 300px;" alt="..."/> </td>
                                    <td>
                                        <div align="right">
                                            <h2></h2>
                                            <br/>
                                            Año:
                                            <br/>ISBN
                                            <br/>Inventario:
                                            <br/><br/>

                                            <p>< </p>

                                            <br/><br/>
                                            <p class="price">$
                                            </p>
                                            <br/><br/><br/>
                                        </div>
                                <center>
                                    <input type="hidden" name ="Precio"
                                           value =""/>
                                    Para confirmar venta, ingrese su usuario
                                    <input type="text" name="usuario"/><br/>
                                    Cantidad<input type="int" name ="cantidad" /><br/><br/>
                                    <button type="submit" name = "id"
                                            class="btn btn-success"
                                            value = ""> Comprar</button>

                                    </td>
                                    </tr>

                            </table>

                            <!-- Productos más vendidos -->
                            <div align="center">
                                <div class="container">
                                    <div class="row">
                                        <h2>Productos más comprados</h2>
                                    </div>

                                    <div class="row">
                                        <div class='col-md-8'>
                                            <div class="carousel slide media-carousel" id="media">
                                                <div class="carousel-inner">
                                                    <div class="item  active">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class = "thumbnail">
                                                                    <a href = "#"><img src = "img/El principito.jpg" alt = "Compra más" style = "width:150px; height:225px;"/></a>
                                                                    <div class = "caption">
                                                                        <h5>El principito</h5>
                                                                        <h4><a class = "btn" href = "#"> Ver</a>
                                                                            <span class = "pull-right">$80</span>
                                                                        </h4>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class = "col-md-4">
                                                                <div class = "thumbnail">
                                                                    <a href = "#"><img src = "img/Digital Image Processing.jpg" alt = "Compra más" style = "width:150px; height:225px;"/>
                                                                    </a>
                                                                    <div class = "caption">
                                                                        <h5>Digital Image Processing</h5>
                                                                        <h4><a class = "btn" href = "#"> Ver</a>
                                                                            <span class = "pull-right">$2800</span>
                                                                        </h4>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class = "col-md-4">
                                                                <div class = "thumbnail">
                                                                    <a href = "#"><img src = "img/Alicia en el pais de las maravillas.jpg" alt = "Compra más" style = "width:150px; height:225px;"/>
                                                                    </a>
                                                                    <div class = "caption">
                                                                        <h5>Alicia en el pais de las maravillas</h5>
                                                                        <h4><a class = "btn" href = "#"> Ver</a>
                                                                            <span class = "pull-right">$220</span>
                                                                        </h4>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class = "item">
                                                        <div class = "row">
                                                            <div class = "col-md-4">
                                                                <div class = "thumbnail">

                                                                    <a href = "#"><img src = "img/El senor de los anillos.jpg" alt = "Compra más" style = "width:150px; height:225px;"/>
                                                                    </a>
                                                                    <div class = "caption">
                                                                        <h5>El senor de los anillos</h5>
                                                                        <h4><a class = "btn" href = "#"> Ver</a>
                                                                            <span class = "pull-right">$312</span>
                                                                        </h4>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class = "col-md-4">
                                                                <div class = "thumbnail">

                                                                    <a href = "#"><img src = "img/Historia de dos ciudades.jpg" alt = "Compra más" style = "width:150px; height:225px;"/>
                                                                    </a>
                                                                    <div class = "caption">
                                                                        <h5>Historia de dos ciudades</h5>
                                                                        <h4><a class = "btn" href = "#"> Ver</a>
                                                                            <span class = "pull-right">$564</span>
                                                                        </h4>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <a data-slide="prev" href="#media" class="left carousel-control">‹</a>
                                            <a data-slide="next" href="#media" class="right carousel-control">›</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
            </div>
        </form>
        <br/><br/><br/>
        <!--Catálogo de libros -->

</body>
</html>