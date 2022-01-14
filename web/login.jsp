<%-- 
    Document   : login
    Created on : 03-ene-2022, 19:25:12
    Author     : Benjamin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>Accede a tu Cuenta | PcComponentes</title>
    

    <style>
        .btn-warning{
            background-color: orange;
            color: white;
        }
    </style>
    
     <script>
  function mostrarContrasena(){
      var tipo = document.getElementById("password");
      if(tipo.type === "password"){
          tipo.type = "text";
      }else{
          tipo.type = "password";
      }
  }
    </script>


</head>


   
<body>



        <!--Barra de navegacion-->
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <!--Imagenprincipal-->
      <a class="navbar-brand" href="PaginaPrincipalCliente.jsp"><img src="imagen/logo-pccomponentes.svg" width="300"></a>
      <!--Boton de redireccion al registro-->
      <!-- <a href="registro.html" class="btn btn-warning me-4">Registrarse</a> -->
    </div>
  </nav><!--/Barra de navegacion-->

  <br>
  <br>

    
    <div class="container-fluid">
        
        
        <div class="row">
            
            
            <div class="col-5">
                <div class="container-fluid" style="margin-left: 10%; margin-top: 4%">
                <div class="">
                    <h5><img class="rounded-0" src="imagen/EnviosLogo.JPG" width="40" height="30" alt="Envios Logo" style="margin-right: 10px"/><strong>Gestiona tus pedidos</strong></h5>
                <p>Ten el control de todos tus pedidos y recibe notificaciones con el seguimiento</p>
    
                <h5><img class="rounded-0" src="imagen/Premium_1.JPG" width="40" height="30" alt="Premium Logo" style="margin-right: 10px"/><strong>¡Unete a Premium!</strong></h5>
                <p>Forma parte de nuestra comunidad y disfruta de todas las ventajas</p>
    
                <h5><img class="rounded-0" src="imagen/ListaDeseos.JPG" width="40" height="50" alt="Lista Deseos" style="margin-right: 10px"/><strong>Lista de deseos personalizada</strong></h5>
                <p>Guarda productos favoritos en las listas de deseos personalizadas</p>
    
    
            </div>
            </div>
            </div>
                
            


           
                <div style="height: 500px; border-right:1px solid black; width: 1px"></div>
          

               

    <!-- ETIQUETAS DIV PARA EL FORMULARIO-->
    
     <div class="col-5" style="margin-left:5%; margin-right: 5%;">
    
    <div style="align-items: center;" class="text-center">
        <div class="card mt-4">
        <div class="card-body">
    <div class="card-title"><h2>Iniciar Sesión</h2></div>
    <form method="POST" action="servletLogin">
         <input type="email" name="user" placeholder="Email" class="form-control" pattern="\w\S{1,}\w@\w\S{1,}\w.{1}\w{1,4}" required><br>
         <div class="input-group">
             <input type="password" name="password" id="password" placeholder="Contraseña" class="form-control" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!=%*?&])[A-Za-z\d@$!=%*?&]{8,}" required><span class="input-group-btn"><button class="btn btn-warning" type="button" onclick="mostrarContrasena()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
  </svg></button></span></div>
         <br>
        <div class="text-center"><input type="submit" value="Iniciar Sesión" class="btn btn-warning" style="width: 200px">
            
        </div>
        
    </form>

        </div>  
        </div> 
        
        <hr>
        <p>¿Eres nuevo cliente?</p>
        <div class="text-center">
            <form action="registro.jsp">
                <input type="submit" value="Crear Cuenta" class="btn btn-warning" style="width: 200px">
            </form>

            </div>

            </div>      
        </div>
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