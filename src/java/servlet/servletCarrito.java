
package servlet;

import clases.add;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Benjamin
 */
public class servletCarrito extends HttpServlet {

    

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd;
        HttpSession sesion=request.getSession();
        ArrayList<add> lista=new ArrayList<>();
        String id=request.getParameter("id");
        
        
        if(sesion.getAttribute("add")!=null){
            int ID=Integer.parseInt(id);
            add a=new add(ID);
            lista=(ArrayList<add>) sesion.getAttribute("add");
            //lista=(ArrayList)sesion.getAttribute("mostrar");
            
            for (add agregar : lista) {
                if(agregar.getId()==(a.getId())){
                lista.remove(agregar);
                sesion.setAttribute("id", id);
                sesion.setAttribute("error", "El producto ya se encuentra en el carrito");
                rd=request.getRequestDispatcher("/PaginaPrincipalCliente.jsp");
                rd.forward(request, response);
                break;
                }
            }
           
            lista.add(a);
            sesion.removeAttribute("add");
            sesion.setAttribute("add", lista);
            rd=request.getRequestDispatcher("/PaginaPrincipalCliente.jsp");
            rd.forward(request, response);
        }else{
            ArrayList<add> lista2=new ArrayList<>();
            int ID=Integer.parseInt(id);
            add a=new add(ID);
            lista2.add(a);
            sesion.setAttribute("add", lista2);
            rd=request.getRequestDispatcher("/PaginaPrincipalCliente.jsp");
            rd.forward(request, response);

        }
        
    }

}
