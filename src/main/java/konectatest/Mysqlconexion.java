
package konectatest;

import java.sql.Connection;
import java.sql.DriverManager;


public class Mysqlconexion {
    
    /* 
    Esta clase maneja la conexion a la base de datos de MySQL
    Aqui se deben configurar la URL y credenciales de la base de datos
    */

    // URL, nombre de usuario, contrasena y nombre de la base de datos de MySQL
    public static final String URL = "jdbc:mysql://localhost:3306/konecta";
    public static final String USR = "root";
    public static final String PSW = "root";
    public final String DB = "konecta.inventario";

    public Connection abrirConexion() {
        // Metodo que crear y retorna la conexion con la base de datos de MySQL
        Connection con = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection(URL, USR, PSW);
            System.out.println("Info in Mysqlconexion/abrirConexion(): Connectado a MySQL.");
        } catch (Exception e) {
            System.out.println("Error in Mysqlconexion/abrirConexion(): " + e);
        }
        return con;
    }

}
