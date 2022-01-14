
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
public class servletVaciarCarro extends HttpServlet {



   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("add");
            getServletContext().getRequestDispatcher("/PaginaPrincipalCliente.jsp").forward(request, response);
        
    }

}
