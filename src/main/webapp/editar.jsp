<%-- 
    Document   : editar
    Created on : 6/01/2022, 7:14:40 p. m.
    Author     : 3maur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar producto</title>
        <link href="css/estilos.css" rel="stylesheet">
    </head>
    <body>
        <h1 class="header">KONECTA: Inventario</h1>
        <h2 class="header">Editar producto</h2>
        <p align="center">Ingrese el ID (obligatorio) y los campos a editar. </p>
        <form action="${pageContext.request.contextPath}/servlet" method="post">
            <table class="tabla">
                <tr>
                    <td class="texto">ID*:</td> 
                    <td><input type="text" name="editar_id"></td>
                </tr>
                <tr>
                    <td class="texto">Nombre:</td> 
                    <td><input type="text" name="editar_nombre"></td>
                </tr>
                <tr>                
                    <td class="texto">Rerefencia:</td>
                    <td><input type="text" name="editar_ref"></td>
                </tr>
                <tr> 
                    <td class="texto">Precio:</td>
                    <td><input type="text" name="editar_precio"></td>
                </tr>
                <tr> 
                    <td class="texto">Peso:</td>
                    <td><input type="text" name="editar_peso"></td>
                </tr>
                <tr> 
                    <td class="texto">Categoria:</td>
                    <td><input type="text" name="editar_categoria"></td>
                </tr>
                <tr> 
                    <td class="texto">Cantidad:</td>
                    <td><input type="text" name="editar_cantidad"></td> 
                </tr>
            </table>
            <br>
            <input type="submit" style="margin-left:50%; transform: translateX(-50%)" name="btnEditar" value="Editar">
        </form>

        <form action="index.jsp" method="post">
            <input type="submit" style="margin-left:50%; transform: translateX(-50%)" value="Volver">
        </form>

    </body>
</html>
