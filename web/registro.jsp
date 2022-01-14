<%-- 
    Document   : registro
    Created on : 03-ene-2022, 19:25:54
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
    <title>Registra tu cuenta | PcComponentes</title>

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

    
    <div class="container-fluid text-center">
        

    <!-- ETIQUETAS DIV PARA EL FORMULARIO-->
        <div class="card mt-4" style="margin-left:25%; margin-right: 25%;">
        <div class="card-body" >
    <div class="card-title"><h2>Crear Cuenta</h2></div>
    <form method="POST" action="servletRegistro"> <!--SE TIENE QUE DIRIGIR A LA PAGINA PRINCIPAL DESPUES DE REGISTRAR LA CUENTA-->
        <input type="text" name="user" placeholder="Nombre" class="form-control" pattern="[A-Za-zá-úÁ-Ú\s\W]{3,15}" required><br>
         <input type="text" name="apellido" placeholder="Apellidos" class="form-control" pattern="[A-Za-zá-úÁ-Ú\s\W]{3,30}" required><br>
         <input type="email" name="email" placeholder="Email" class="form-control" pattern="\w\S{1,}\w@\w\S{1,}\w.{1}\w{1,4}" required><br>
         <input type="password" name="password" placeholder="Password" class="form-control" pattern="(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!=%*?&])[A-Za-z\d@$!=%*?&]{8,}" required><br>
         <input type="text" name="direccion" placeholder="Direccion" class="form-control" required><br>
         <input type="text" name="telefono" placeholder="telefono" class="form-control" pattern="([(](\+34)[)])?\s?[0-9]\d{8}" required><br>
         
         <div class="text-center">
        
            <input type="submit" value="Crear Cuenta" class="btn btn-warning" style="width: 200px">
        
        </div>
    </form>
    
     
    
     <hr style="width: 800px; margin-left: 50px">
    
     <div class="text-center">
            <p>Ya tienes cuenta?</p>
        </div>
        
        <div class="text-center">
            <form action="login.jsp" method="POST">
            <input type="submit" value="Iniciar Sesión" class="btn btn-warning" style="width: 200px">
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