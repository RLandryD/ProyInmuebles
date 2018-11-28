

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <%@include file="invitado/partials/head.jsp" %>
    </head>
    <body id="page-top">
        <!-- Barra de navegación -->
        <%@include file="invitado/partials/navbar.jsp" %>

        <!-- Contenido -->
        <div id="wrapper">
            <!-- Sidebar -->
            <br><br>

            <!-- Contenido -->
            <div id="content-wrapper">
                <div class="container">
                    <div class="alert alert-success" role="alert">
                        ${mensaje}
                    </div>
                    <br>
                    
                    <div class="card mx-auto">
                        <div class="card-header text-dark text-center">
                            <h3>Login <span class="fas fa-user"></span></h3>
                        </div>
                        <div class="card-body">
                            <form method="post" action="Login" >
                                <input type="hidden" name="accion" value="insertar">
                                <div class="container">
                                    
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label for="costo">Nombre(s)</label>
                                            <input class="form-control" 
                                                   type="text" 
                                                   name="nombre" 
                                                   id="nombre"
                                                   placeholder="Nombre(s)" width="500">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label for="calle">Contraseña</label>
                                            <input class="form-control" 
                                                   type="password" 
                                                   name="password" 
                                                   id="apellido_paterno"
                                                   placeholder="Contraseña">
                                        </div>
                                        
                                    </div>
                                    
                                    
                                </div>
                        
                        <div class="card-footer">
                            <div class="text-center">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <button class="btn btn-success btn-block" type="submit">Iniciar Session</button>
                                        
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                        <a href="Index.jsp"><!--Redireccionara a el posible Index-->
                                            <button class="btn btn-danger btn-block">Cancelar</button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div></form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
