package servlet;

import clases.BDD;
import java.io.IOException;
import java.io.PrintWriter;
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
public class servletLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd;
        String usuario = request.getParameter("user");
        String password = request.getParameter("password");
        String passwordBBDD = BDD.consultaUsuario(usuario);
        String perfil = BDD.consultaPerfil(usuario);

        if (password.equals(passwordBBDD) && perfil.equals("cliente")) {
            HttpSession sesionantigua = request.getSession();
            sesionantigua.invalidate();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("nombre", usuario);

            getServletContext().getRequestDispatcher("/PaginaPrincipalCliente.jsp").forward(request, response);

        } else if (password.equals(passwordBBDD) && perfil.equals("admin")) {
            HttpSession sesionantigua = request.getSession();
            sesionantigua.invalidate();
            HttpSession sesion = request.getSession();
            sesion.setAttribute("nombre", usuario);

            getServletContext().getRequestDispatcher("/PanelAdmin.jsp").forward(request, response);

        } else {
            rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
        }
    }

}
