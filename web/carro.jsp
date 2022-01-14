<%-- 
    Document   : carro
    Created on : 04-ene-2022, 13:37:42
    Author     : Benjamin
--%>

<%@page import="clases.BDD"%>
<%@page import="clases.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.add"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <title>Detalle de mi carrito | PcComponentes</title>
        
        <script>
            
            function envio_nuevoFormulario(){
                document.nuevoFormularioCantidad.submit();
            }
            
        </script>
        
        
        <%
            HttpSession sesion = request.getSession();
        %>

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



        <!-- ALBUM PARA EL CARRITO DE LA COMPRA-->

        <br>

        <div class="row">
            <div class="col-8">
                <div class="container-fluid text-left" style="margin-left: 5%;">




                    <div class="alert alert-dark">
                        <strong>¡Aprovecha!</strong> Hoy envío gratis en pedidos superiores a 50€. <a href="https://www.pccomponentes.com/condiciones-de-compra">Ver condiciones.</a>
                    </div>

                    <%
                        if (sesion.getAttribute("add") == null) {

                    %>
                    <div class="alert alert-danger">
                        <strong>El carrito se encuentra vacio</strong>
                    </div>

                    <!-- -->


                    <div class="card mt-4" >
                        <div class="card-body">
                            <div class="card-title">
                                <h2></h2>
                            </div>

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col"></th>
                                        <th scope="col">Articulo</th>
                                        <th scope="col"></th>
                                        <th scope="col">Precio</th>
                                        <th scope="col">Unidades</th>
                                        <th scope="col">Total</th>


                                    </tr>
                                </thead>




                                <tbody>
                                    <tr>
                                        <th scope="row"></th>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>

                                    </tr>
                                    <tr>
                                </tbody>
                            </table>

                            <div class="btn-group clearfix">
                                <form  action="PaginaPrincipalCliente.jsp">
                                    <button type="submit" class="btn btn-warning float-right" style="color:white;">Seguir Comprando</button>
                                </form>

                            </div>


                        </div>
                    </div>
                </div>
                <!-- -->





                <!-- ############################################################################################  -->

                <%                     } else {
                %>

            
                <div class="card mt-4" >
                    <div class="card-body">
                        <div class="card-title">
                            <h2></h2>
                        </div>
                       <form class="form-inline margen" action="servletCantidad" name="nuevoFormularioCantidad" method="POST">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col"></th>
                                    <th scope="col">Articulo</th>
                                    <th scope="col"></th>
                                    <th scope="col">Precio</th>
                                    <th scope="col">Elegir Unidades</th>
                                    <th scope="col">Total</th>
                                    <th scope="col"></th>



                                </tr>
                            </thead>
                            <%
                                ArrayList<add> lista = new ArrayList<>();
                                ArrayList<Producto> listaProductos = new ArrayList<>();
                                //add es la lista que contiene los id de los productos del carro
                                lista = (ArrayList) sesion.getAttribute("add");
                                double total = 0;
                                double subtotal = 0;
                                int cantidad = 1;
                                int x = 1;
                                for (add inc : lista) {

                                    listaProductos = BDD.carroProductos(inc.getId());
                                    for (Producto product : listaProductos) {

                                        subtotal = Math.round(product.getPrecio_producto() * 100.0) / 100.0 * cantidad;
                                        total = total + subtotal;
                                
                                //CREAMOS SESION PARA OBTENER EL TOTAL DEL PEDIDO 
                                sesion.setAttribute("total", total);

                            %>



                            <tbody>
                                <tr>
                                    <th scope="row"></th>
                                    <td><img src="ImagenesComponentes/<%= product.getFoto_producto()%>" class="img-fluid-thumbnail" style="width: 150px; height: 130px" alt="producto"/></td>
                                    <td><strong><%= product.getNombre_producto()%></strong></td>
                                    <td><%= product.getPrecio_producto()%>€</td>
                                    <!-- AÑADIR CANTIDAD CON BOTON -->
                                    <td>
                                        <div class="btn-group">
                                            
                                            <input type="number" class="form-control" placeholder="1" name="cantidad<%=x%>" style="width: 65px; margin-right: 5px;" min="1" >
                                            <input type="text" hidden="" name="id<%=x%>" value="<%= product.getId_producto() %>">
                                        </div>

                                    </td>
                                    
                                    <td><%= subtotal%>€</td>
                                    <td>
                                        <div class="container">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                            </svg><a href="servletEliminarProductoCarro?id=<%=product.getId_producto()%>">Eliminar</a>
                                        </div>    
                                    </td>
                                </tr>
                                <tr>
                                    <%
                                        x = x+1;
                                    %>
                            </tbody>
                            
                            <%}
                                }%>
                                
                         
                        </table>
                        </form>
                        
                        <div class="btn-group clearfix">
                             <a href="servletCancelarPedido" class="btn btn-warning float-right" style="color:white;" >Cancelar Pedido</a>
                            <a href="PaginaPrincipalCliente.jsp" class="btn btn-warning float-right" style="color:white;" >Seguir Comprando</a>
                        </div>


                    </div>
                </div>
                        
            




            </div>
        </div>
        <!--divv columna-->
        <div class="col-4">

            <div class="container-fluid text-left">

                <div class="card mt-4" style="margin-left:5%; margin-right: 25%;">
                    <div class="card-body">
                        <div class="card-title">


                            <table class="table">
                                <thead>
                                    <tr>

                                        <th scope="col">Total Compra:</th>


                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><%= Math.round(total * 100.0) / 100.0%>€</td>
                                    </tr>
                                    <tr>
                                </tbody>
                            </table>
                                    
                                    
                            <%  if (sesion.getAttribute("nombre") == null) {%>
                                <!-- The Modal -->
                                    <div class="modal" id="myModal">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Log in Necesario</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>

                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    Es necesario hacer Login para realizar pedidos
                                                </div>

                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                <button type="button" class="btn btn-warning btn-block" data-toggle="modal" data-target="#myModal" style="width: 100%; color: white">Realizar Pedido</button>

                            
                            <% }else{%>

                          
                            <!--MANDA NUEVO FORMULARIO CON LOS NUEVOS PARAMETROS-->
                            <a href="javascript:envio_nuevoFormulario()" class="btn btn-warning btn-block" style="width: 100%; color: white">Realizar Pedido</a>
                            
                            <% }%>
                        </div>
                        <hr>
                        <div class="text-center">
                        <a href="login.jsp" >Iniciar Sesion</a>
                        </div>
                    </div>
                </div>
            </div>



        </div>


    </div>

    <% }%>
    <!--DIV ROW-->

    <br>
    <!--CARROUSEL DE PRODUCTOS -->
    <div class="row">

        <div class="col-7">
            <div class="container-fluid text-left" style="margin-left: 5%;">


                <div class="card mt-4" >
                    <div class="card-body">
                        <div class="card-title">
                            <h2>Productos de Interes</h2>
                        </div>

                        <!-- INSERCION DEL CARROUSEL -->


                        <div id="demo" class="carousel slide" data-ride="carousel">



                            <!-- The slideshow -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="ImagenesComponentes/procesador9.JPG" alt="Procesadores" width="200" height="150">
                                    <img src="ImagenesComponentes/procesador5.JPG" alt="Procesadores" width="200" height="150">
                                    <img src="ImagenesComponentes/procesador1.JPG" alt="Procesadores" width="200" height="150">
                                    <img src="ImagenesComponentes/procesador2.JPG" alt="Procesadores" width="200" height="150">
                                    <img src="ImagenesComponentes/procesador3.JPG" alt="Procesadores" width="200" height="150">


                                </div>
                                <div class="carousel-item">
                                    <img src="ImagenesComponentes/placaBase1.JPG" alt="Placas base" width="200" height="200">
                                    <img src="ImagenesComponentes/placaBase9.JPG" alt="Placas base" width="200" height="200">
                                    <img src="ImagenesComponentes/placaBase3.JPG" alt="Placas base" width="200" height="200">
                                    <img src="ImagenesComponentes/placaBase4.JPG" alt="Placas base" width="200" height="200">
                                    <img src="ImagenesComponentes/placaBase5.JPG" alt="Placas base" width="200" height="200">

                                </div>
                                <div class="carousel-item">
                                    <img src="ImagenesComponentes/grafica9.JPG" alt="Graficas" width="200" height="200">
                                    <img src="ImagenesComponentes/grafica7.JPG" alt="Graficas" width="200" height="200">
                                    <img src="ImagenesComponentes/grafica4.JPG" alt="Graficas" width="200" height="200">
                                    <img src="ImagenesComponentes/grafica1.JPG" alt="Graficas" width="200" height="200">
                                    <img src="ImagenesComponentes/grafica10.JPG" alt="Graficas" width="200" height="200">


                                </div>
                            </div>

                            <!-- Left and right controls -->
                            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a class="carousel-control-next" href="#demo" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                            </a>
                        </div>


                        <!-- -->
                    </div>
                </div>
            </div>
        </div>
    </div>





    <br>



    <!-- Footer -->
    <footer class="text-center text-lg-start bg-light mx-auto ">

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