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
public class servletCarritoComprarYa extends HttpServlet {

   


   
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
            
            for (add agregar : lista) {
                if(agregar.getId()==(a.getId())){
                lista.remove(agregar);
                break;
                }
            }
           
            lista.add(a);
            sesion.removeAttribute("add");
            sesion.setAttribute("add", lista);
            rd=request.getRequestDispatcher("/carro.jsp");
            rd.forward(request, response);
        }else{
            ArrayList<add> lista2=new ArrayList<>();
            int ID=Integer.parseInt(id);
            add a=new add(ID);
            lista2.add(a);
            sesion.setAttribute("add", lista2);
            rd=request.getRequestDispatcher("/carro.jsp");
            rd.forward(request, response);

        }
        
        
    }

}
