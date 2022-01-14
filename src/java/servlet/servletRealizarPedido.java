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
public class servletRealizarPedido extends HttpServlet {

  

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /*
         HttpSession sesion = request.getSession();
         RequestDispatcher rd;
         ArrayList<add> lista = new ArrayList<add>();
         
         //CREAMOS UNA NUEVA LISTA PARA AGREGAR LOS PRODUCTOS DEL CARRO CON TODOS SUS PARAMETROS
         ArrayList<Producto> NuevaListaProductos = new ArrayList<Producto>();
         //----------------------------------------------------------------------
         lista = (ArrayList) sesion.getAttribute("add");
         //RECOGE EL EMAIL PARA SACAR EL ID DEL QUE REALIZA EL PEDIDO
         String email = String.valueOf(sesion.getAttribute("nombre"));
         int idusuarioPedido = BDD.consultaIDUsuario(email);
         //RECOGEMOS EL VALOR DEL TOTAL DEL PEDIDO Y REDONDEAMOS EL VALOR DEL TOTAL DEL PEDIDO
         double totalPedido = Math.round(Double.parseDouble(String.valueOf(sesion.getAttribute("total")))*100.0)/100.0;
         BDD.realizarPedido(idusuarioPedido,totalPedido);
         
         //COGEMOS EL ID DEL ULTIMO PEDIDO PARA LA TABLA DE DETALLEPEDIDO
         int idUltimoPedido = BDD.consultaIDUltimoPedido();
         for(add a: lista){
             Producto product = BDD.productos(a.getId());
             NuevaListaProductos.add(product);
         }
         
         int cantidadProducto = 1;
         BDD.detallesPedidosRealizados(idUltimoPedido, NuevaListaProductos, cantidadProducto);
         //PARA BORRAR EL CARRITO CUANDO SE REALIZA EL PEDIDO
         sesion.removeAttribute("add");
         
        rd=request.getRequestDispatcher("/finalizacionPedido.jsp");
        rd.forward(request, response);
        
        */


        
        HttpSession sesion = request.getSession();
        ArrayList<Cantidad> lista = new ArrayList<>();
        lista=(ArrayList) sesion.getAttribute("cantidad");
        String email = String.valueOf(sesion.getAttribute("nombre"));
        int idusuarioPedido = BDD.consultaIDUsuario(email);
        double totalPedido = Math.round(Double.parseDouble(String.valueOf(sesion.getAttribute("total")))*100.0)/100.0;
        BDD.realizarPedido(idusuarioPedido,totalPedido);
        int idUltimoPedido = BDD.consultaIDUltimoPedido();
        BDD.detallesPedidosRealizados(idUltimoPedido, lista);
        sesion.removeAttribute("add");
        sesion.removeAttribute("cantidad");
        getServletContext().getRequestDispatcher("/finalizacionPedido.jsp").forward(request, response);
         
         
         
         
    }

    
}
