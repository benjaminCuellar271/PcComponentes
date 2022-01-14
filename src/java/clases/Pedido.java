package clases;

/**
 *
 * @author Benjamin
 */
public class Pedido {

    private String nombre_usuario;
    private int id_pedido;
    private String fecha_pedido;
    private double total_pedido;

    public Pedido(String nombre_usuario, int id_pedido, String fecha_pedido, double total_pedido) {
        this.nombre_usuario = nombre_usuario;
        this.id_pedido = id_pedido;
        this.fecha_pedido = fecha_pedido;
        this.total_pedido = total_pedido;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getFecha_pedido() {
        return fecha_pedido;
    }

    public void setFecha_pedido(String fecha_pedido) {
        this.fecha_pedido = fecha_pedido;
    }

    public double getTotal_pedido() {
        return total_pedido;
    }

    public void setTotal_pedido(double total_pedido) {
        this.total_pedido = total_pedido;
    }

    
   

}
