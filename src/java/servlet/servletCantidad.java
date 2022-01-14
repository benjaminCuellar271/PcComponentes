/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import clases.BDD;
import clases.Cantidad;
import clases.Producto;
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
public class servletCantidad extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd;
        HttpSession sesion=request.getSession();
        
        //lista para los atributos del formulario que le enviamos nuevo desde el carro con la cantidad
        ArrayList<add> lista = new ArrayList<>();
        
        
        ArrayList<Producto> listaProductos = new ArrayList<>();
        
        //LISTA NUEVA CON LA CANTIDAD EDITADA
        ArrayList<Cantidad> listaCantidad=new ArrayList<>();

        lista = (ArrayList) sesion.getAttribute("add");
        int x=0;
                    int id=0;
                    String m="";
                    int cantidad=0;
                    for(add a: lista){
                        x=x+1; 
                        m="id"+x;
                        id=Integer.parseInt(request.getParameter(m));
                        listaProductos=BDD.consultaProductos2(id);
                        for(Producto pro: listaProductos){
                            id=pro.getId_producto();
                            break;
                        }
                        if("".equals(request.getParameter("cantidad"+x))){
                            cantidad=1;
                        }else{
                            cantidad=Integer.parseInt(request.getParameter("cantidad"+x));
                        }

                        Cantidad c=new Cantidad(id, cantidad);
                        listaCantidad.add(c);
                    }
                    sesion.setAttribute("cantidad", listaCantidad);
                    //REDIRIGE AL CHECKOUT
        getServletContext().getRequestDispatcher("/checkout.jsp").forward(request, response);
        
        
        
    }

}
