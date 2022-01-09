<%-- 
    Document   : vender
    Created on : 6/01/2022, 7:19:18 p. m.
    Author     : 3maur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar una venta</title>
        <link href="css/estilos.css" rel="stylesheet">
    </head>
    <body>
        
        <h1>KONECTA: Inventario</h1>
        <h2>Ingresar una venta</h2>
        <form action="${pageContext.request.contextPath}/servlet" method="post">
            <table class="tabla">
                    <th class="texto">ID del producto: </th> 
                    <td><input type="text" name="id_vender"></td>
                </tr>
                <tr>                
                    <th class="texto">Cantidad: </th>
                    <td><input type="text" name="cant_vender"></td>
                </tr>
            </table>
            <br>
            <input type="submit" style="margin-left:50%; transform: translateX(-50%)" name="btnVender" value="Ingresar">
        </form>

        <form action="index.jsp" method="post">
            <input type="submit" style="margin-left:50%; transform: translateX(-50%)" value="Volver">
        </form>
            
    </body>
</html>
