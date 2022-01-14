<%-- 
    Document   : PanelAdmin
    Created on : 03-ene-2022, 20:10:23
    Author     : Benjamin
--%>

<%@page import="clases.Cliente"%>
<%@page import="clases.BDD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <!-- JQUERY PAGINACION -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.4/jquery.min.js"></script>
        <title>Vista Admin | PcComponentes</title>

        <style>
            .btn-warning{
                background-color: orange;
                color: white;
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
        </nav><!--/Barra de navegacion-->



        <!-- BARRA DE NAVEGACION BIENVENIDA ADMIN -->

        <nav class="navbar navbar-expand-sm bg-warning navbar-dark justify-content-end">


            <%
                HttpSession sesion = request.getSession();

            %>

            <ul class="navbar-nav ">

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

            </ul>



        </nav>
        <!-- -->
        
        <!-- TITULO DEL PANEL -->
        
          <div class="container-fluid card-group text-center">


            <!-- BUSQUEDA POR FECHAS DE LOS PEDIDOS -->
            <div class="card mt-4 px-5">
                <div class="card-body" >
                    <div class="card-title"><h2><strong>ADMIN DASHBOARD</strong></h2></div>
                </div>
            </div>
          </div>
        <!-- -->



        <div class="container-fluid card-group text-center">


            <!-- BUSQUEDA POR PRODUCTOS PEDIDOS -->
            <div class="card mt-4 px-5">
                <div class="card-body" >
                    <div class="card-title"><h2><strong>BUSQUEDA POR PRODUCTOS</strong></h2></div>
                    <br>
                    <form method="POST" action="muestraProductosAdmin.jsp">
                        <div class="text-center">
                            <select id="producto" name="producto" class="form-select" aria-label="Default select example">
                                <option selected>Seleccione el Producto</option>
                                <%
                                    ArrayList<Producto> listaProd = BDD.getTodosProductos();
                                    for (int i = 0; i < listaProd.size(); i++) {
                                %>
                                <option value="<%=listaProd.get(i).getId_producto()%>"><%=listaProd.get(i).getNombre_producto()%></option>
                                <%}%>
                            </select>
                            <br>
                            <hr>
                            <button type="submit" class="btn btn-warning" style="width: 150px">Buscar</button>
                        </div>
                    </form>
                </div>  
            </div> 

            <!--################################ -->


            <!-- BUSQUEDA POR FECHA -->

            <div class="card mt-4 px-5">
                <div class="card-body" >
                    <div class="card-title"><h2><strong>BUSQUEDA PEDIDOS POR FECHA</strong></h2></div>
                    <form method="POST" action="mostrarPedidosFechaAdmin.jsp">
                        <div class="text-center">
                            <label for="fecha1" class="form-label"><strong>FECHA INICIAL</strong></label>
                            <input type="date" class="form-control" id="fecha1" name="fecha1" required="">
                            <hr>
                            <label for="fecha2" class="form-label"><strong>FECHA FINAL</strong></label>
                            <input type="date" class="form-control mb-3" id="fecha2" name="fecha2" required="">

                            <button type="submit" class="btn btn-warning" style="width: 150px">Buscar</button>
                        </div>
                    </form>
                </div>  
            </div> 

            <!-- ############################## -->

            <!-- BUSQUEDA POR CLIETES -->


            <div class="card mt-4 px-5">
                <div class="card-body" >
                    <div class="card-title"><h2><strong>BUSQUEDA POR CLIENTES</strong></h2></div>
                    <br>
                    <form method="POST" action="muestraClienteAdmin.jsp">
                        <div class="text-center">
                            <select id="cliente" name="cliente" class="form-select" aria-label="Default select example">
                                <option selected>Seleccione el Cliente</option>
                                <%
                                    ArrayList<Cliente> listaCli = BDD.getClientes();
                                    for (int i = 0; i < listaCli.size(); i++) {
                                %>
                                <option value="<%=listaCli.get(i).getId()%>"><%=listaCli.get(i).getNombre()%></option>
                                <%}%>
                            </select>
                            <br>
                            <hr>
                            <button type="submit" class="btn btn-warning" style="width: 150px">Buscar</button>
                        </div>
                    </form>
                </div>  
            </div> 



            <!-- ################################## -->


        </div>      
    </div>

    <br>

    <!-- Footer -->
    <footer class="text-center text-lg-start bg-light text-muted fixed-bottom">

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