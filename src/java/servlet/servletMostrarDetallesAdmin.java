package servlet;

import clases.BDD;
import clases.Detalles;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Benjamin
 */
public class servletMostrarDetallesAdmin extends HttpServlet {

  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd;
        HttpSession sesion=request.getSession();
        
        int idPedido=Integer.parseInt(request.getParameter("idPedido"));
       
        sesion.setAttribute("idPedido", idPedido);
        ArrayList<Detalles> listaDetalles=BDD.consultaDetalles(idPedido);
        ServletContext contexto=getServletContext();
        contexto.setAttribute("lista", listaDetalles);
       
        rd=contexto.getRequestDispatcher("/listadoDetallesAdmin.jsp");
        rd.forward(request, response);
        
        
        
    }

 

}
