
package clases;

/**
 *
 * @author Benjamin
 */
public class Producto {
    
    private int id_producto, id_categoria;
    private double precio_producto, descuento_producto;
    private String nombre_producto, detalle_producto, foto_producto;

    public Producto(int id_producto, int id_categoria, double precio_producto, double descuento_producto, String nombre_producto, String detalle_producto, String foto_producto) {
        this.id_producto = id_producto;
        this.id_categoria = id_categoria;
        this.precio_producto = precio_producto;
        this.descuento_producto = descuento_producto;
        this.nombre_producto = nombre_producto;
        this.detalle_producto = detalle_producto;
        this.foto_producto = foto_producto;
    }
    
    
    

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public double getPrecio_producto() {
        return precio_producto;
    }

    public void setPrecio_producto(double precio_producto) {
        this.precio_producto = precio_producto;
    }

    public double getDescuento_producto() {
        return descuento_producto;
    }

    public void setDescuento_producto(double descuento_producto) {
        this.descuento_producto = descuento_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getDetalle_producto() {
        return detalle_producto;
    }

    public void setDetalle_producto(String detalle_producto) {
        this.detalle_producto = detalle_producto;
    }

    public String getFoto_producto() {
        return foto_producto;
    }

    public void setFoto_producto(String foto_producto) {
        this.foto_producto = foto_producto;
    }
    
    
    
}
