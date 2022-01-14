<%-- 
    Document   : detalleProducto
    Created on : 06-ene-2022, 18:20:43
    Author     : Benjamin
--%>

<%@page import="clases.BDD"%>
<%@page import="clases.Producto"%>
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
        
       
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"></head>

    <!--  -->
    <link rel="stylesheet" href="CSS/cssCard.css"/>
    
    
    <% HttpSession sesion = request.getSession();
            String id = String.valueOf(sesion.getAttribute("id"));
            int ID = Integer.parseInt(id);
            Producto product = BDD.productos(ID);%>
    
    
    
    <title><%=product.getNombre_producto() %></title>

    <style>
        .btn-warning{
            background-color: orange;
            color: white;
        }

        .nav-item{
            color: black;
        }

        .bg-warning{
            background-color: orange;

        }

        .margen{
            margin-left: 15px;
            margin-right: 20px;
        }

        .alert-warning{
            background-color: #ffcc80;
        }


    </style>

</head>
<body>

    <!--Barra de LOGO-->
    <nav class="navbar  navbar-light bg-light justify-content-end">
        <div class="container-fluid">
            <!--Imagenprincipal-->
            <a class="navbar-brand" href="#"><img src="imagen/logo-pccomponentes.svg" width="300"></a>
        </div>
    </nav><!--/Barra de LOGO-->

    <!-- SEGUNDA BARRA DE NAVEGACION-->
    <!-- ########################################## -->

    <nav class="navbar navbar-expand-sm bg-warning navbar-dark justify-content-end">

        <%
            
            if (sesion.getAttribute("nombre") == null) {
        %>


        <ul class="navbar-nav ">
            <li class="nav-item active">
                <a class="nav-link text-white margen" href="login.jsp">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white margen" href="registro.jsp">Sing Up</a>
            </li>
            <!-- Carro -->
            <li class="nav-item">
                <form class="form-inline margen" action="carro.jsp">
                    <button class="btn btn-warning my-2 my-sm-0" type="submit"><img class="rounded-circle" src="imagen/LogoCarro.jpg" width="20" height="20" alt="Carrito Logo" style="margin-right: 10px"/>Mi Carrito</button>
                </form>
            </li>
        </ul>
        <%
        } else {
        %>
        <ul class="navbar-nav ">
            <li class="nav-item">

                <!-- FALTA EL DROPDOWN CON LA IMAGEN DE PREMIUM DE PCCOMPONENTES -->

                <div class="dropdown">
                    <a class="nav-link active" data-bs-toggle="dropdown" href="#">
                        <img class="rounded-circle" src="imagen/LogoPremium.JPG" width="20" height="20" alt="Premium Logo" style="margin-right: 10px"/>Premium

                    </a>
                    <!-- 
                        <button class="btn btn-warning dropdown-toggle" type="button" data-toggle="dropdown" style="margin-right: 5px;">
                            <img class="rounded-circle" src="imagen/LogoPremium.JPG" width="20" height="20" alt="Premium Logo" style="margin-right: 10px"/>Premium
                        </button>  -->

                    <ul class="dropdown-menu">
                        <li><a><img src="imagen/premium.JPG"></a></li>
                    </ul>
                </div>

            </li>
            <li class="nav-item">
                <div class="dropdown">
                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
                        <img class="rounded-circle" src="imagen/iconoDef.jpg" width="20" height="20" alt="foto perfil" style="margin-right: 10px"/><%=sesion.getAttribute("nombre")%>
                    </button>
                    <div class="dropdown-menu">

                        <a class="dropdown-item-text" href="#">Log Out<img class="rounded-0" src="imagen/IconoLogOut.png" width="20" height="20" alt="LogOut" style="margin-left:15px"/></a>

                    </div>
                </div>

            </li>
            <!-- Carro -->
            <li class="nav-item">
                <form class="form-inline margen" action="carro.jsp">
                    <button class="btn btn-warning my-2 my-sm-0" type="submit"><img class="rounded-circle" src="imagen/LogoCarro.jpg" width="20" height="20" alt="Carrito Logo" style="margin-right: 10px"/>Mi Carrito</button>
                </form>
            </li>
        </ul>


        <%
            }
        %>
    </nav>

    <br>
    <!-- ########################################## -->
    
   

    <div class="container-fluid" >


        <div class="row"><!--DIV PARA LA FILA DE LAS DOS COLUMNAS-->



            <!-- CONTENIDO DE LA PAGINA -->


            <div class="col-3" style="margin-left: 350px"> <!-- Columna para el producto seleccionado anteriormente -->

                <div class="card mb-4 box-shadow">
                    <img class="card-img-top" src="ImagenesComponentes/<%=product.getFoto_producto()%>" width="70" height="400" alt="Card image cap">
                    <div class="card-body">

                    </div>
                </div>

            </div>



            <div class="col-4">

                <div class="card ">
                    <div class="card-body">

                        <div class="container-fluid">
                            <h3><%=product.getNombre_producto() %></h3>
                            <br>
                            <h3 style="color:orange;"><strong><%=product.getPrecio_producto() %> €</strong></h3>
                        </div>
                        <br>
                        <div class="alert alert-secondary">
                            <strong>Envio:</strong>
                            Desde 3,95€ 
                            GRATIS en pedidos de más de 25€ con Premium
                        </div>


                        <div class="alert alert-warning justify-content-end">
                            Garantía de Sustitución en 24h.
                            <a href="https://www.pccomponentes.com/soporte/devoluciones-y-garantias" style="float: right;">+info</a>
                        </div>

                        <div class="btn-group text-center" style="margin-left:">
                            <button type="submit" class="btn btn-warning float-right" style="color:white; width: 80px; margin-right: 5px;"><i class="fas fa-heart"></i></button>

                            
                            <%
                                //if(sesion.getAttribute("error") != null){
                            %>
                            
                            <form  action="servletCarrito" method="POST" id="formCompra">
                                 <input type="text" name="id" value="<%=product.getId_producto()%>" hidden>
                                <button type="submit" class="btn btn-warning float-right text-center " style="color:white; width: 200px">Añadir al Carrito</button>
                            </form>
                                
                                <% //}else{ %>
                                
                                <!-- 
                                <button type="submit" class="btn btn-warning float-right text-center " data-toggle="modal" data-target="#myModal" style="color:white; width: 200px">Añadir al Carrito</button>

                                <div class="modal" id="myModal">
                                            <div class="modal-dialog">
                                            <div class="modal-content">

                                                <!-- Modal Header 
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Producto en Carrito</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>

                                                <!-- Modal body 
                                                <div class="modal-body">
                                                    El producto ya se encuentra en el carrito.
                                                    Para añadir unidades dirigase a el.
                                                </div>

                                                <!-- Modal footer -
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                
                                
                                <%// sesion.removeAttribute("error");} %>
                                -->
                            <form  action="servletCarritoComprarYa" method="POST" id="formCompra">
                                 <input type="text" name="id" value="<%=product.getId_producto()%>" hidden>
                                <button type="submit" class="btn btn-warning float-right text-center " style="color:white; width: 200px">Comprar Ya</button>
                            </form>
                        </div>
                    </div>
                </div>


            </div>

            <hr style="width: 1500px; margin-left: 150px">

            <div class="row">
                <div class="col-4">

                    <div class="container-fluid" style="margin-left: 150px;">


                        <h3><strong>DETALLES:</strong></h3>

                        <%=product.getDetalle_producto() %>
                    </div>
                </div>


            </div>




        </div>


    </div>








    <br>
    <br>
    <hr>



    <!-- ################################################################################################ -->
    <!-- Footer -->
    <footer class="text-center text-lg-start bg-light text-muted">
        <!-- Section: Social media -->
        <section
            class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom"
            >

            <!-- Right -->
        </section>
        <!-- Section: Social media -->

        <!-- Section: Links  -->
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-gem me-3"></i>PcComponentes
                        </h6>
                        <p>
                            PcComponentes es la tienda de tecnología online líder. Con servicio de calidad y atención personalizada, 
                            los clientes tienen a su disposición el mejorprecio de venta online en la más amplia variedad de productos tecnológicos: 
                            entre otros, componentes, portátiles/ordenadores, periféricos, smartphones y móviles, audio, fotografía, vídeo, 
                            redes y cables, artículos gaming, electro-hogar, tablets/eBooks y consumibles.
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Products
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Placas Base</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Procesadores</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Tarjetas Graficas</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Discos Duros</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">RAM</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Useful links
                        </h6>
                        <p>
                            <a href="#!" class="text-reset">Pricing</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Settings</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Orders</a>
                        </p>
                        <p>
                            <a href="#!" class="text-reset">Help</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Contact
                        </h6>
                        <p><i class="fas fa-home me-3"></i> New York, NY 10012, US</p>
                        <p>
                            <i class="fas fa-envelope me-3"></i>
                            info@example.com
                        </p>
                        <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                        <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->

        <!-- Copyright -->
        <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
            © 2021 Copyright:
            <a class="text-reset fw-bold" href="#">PcComponentes.com</a>
        </div>
        <!-- Copyright -->
    </footer>
    <!-- Footer -->
    
    

    
 
</body>
</html>                                                                                        