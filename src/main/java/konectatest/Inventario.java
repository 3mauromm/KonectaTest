package konectatest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Inventario {
    /* 
    Esta clase maneja todos los cambios que se hacen a la base de datos de MySQL
     */
    
    private PreparedStatement ps;   // Almacena el codigo a enviar a MySQL 
    private ResultSet res;          // Almacena la respuesta de MySQL
    public Connection con = null;   // Almacena la conexion a MySQL
        public String db;           // Almacena el nombre de la base de datos

    public Inventario() {
        // Constructor: Genera la conexion a la base de datos de MySQL

        try {
            Mysqlconexion mysqlcon = new Mysqlconexion();
            this.con = mysqlcon.abrirConexion();
            db = mysqlcon.DB;

        } catch (Exception e) {
            System.out.println("Error en Inventario.java/Inventario(): " + e);
        }
    }

    public boolean crear_producto(String nombre, String ref, String precio, String peso, String categoria, String cantidad) {
        // Metodo que crea un producto nuevo en la base de datos

        try {
            // Conseguir la fecha actual para anadir como fecha de creacion del producto
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime date = LocalDateTime.now();
            String fecha = dtf.format(date);
            ps = (PreparedStatement) con.prepareStatement(
                    "INSERT INTO " + db + " (nombre, ref, precio, peso, categoria, cantidad, fecha) "
                    + "VALUES ('" + nombre + "', '" + ref + "', '" + precio + "', '" + peso + "', '" + categoria + "', '" + cantidad + "', '" + fecha + "');");
            ps.executeUpdate();
            System.out.println("Info en Inventario.java/crear_producto(): El producto fue creado");
            return true;

        } catch (Exception e) {
            System.out.println("Error en Inventario.java/crear_producto(): " + e);
            return false;
        }
    }

    public boolean editar_producto(String id, String nombre, String ref, String precio, String peso, String categoria, String cantidad) {
        // Metodo que recibe el ID de un producto y edita su elementos

        // Construccion de la instruccion para MySQL
        String[] aDatos = {nombre, ref, precio, peso, categoria, cantidad};
        String[] aTipos = {"nombre", "ref", "precio", "peso", "categoria", "cantidad"};
        String statement;
        statement = "UPDATE " + db + " SET ";
        for (int i = 0; i < aDatos.length; i++) {
            if (!aDatos[i].equals("")) {
                statement += aTipos[i] + " = '" + aDatos[i] + "',";
            }
        }
        statement = statement.substring(0, statement.length() - 1);
        statement += " WHERE (id = '" + id + "');";

        try {
            ps = (PreparedStatement) con.prepareStatement(statement);
            ps.executeUpdate();
            System.out.println("Info en Inventario.editar_producto(): El producto fue editado exitosamente");
            return true;

        } catch (Exception e) {
            System.out.println("Error en Inventario.java/editar_producto(): " + e);
            return false;
        }
    }

    public boolean eliminar_producto(String id_eliminar) {
        // Metodoq que recibe el ID de un producto y eliminar el producto de la base de datos

        if (id_existe(id_eliminar)) {

            try {
                ps = (PreparedStatement) con.prepareStatement("DELETE FROM " + db + " WHERE (id = " + id_eliminar + ");");
                ps.executeUpdate();
                System.out.println("Info en Inventario.java/eliminarProducto(): ID fue encontrado");
                return true;

            } catch (Exception e) {
                System.out.println("Error en Inventario.java/eliminarProducto(): " + e);
                return false;
            }

        } else {
            System.out.println("Warning en Inventario.java/eliminarProducto(): ID no fue encontrado");
            return false;
        }
    }

    private boolean id_existe(String id) {
        // Metodo que verificar que un ID exista en la base de datos

        try {
            ps = (PreparedStatement) con.prepareStatement("SELECT id FROM " + db + " WHERE (id = " + id + ");");
            res = ps.executeQuery();
            return res.next();

        } catch (Exception e) {
            System.out.println("Error en Inventario.java/id_existe(): " + e);
            return false;
        }
    }

    public boolean vender_producto(String id, String cantidad) {
        // Metodo que recibe el ID de un producto y una cantidad y disminuye su valor Ventas dicha cantidad

        try {
            ps = (PreparedStatement) con.prepareStatement("SELECT cantidad FROM " + db + " WHERE (id = " + id + ");");
            res = ps.executeQuery();
            res.next();
            int cant_disponible, cant_requerida, cant_restante;
            cant_disponible = res.getInt("cantidad");           // Cantidad de producto disonible en stock
            cant_requerida = Integer.parseInt(cantidad);        // Cantidad de producto que se quiere vender
            cant_restante = cant_disponible - cant_requerida;   // Cantidad de prodcuto que quedaria luego de la venta

            if (cant_restante >= 0) {
                System.out.println("Info en Inventario.stock_disponible(): La cantidad requerida es menor que la cantidad disponible");
                ps = (PreparedStatement) con.prepareStatement("SELECT ventas FROM " + db + " WHERE (id = " + id + ");");
                res = ps.executeQuery();
                res.next();
                int ventas, ventas_nueva;
                ventas = res.getInt("ventas");          // Cantidad de veces que se ha vendido el producto
                ventas_nueva = ventas + cant_requerida; // Cantidad de veces que se habra vendido el producto luego de la venta
                ps = (PreparedStatement) con.prepareStatement("UPDATE " + db
                        + " SET cantidad = '" + Integer.toString(cant_restante) + "', "
                        + "ventas = '" + Integer.toString(ventas_nueva) + "'"
                        + "WHERE (id = '" + id + "');");
                ps.executeUpdate();
                System.out.println("Info en Inventario.stock_disponible(): La venta fue ingresada exitosamente");
                return true;

            } else {
                System.out.println("Info en Inventario.stock_disponible(): La cantidad requerida es mayor que la cantidad disponible");
                return false;
            }

        } catch (Exception e) {
            System.out.println("Error en Inventario.java/vender_producto(): " + e);
            return false;
        }

    }

}
