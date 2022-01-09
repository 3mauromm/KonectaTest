
package konectatest;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet")
public class Servlet extends HttpServlet {
    /*
    Esta clase maneja todas las peticiones y genera una respuesta
    */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Metodo para procesar las peticiones

        Inventario inventario;
        inventario = new Inventario();
        boolean confirmacion;           // Booleano que indica si un proceso fue exitoso

        if (request.getParameter("btnEliminar") != null) {
            //Si se presiona el boton para eliminar un producto
            
            String id_eliminar;
            id_eliminar = request.getParameter("id_eliminar");
            System.out.println("Info in Servlet/doPost: Eliminando producto " + id_eliminar);
            confirmacion = inventario.eliminar_producto(id_eliminar);

            if (confirmacion) {
                publicar_respuesta("El producto fue borrado exitosamente.", response);
                System.out.println("Info in Servlet/doPost: El producto fue borrado exitosamente");
            } else {
                publicar_respuesta("El producto no existe o no pudo ser eliminado.", response);
                System.out.println("Info in Servlet/doPost: El producto no existe o no pudo ser eliminado");
            }

            
        } else if (request.getParameter("btnCrear") != null) {
            // Si se presiona el boton para crear un producto nuevo
            
            String nombre, ref, precio, peso, categoria, cantidad;
            nombre = request.getParameter("crear_nombre");
            ref = request.getParameter("crear_ref");
            precio = request.getParameter("crear_precio");
            peso = request.getParameter("crear_peso");
            categoria = request.getParameter("crear_categoria");
            cantidad = request.getParameter("crear_cantidad");
            
            System.out.println("Info in Servlet/doPost: Creando producto");
            confirmacion = inventario.crear_producto(nombre, ref, precio, peso, categoria, cantidad);

            if (confirmacion) {
                publicar_respuesta("El producto fue creado exitosamente.", response);
                System.out.println("Info in Servlet/doPost: El producto fue creado exitosamente");
            } else {
                publicar_respuesta("El producto no pudo ser creado.", response);
                System.out.println("Info in Servlet/doPost: El producto no pudo ser creado");
            }

            
        } else if (request.getParameter("btnVender") != null) {
            // Si se presiona el boton para registrar una venta
            
            String id_vender, cant_vender;
            id_vender = request.getParameter("id_vender");
            cant_vender = request.getParameter("cant_vender");

            confirmacion = inventario.vender_producto(id_vender, cant_vender);

            if (confirmacion) {
                publicar_respuesta("La venta fue ingresada exitosamente.", response);
                System.out.println("Info in Servlet/doPost: La venta fue ingresada exitosamente");
            } else {
                publicar_respuesta("La venta no pudo ser ingresada.", response);
                System.out.println("Info in Servlet/doPost: La venta no pudo ser ingresada");
            }
            
            
        } else if (request.getParameter("btnEditar") != null) {
            // Si se presiona el boton para editar un producto
            
            String id, nombre, ref, precio, peso, categoria, cantidad;;
            id = request.getParameter("editar_id");
            nombre = request.getParameter("editar_nombre");
            ref = request.getParameter("editar_ref");
            precio = request.getParameter("editar_precio");
            peso = request.getParameter("editar_peso");
            categoria = request.getParameter("editar_categoria");
            cantidad = request.getParameter("editar_cantidad");
            
            confirmacion = inventario.editar_producto(id, nombre, ref, precio, peso, categoria, cantidad);

            if (confirmacion) {
                publicar_respuesta("El producto fue editado exitosamente.", response);
                System.out.println("Info in Servlet/doPost: El producto fue editado exitosamente");
            } else {
                publicar_respuesta("El producto no existe o no pudo ser editado.", response);
                System.out.println("Info in Servlet/doPost: El producto no existe o no pudo ser editado");
            }
        }
    }


    private void publicar_respuesta(String mensaje, HttpServletResponse response) throws ServletException, IOException {
        // Metodo para desplegar una respuesta a una peticion
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.print("<%@page contentType='text/html' pageEncoding='UTF-8'%>"
                + "<!DOCTYPE html><html>"
                + "<head>"
                + "<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
                + "<title>Respuesta</title>"
                + "<link href='css/estilos.css' rel='stylesheet'>"
                + "</head>"
                + "<body><br>"
                + "<h2>Resultado</h2>"
                + "<p align='center'>" + mensaje + "</p>"
                + "<br>"
                + "<form action='index.jsp' method='post'>"
                + "<input type='submit' style='margin-left:50%; transform: translateX(-50%);' value='Volver'>"
                + "</form>"
                + "</body>"
                + "</html>");
    }
}
