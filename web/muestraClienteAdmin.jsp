<%-- 
    Document   : muestraClienteAdmin
    Created on : 11-ene-2022, 20:33:09
    Author     : Benjamin
--%>

<%@page import="clases.Pedido"%>
<%@page import="clases.BDD"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <%

            HttpSession sesion = request.getSession();


        %>



        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

        <!-- JQUERY PAGINACION -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.4/jquery.min.js"></script>

        <title>Panel Admin | PcComponentes</title>


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


        <!-- BARRA DE NAVEGACION -->

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



        <!-- ################################################ -->

        <!-- LISTADO DEFINITIVO PEDIDOS DEL PRODUCTO -->

        <div class="row">
            <div class="col-7">
                <div class="container-fluid text-left" style="margin-left: 5%;">

                    <div class="card mt-4" >
                        <div class="card-body">
                            <div class="card-title">
                                <h2></h2>
                            </div>

                            <table class="table">
                                <thead>
                                    <tr>
                                      <th scope="col">ID PEDIDO</th>
                                        <th scope="col">ID USUARIO</th>
                                        <th scope="col">FECHA PEDIDO</th>
                                        <th scope="col">PRECIO TOTAL</th>
                                        <th>DETALLES FACTURA</th>

                                    </tr>
                                </thead>
                                <%                 
                                    String idcliente=request.getParameter("cliente");

                                    ArrayList<Pedido> listaPedidos=BDD.getPedidosCliente(idcliente);
                                    for(int i=0;i<listaPedidos.size();i++){
                                %>

                                <tbody>
                                    <tr>
                                        <td> <%=listaPedidos.get(i).getId_pedido()%></td>
                                        <td><%=listaPedidos.get(i).getNombre_usuario()%></td>
                                        <td><%=listaPedidos.get(i).getFecha_pedido()%></td>
                                        <td><%=listaPedidos.get(i).getTotal_pedido()%>€</td>
                                        <td><a href="servletMostrarDetallesAdmin?idPedido=<%=listaPedidos.get(i).getId_pedido() %>" class="btn btn-warning">Mostrar Factura</a></td>

                                    </tr>

                                </tbody>
                                
                                <% }%>
                            </table>

                            <div class="btn-group clearfix">
                                <form  action="PanelAdmin.jsp">
                                    <button type="submit" class="btn btn-warning" style="color:white;">Volver</button>
                                </form>

                            </div>


                        </div>
                    </div>
                </div>

            </div>
        </div>



    </body>
</html>
