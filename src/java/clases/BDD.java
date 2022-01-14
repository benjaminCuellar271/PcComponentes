package clases;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Benjamin
 */
public class BDD {

    private static String usuario = "root";
    private static String password = "";
    private static String servidor = "localhost:3306";
    private static String bdd = "tiendacomponentes";

    public static Connection crearConexion() {
        Connection cnn = null;
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://" + servidor + "/" + bdd;

        try {
            Class.forName(driver);
            cnn = DriverManager.getConnection(url, usuario, password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cnn;
    }

    
    
    
    
    
    public static String consultaUsuario(String usuario) {

        Connection cnn = null;
        String password = null;
        try {
            cnn = crearConexion();
            String sentenciaSQL = "SELECT password_usuario FROM usuario WHERE email_usuario = '" + usuario + "' ";
            PreparedStatement smt = cnn.prepareStatement(sentenciaSQL);
            ResultSet rs = smt.executeQuery();

            if (rs.next()) {
                password = rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return password;
    }
    
      public static int consultaIDUsuario(String usuario) {

        Connection cnn = null;
        int id = 0;
        try {
            cnn = crearConexion();
            String sentenciaSQL = "SELECT id_usuario FROM usuario WHERE email_usuario = '" + usuario + "' ";
            PreparedStatement smt = cnn.prepareStatement(sentenciaSQL);
            ResultSet rs = smt.executeQuery();

            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return id;
    }

    public static String consultaPerfil(String usuario) {
        Connection cnn = null;
        String tipoUsuario = null;

        try {
            cnn = crearConexion();
            String sentenciaSQL = "SELECT tipo_usuario FROM usuario WHERE email_usuario = '" + usuario + "' ";
            PreparedStatement smt = cnn.prepareStatement(sentenciaSQL);
            ResultSet rs = smt.executeQuery();

            if (rs.next()) {
                tipoUsuario = rs.getString(1);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return tipoUsuario;

    }

    public static void registrar(String user, String apellido, String email, String password, String direccion, String telefono) {
        Connection cnn = crearConexion();

        String sentenciaSQL = "INSERT INTO usuario (nombre_usuario, apellidos_usuario, tipo_usuario, email_usuario, password_usuario, direccion_usuario, telefono_usuario) VALUES ('" + user + "','" + apellido + "','cliente','" + email + "','" + password + "','" + direccion + "','" + telefono + "')";

        try {
            Statement stm = cnn.createStatement();
            stm.executeUpdate(sentenciaSQL);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

    }

    public static ArrayList<Categoria> consultaCategorias() {
        ArrayList<Categoria> listadoCategorias = new ArrayList<Categoria>();

        Connection cnn = crearConexion();

        try {
            String sentenciaSQL = "SELECT * FROM categoria";

            Statement smt;
            smt = cnn.createStatement();
            ResultSet rs = smt.executeQuery(sentenciaSQL);

            while (rs.next()) {
                Categoria cat = new Categoria(rs.getInt("id_categoria"), rs.getString("nombre_categoria"));
                listadoCategorias.add(cat);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        }

        return listadoCategorias;

    }

    public static ArrayList<Producto> consultaProductos(int id) {

        Connection cnn = crearConexion();
        ArrayList<Producto> pro = new ArrayList<>();

        String sentenciaSQL = "Select * FROM producto WHERE id_categoria=" + id + "";

        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            while (rs.next()) {
                Producto product = new Producto(rs.getInt("id_producto"), rs.getInt("id_categoria"), rs.getDouble("precio_producto"), rs.getDouble("descuento_producto"), rs.getString("nombre_producto"), rs.getString("detalle_producto"), rs.getString("foto_producto"));
                pro.add(product);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pro;
    }

    public static Producto productos(int id) {

        Connection cnn = crearConexion();
        Producto product = null;
        String sentenciaSQL = "Select * FROM producto WHERE id_producto=" + id + "";

        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            while (rs.next()) {
                product = new Producto(rs.getInt("id_producto"), rs.getInt("id_categoria"), rs.getDouble("precio_producto"), rs.getDouble("descuento_producto"), rs.getString("nombre_producto"), rs.getString("detalle_producto"), rs.getString("foto_producto"));

            }

        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return product;
    }

    public static ArrayList<Producto> carroProductos(int id) {

        Connection cnn = crearConexion();
        Producto product = null;
        ArrayList<Producto> carroProductos = new ArrayList<Producto>();
        String sentenciaSQL = "Select * FROM producto WHERE id_producto=" + id + "";

        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            while (rs.next()) {
                product = new Producto(rs.getInt("id_producto"), rs.getInt("id_categoria"), rs.getDouble("precio_producto"), rs.getDouble("descuento_producto"), rs.getString("nombre_producto"), rs.getString("detalle_producto"), rs.getString("foto_producto"));
                carroProductos.add(product);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return carroProductos;
    }

    //EMPIEZAN METODOS PARA LA PARTE DEL ADMIN
    //######################################################################################//
    public static ArrayList<Producto> getTodosProductos() {
        Connection cnn = crearConexion();
        ArrayList<Producto> prodList = new ArrayList<>();
        Producto product = null;

        String sentenciaSQL = "SELECT * FROM producto";

        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            while (rs.next()) {
                product = new Producto(rs.getInt("id_producto"), rs.getInt("id_categoria"), rs.getDouble("precio_producto"), rs.getDouble("descuento_producto"), rs.getString("nombre_producto"), rs.getString("detalle_producto"), rs.getString("foto_producto"));
                prodList.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return prodList;
    }



    public static ArrayList<Pedido> getPedidosCliente(String idcliente) {
        Connection cnn = crearConexion();
        ArrayList<Pedido> pedidosLista = new ArrayList<>();
        

        String sentenciaSQL = "SELECT * FROM pedido WHERE id_usuario='" + idcliente + "'";
       


        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);
            

            while (rs.next()) {
                String nombreUsuario = consultaUsuarioAdmin(rs.getInt("id_usuario"));
                Pedido p = new Pedido(nombreUsuario, rs.getInt("id_pedido"), rs.getString("fecha_pedido"), rs.getDouble("total_pedido"));
                pedidosLista.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pedidosLista;
        
        
    }

    public static ArrayList<Pedido> getPedidosFecha(String fecha1, String fecha2) {
        Connection cnn = crearConexion();
        ArrayList<Pedido> pedidosLista = new ArrayList<>();
        String sentenciaSQL = "SELECT * FROM pedido WHERE fecha_pedido BETWEEN '" + fecha1 + "' AND '" + fecha2 + "'";

        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            while (rs.next()) {
                String nombreUsuario = consultaUsuarioAdmin(rs.getInt("id_usuario"));
                Pedido p = new Pedido(nombreUsuario, rs.getInt("id_pedido"), rs.getString("fecha_pedido"), rs.getDouble("total_pedido"));
                pedidosLista.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pedidosLista;
    }
    
    
    //METODOS PARA LOS PEDIDOS
    
    public static void setDetallePedido(int id_detalle,int id_pedido,int id_producto,int detalle_cantidad){
        Connection cnn = crearConexion();
        
        String sentenciaSQL = "INSERT INTO detallepedido (id_detalle, id_pedido, id_producto, detalle_cantidad) VALUES ("+id_detalle+","+id_pedido+","+id_pedido+","+detalle_cantidad+")";
        
          try {
            PreparedStatement stm=cnn.prepareStatement(sentenciaSQL);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
        
       
    private static ArrayList<Integer> getIdPedidos(String idproducto){
        Connection cnn=crearConexion();
        ArrayList<Integer> pedidosLista=new ArrayList<>();
        
        String sentenciaSQL="SELECT * FROM detallepedido WHERE id_producto='"+idproducto+"'";
        
        try {
            Statement stm=cnn.createStatement();
            ResultSet rs=stm.executeQuery(sentenciaSQL);
            
            while(rs.next()){
                int lp=rs.getInt("id_pedido");
                pedidosLista.add(lp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        return pedidosLista;
    }
    
    
    
    
    
    
    
   

    public static void realizarPedido(int idusuarioPedido, double totalPedido) {
       Connection cnn=crearConexion();
        String sentenciaSQL="INSERT INTO pedido (id_usuario, total_pedido) VALUES ("+idusuarioPedido+","+totalPedido+")";

        try {
            Statement stm = cnn.createStatement();
            stm.executeUpdate(sentenciaSQL);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
    }

    public static int consultaIDUltimoPedido() {
        Connection cnn=crearConexion();
        
        
        int id = 0;
        try {
            cnn = crearConexion();
            String sentenciaSQL="SELECT id_pedido FROM pedido WHERE id_pedido = (SELECT MAX(id_pedido) from pedido)";
            PreparedStatement smt = cnn.prepareStatement(sentenciaSQL);
            ResultSet rs = smt.executeQuery();

            if (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return id;
    }

    public static void detallesPedidosRealizados(int idUltimoPedido, ArrayList<Cantidad> lista) {
        Connection cnn=crearConexion();
        String sentenciaSQL = null;
        
     
        try {
        for(int x = 0; x < lista.size(); x++){
            sentenciaSQL = "INSERT INTO detallepedido (id_pedido, id_producto, detalle_cantidad) VALUES ("+idUltimoPedido+", "+lista.get(x).getId()+", "+lista.get(x).getCantidad()+")";
            Statement stm = cnn.createStatement();
            stm.executeUpdate(sentenciaSQL);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    
    /* ############################################################################################################## */

    
    /* PANEL ADMIN PARA PRODUCTOS */
    
    
    /* ############################################################################################################## */
    
    public static ArrayList<Pedido> getPedidosProducto(String idproducto){
        Connection cnn=crearConexion();
        ArrayList<Integer> idPedidosLista=getIdPedidos(idproducto);
        ArrayList<Pedido> pedidosLista=new ArrayList<>();
        
        for(int i=0;i<idPedidosLista.size();i++){
            String sentenciaSQL="SELECT * FROM pedido WHERE id_pedido='"+idPedidosLista.get(i)+"'";

            try {
                Statement stm=cnn.createStatement();
                ResultSet rs=stm.executeQuery(sentenciaSQL);

                while(rs.next()){
                    String nombreUsuario = consultaUsuarioAdmin(rs.getInt("id_usuario"));
                    Pedido p=new Pedido(nombreUsuario, rs.getInt("id_pedido"), rs.getString("fecha_pedido"), rs.getDouble("total_pedido"));
                    pedidosLista.add(p);
                }
            } catch (SQLException ex) {
                Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return pedidosLista;
    }
    
    
    //---------------------------------------------
    
    //------------------METODO PARA OBTENER LOS CLIENTES------------------------
        public static ArrayList<Cliente> getClientes() {
        Connection cnn = crearConexion();
        ArrayList<Cliente> cliLista = new ArrayList<>();

        String sentenciaSQL = "SELECT * FROM usuario WHERE tipo_usuario='cliente'";

        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            while (rs.next()) {
                Cliente cli = new Cliente(rs.getInt("id_usuario"), rs.getString("nombre_usuario"));
                cliLista.add(cli);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cliLista;
    }

    /* ####################################################################################################################### */

    public static ArrayList<Producto> consultaProductos2(int id) {
        Connection cnn = crearConexion();
        
         ArrayList<Producto> pro= new ArrayList<>();

        String sentenciaSQL="Select * FROM producto WHERE id_producto="+id+"";

        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            while(rs.next()){
                Producto product = new Producto(rs.getInt("id_producto"), rs.getInt("id_categoria"), rs.getDouble("precio_producto"), rs.getDouble("descuento_producto"), rs.getString("nombre_producto"), rs.getString("detalle_producto"), rs.getString("foto_producto"));
                pro.add(product);

            }

        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return pro;

                
        
    }

    public static ArrayList<Detalles> consultaDetalles(int idPedido) {
         
         
         ArrayList<Detalles> lista=new ArrayList<Detalles>();
        try {

            Connection cnn=crearConexion();
            String sql="SELECT * FROM detallepedido INNER JOIN producto ON detallepedido.id_producto=producto.id_producto WHERE detallepedido.id_pedido="+idPedido+"";
            Statement stm = cnn.createStatement();
            ResultSet rs=stm.executeQuery(sql);
            double precioFinal;
            Detalles d = null;
            while(rs.next()){
              
                 String producto=obtenerProducto(rs.getInt("id_producto"));
                 d=new Detalles(producto,rs.getInt("id_pedido"),rs.getDouble("precio_producto"),rs.getInt("detalle_cantidad"));
                


                lista.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    private static String obtenerProducto(int aInt) {
        
        String producto=null;
        try {
            Connection cnn=crearConexion();

            String sql="SELECT nombre_producto FROM producto where id_producto="+aInt+"";
            Statement stm = cnn.createStatement();
            ResultSet rs=stm.executeQuery(sql);
            while(rs.next()){
                producto=rs.getString("nombre_producto");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return producto;
        


    }

    private static String consultaUsuarioAdmin(int aInt) {
      
        String nombreUsuario = null;
          try {
            Connection cnn=crearConexion();

            String sql="SELECT nombre_usuario FROM usuario where id_usuario="+aInt+"";
            Statement stm = cnn.createStatement();
            ResultSet rs=stm.executeQuery(sql);
           
            while(rs.next()){
                nombreUsuario=rs.getString("nombre_usuario");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return nombreUsuario;
        

    }
   

}
