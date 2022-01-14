package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Benjamin
 */
public class servletProducto extends HttpServlet {

   

  
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id=Integer.parseInt(request.getParameter("id"));
        HttpSession sesion=request.getSession();
            sesion.setAttribute("id", id);
            getServletContext().getRequestDispatcher("/detalleProducto.jsp").forward(request, response);
    }


}
