
package servlet;

import clases.add;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Benjamin
 */
public class servletEliminarProductoCarro extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        HttpSession sesion = request.getSession();
        int id = Integer.parseInt(String.valueOf(request.getParameter("id")));
        ArrayList <add> lista = new ArrayList<add>();
        lista = (ArrayList)sesion.getAttribute("add"); //add es la lista donde estan los id de los productos del carro
        for(add produc: lista){
            int idproduct = produc.getId();
            if(idproduct == id ){
                lista.remove(produc);
                break;
            }
        }
        //PARA MANDAR LA LISTA NUEVA SIN EL PRODUCTO BORRADO
        sesion.setAttribute("add", lista);
        
        //PARA QUE COMPRUEBE SI EL CARRO ESTA VACIO Y SE REDIRRECIONA AL CARRO PERO CON LA LISTA VACIA
        if(lista.isEmpty()){
            sesion.removeAttribute("add");
            
        }
        getServletContext().getRequestDispatcher("/carro.jsp").forward(request, response);
    }


}
