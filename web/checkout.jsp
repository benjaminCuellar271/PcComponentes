
<%@page import="clases.Cantidad"%>
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
        <title>CHECKOUT | PcComponentes</title>
        
        
       
        
       
        
        
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




        <br>

        <div class="row">
            <div class="col-8">
                <div class="container-fluid text-left" style="margin-left: 5%;">



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
                                    <th scope="col">Elegir Unidades</th>
                                    <th scope="col">Total</th>
                                    <th scope="col"></th>



                                </tr>
                            </thead>
                            <%
                                ArrayList<Cantidad> lista = new ArrayList<>();
                                ArrayList<Producto> listaProductos = new ArrayList<>();
                                
                                lista = (ArrayList) sesion.getAttribute("cantidad");
                                double total = 0;
                                double subtotal = 0;
                                int cantidad = 0;

                                for (Cantidad cant : lista) {
                                    cantidad = cant.getCantidad();
                                    listaProductos = BDD.carroProductos(cant.getId());
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
                                        <%= cantidad %>
                                    </td>
                                    
                                    <td><%= subtotal%>€</td>
                                    <td>
                                         
                                    </td>
                                </tr>
                                <tr>
                            </tbody>
                            
                            <%}
                                }%>
                        </table>
                        
                        
                        

                        
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
                                    
                                    
                            
                          
                            <!--MANDA NUEVO FORMULARIO CON LOS NUEVOS PARAMETROS-->
                            <a href="servletRealizarPedido" class="btn btn-warning btn-block" style="width: 100%; color: white">Realizar Pedido</a>
                            
                          
                        </div>
                    </div>
                </div>
            </div>



        </div>


    </div>

    
   

    <br>
    


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