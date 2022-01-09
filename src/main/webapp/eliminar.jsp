<%-- 
    Document   : eliminar
    Created on : 6/01/2022, 7:17:59 p. m.
    Author     : 3maur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar producto</title>
        <link href="css/estilos.css" rel="stylesheet">
    </head>
    <body>
        <h1>KONECTA: Inventario</h1>
        <h2>Eliminar producto</h2>
        <form action="${pageContext.request.contextPath}/servlet" method="post">
            <table class="tabla">
                <td class="texto">ID del producto a eliminar: </td>
                <td><input type="text" name="id_eliminar"></td>
            </table>
            <br>
            <input type="submit" style="margin-left:50%; transform: translateX(-50%)" name="btnEliminar" value="Eliminar" />
        </form>
        <form action="index.jsp" method="post">
            <input type="submit" style="margin-left:50%; transform: translateX(-50%)" value="Volver">
        </form>
    </body>
</html>
