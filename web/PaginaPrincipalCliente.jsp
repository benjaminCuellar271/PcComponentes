<%-- 
    Document   : PaginaPrincipalCliente
    Created on : 03-ene-2022, 19:26:48
    Author     : Benjamin
--%>

<%@page import="clases.Producto"%>
<%@page import="clases.BDD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.Categoria"%>
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
        
        
        
        
         <!-- JQUERY PAGINACION -->
       
        <!-- -->
        
        <link rel="stylesheet" href="CSS/cssCard.css"/>
        <title>Bienvenido | PcComponentes</title>

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
                HttpSession sesion = request.getSession();
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

                            <a class="dropdown-item-text" href="servletCerrarSesion">Log Out<img class="rounded-0" src="imagen/IconoLogOut.png" width="20" height="20" alt="LogOut" style="margin-left:15px"/></a>

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
        
        <!-- BARRA DE NAVEGACION PARA LAS CATEGORIAS DE LOS PRODUCTOS -->
        
        
        <nav class="navbar navbar-expand-sm bg-light navbar-dark justify-content-center">

            <ul class="navbar-nav ">
                 <% ArrayList<Categoria> listaCategorias = BDD.consultaCategorias();
                            for (Categoria cat : listaCategorias) {
                                
                        %>
                
                <li class="nav-item active">
                    <form action="PaginaPrincipalCliente.jsp" method="POST">
                        <input type="text" name="idCategoria" value="<%=cat.getId_categoria()%>" hidden="">
                        <button type="submit" class="btn btn-outline-dark" style="margin-right: 25px;">
                            <!-- --><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cpu" viewBox="0 0 16 16">
  <path d="M5 0a.5.5 0 0 1 .5.5V2h1V.5a.5.5 0 0 1 1 0V2h1V.5a.5.5 0 0 1 1 0V2h1V.5a.5.5 0 0 1 1 0V2A2.5 2.5 0 0 1 14 4.5h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14v1h1.5a.5.5 0 0 1 0 1H14a2.5 2.5 0 0 1-2.5 2.5v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14h-1v1.5a.5.5 0 0 1-1 0V14A2.5 2.5 0 0 1 2 11.5H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2v-1H.5a.5.5 0 0 1 0-1H2A2.5 2.5 0 0 1 4.5 2V.5A.5.5 0 0 1 5 0zm-.5 3A1.5 1.5 0 0 0 3 4.5v7A1.5 1.5 0 0 0 4.5 13h7a1.5 1.5 0 0 0 1.5-1.5v-7A1.5 1.5 0 0 0 11.5 3h-7zM5 6.5A1.5 1.5 0 0 1 6.5 5h3A1.5 1.5 0 0 1 11 6.5v3A1.5 1.5 0 0 1 9.5 11h-3A1.5 1.5 0 0 1 5 9.5v-3zM6.5 6a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
</svg> <!-- -->
                            <%=cat.getNombre_categoria()%></button>
                   </form>
                </li>
                <% }%>
            </ul>
           
        </nav>

        <br>
        
        
        <!--  ####################################################### -->


            <!-- PRODUCTOS -->
            
            
            
           <div class=" row row-cols-1 row-cols-sm-2 row-cols-md-3  g-3" style="margin-right: 150px; margin-left: 150px;">
               
                   
                    <%
                            String idCategoria = request.getParameter("idCategoria");
                            if(idCategoria == null){
                            ArrayList<Producto> producto = BDD.consultaProductos((int) Math.floor(Math.random() * 5 + 1));
                            for (int x = 0; x < producto.size() - 4; x++) {%>
            
            <div class="album py-5  bg-light">
                <div class="container">
                    <div class="col">
                        <div class="card shadow-sm" style="margin-bottom: 15px">
                            <img class="img-fluid mx-auto d-block" style="height: 200px; width: 200px"  src="ImagenesComponentes/<%= producto.get(x).getFoto_producto()%>" alt=""/>

                            <div class="card-body">
                               
                                <p class="card-text"><strong><%= producto.get(x).getNombre_producto()%></strong></p>
                                 <p style="color: orange"><strong><%= producto.get(x).getPrecio_producto()%> €</strong></p>

                                <div class="d-flex justify-content-between align-items-center">
                                   
                                    <div class="btn-group">
                                        <form action="servletProducto" method="post" id="form">
                                            <input type="text" name="id" value="<%= producto.get(x).getId_producto()%>" hidden>
                                            <button type="submit" class="btn btn-warning">Ver producto</button>
                                        </form>
                                        <form action="servletCarrito" method="post">
                                            <input type="text" name="id" value="<%=producto.get(x).getId_producto()%>" hidden>
                                            <input type="text" name="<%=producto.get(x).getId_producto()%>cantidad" value="1" hidden>
                                            
                                            
                                            
                                            
                                            <button type="submit" class="btn btn-warning">Añadir a la cesta</button>

                                        </form>
                                    </div>


                                </div>
                            </div>
                                         
                        </div>
                    </div>
                   
                </div></div>
                 <% } }else{%>
                 
                 
                  <%
                            int id = Integer.parseInt(idCategoria);
                            ArrayList<Producto> producto = BDD.consultaProductos(id);
                            for (int x = 0; x < producto.size(); x++) {%>
                           
                 <div class="album py-5  bg-light">
                <div class="container">
                    <div class="col">
                        <div class="card shadow-sm" style="margin-bottom: 15px">
                            <img class="img-fluid mx-auto d-block" style="height: 200px; width: 200px"  src="ImagenesComponentes/<%= producto.get(x).getFoto_producto()%>" alt=""/>

                            <div class="card-body">
                                <p class="card-text"><strong><%= producto.get(x).getNombre_producto()%></strong></p>
                                 <p style="color: orange"><strong><%= producto.get(x).getPrecio_producto()%> €</strong></p>

                                <div class="d-flex justify-content-between align-items-center">
                                   
                                    <div class="btn-group">
                                        <form action="servletProducto" method="post" id="form">
                                            <input type="text" name="id" value="<%= producto.get(x).getId_producto()%>" hidden>
                                            <button type="submit" class="btn btn-warning">Ver producto</button>
                                        </form>
                                            
                                        <% 
                                            //CUANDO NO ESTE EN EL CARRO LO AÑADE
                                               //if(sesion.getAttribute("error") == null){
                                        
                                        %>
                                            
                                            
                                            
                                        <form action="servletCarrito" method="post">
                                            <input type="text" name="id" value="<%=producto.get(x).getId_producto()%>" hidden>
                                            <input type="text" name="<%=producto.get(x).getId_producto()%>cantidad" value="1" hidden>
                                            
                                            <button type="submit" class="btn btn-warning">Añadir a la cesta</button>
                                            
                                        </form>
                                            
                                            <% //}else{sesion.removeAttribute("error");%>
                                            
                                            
                                           <!-- <button type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal">Añadir a la cesta</button> -->
                                            
                                            
                                            <!--
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

                                                <!-- Modal footer 
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                            
                                            -->
                                            
                                            <% //} %>
                                            
                                            
                                            
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div></div>
                 
                 <% }}%>
                
             
           
        </div><!-- DIV DE LA LAS COLUMNAS DE LOS PRODUCTOS -->
            
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