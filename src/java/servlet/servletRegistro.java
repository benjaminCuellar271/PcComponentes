
package servlet;

import clases.BDD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class servletRegistro extends HttpServlet {

    
  
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd;
        
        String user = request.getParameter("user");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        
        BDD.registrar(user, apellido, email, password, direccion, telefono);
        
        
         rd = request.getRequestDispatcher("/login.jsp");
         rd.forward(request, response);
        
        
    }

  
}
