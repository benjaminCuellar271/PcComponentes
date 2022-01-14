<%-- 
    Document   : finalizacionPedido
    Created on : 08-ene-2022, 0:44:04
    Author     : Benjamin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
                            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
                            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>

                                <title>Pedido Realizado | PcComponentes</title>

                                <style>
                                    .btn-warning{
                                        background-color: orange;
                                    }

                                    .alert-dark{
                                        background-color: black;
                                        color: white;
                                    }

                                    .carousel-inner img {
                                        width: 200px;
                                        height: 150px;
                                    }
                                    
                                    
                                </style>
                                </head>

                                <body>


                                    <!--Barra de navegacion-->
                                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                                        <div class="container-fluid">
                                            <!--Imagenprincipal-->
                                            <a class="navbar-brand" href="#"><img src="imagen/logo-pccomponentes.svg" width="300"></a>
                                            <!--Boton de redireccion al registro-->
                                            <!-- <a href="registro.html" class="btn btn-warning me-4">Registrarse</a> -->
                                        </div>
                                    </nav>
                                    <!--/Barra de navegacion-->


                                    <!-- CONTENIDO DE LA PAGINA -->

                                    <!-- ############################################### --> 


                                    <div class="container-fluid " >



                                        <div class="row"><!--DIV PARA LA FILA DE LAS DOS COLUMNAS-->

                                            <div class="col-4  mx-auto" style="margin-top: 5%;">

                                                <div class="card ">
                                                    <div class="card-body">

                                                        <div class="container-fluid text-center">
                                                              <h3 class="text-success"><span><svg  style="margin-top: 30px; " xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                                                                        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                                                                    </svg></span></h3>
                                                            <h3 class="text-success"><strong>TU PEDIDO HA SIDO RECIBIDO CON ÉXITO</strong></h3>
                                                            <h3 class="text-success"><strong>!GRACIAS POR TU COMPRA!</strong></h3>
                                                          
                                                            <br>
                                                        </div>
                                                        
                                                        <hr class="text-success">
                                                        <br>
                                                            <div class="alert alert-success text-center">
                                                                <p>Te informaremos por correo electronico cuando el pedido salga de nuestas instalaciones, recuerde
                                                                que puedes ver el estado del envio, asi como consultar otros datos de tus pedidos</p>
                                                                
                                                            </div>

                                                            <form action="servletVaciarCarro"  method="POST">
                                                                <button type="submit" class="btn btn-dark" style="color:white; width:200px; margin-left: 32%;">Volver</button>
                                                            </form>
                                                            

                                                          
                                                    </div>
                                                </div>


                                            </div>

                                        </div>

                                    </div>


                                    <!-- ########################################### --> 
                                    <!-- -->






                                    <!-- Footer -->
                                    <footer class="text-center text-lg-start bg-light text-muted fixed-bottom ">

                                        <!-- Copyright -->
                                        <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                                            © 2021 Copyright:
                                            <a class="text-reset fw-bold" href="">PcComponentes.com</a>
                                        </div>
                                        <!-- Copyright -->
                                    </footer>
                                    <!-- Footer -->

                                </body>

                                </html>