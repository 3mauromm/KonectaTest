<%-- 
    Document   : index
    Created on : 6/01/2022, 6:22:20 p. m.
    Author     : 3maur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cafeteria</title>
        <link href="css/estilos.css" rel="stylesheet">

    </head>
    <body>
        <br>
        <h1>KONECTA: Inventario</h1>
        <h2>Opciones:</h2>
        <table class="tabla">
            <tr>
                <td> <form action="crear.jsp" method="post">
                        <input type="submit" class="btn" value="Crear producto">
                    </form>
                </td>
            </tr>
            <tr>
                <td> <form action="editar.jsp" method="post">
                        <input type="submit" class="btn" value="Editar producto">
                    </form>
                </td>
            </tr>
            <tr>
                <td> <form action="eliminar.jsp" method="post">
                        <input type="submit" class="btn" value="Eliminar producto">
                    </form>
                </td>
            </tr>
            <tr>
                <td> <form action="listar.jsp" method="post">
                        <input type="submit" class="btn" value="Listar inventario">
                    </form>
                </td>
            </tr>
            <tr>
                <td> <form action="vender.jsp" method="post">
                        <input type="submit" class="btn" value="Ingresar una venta">
                    </form>
                </td>
            </tr>
            <tr>
                <td> <form action="mayorstock.jsp" method="post">
                        <input type="submit" class="btn" value="Mayor stock">
                    </form>
                </td>
            </tr>
            <tr>
                <td> <form action="mayorventa.jsp" method="post">
                        <input type="submit" class="btn" value="Mayor venta">
                    </form>
                </td>
            </tr>
        </table>
        <%System.out.println("Info en WebPages/index.jsp: Pagina principal carga");%>
    </body>
</html>
