package clases;

/**
 *
 * @author Benjamin
 */
public class Detalles {
    private String nombreProducto;
    private int idPedido;
    private double precio;
    private int cantidad;

    public Detalles(String nombreProducto, int idPedido, double precio, int cantidad) {
        this.nombreProducto = nombreProducto;
        this.idPedido = idPedido;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    
    
    
}
