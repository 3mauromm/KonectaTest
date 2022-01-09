<%-- 
    Document   : crear
    Created on : 6/01/2022, 7:11:49 p. m.
    Author     : 3maur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear producto nuevo</title>
        <link href="css/estilos.css" rel="stylesheet">
    </style>
</head>
<body>
    <h1 class="header">KONECTA: Inventario</h1>
    <h2 class="header">Crear producto nuevo</h2>
    <p align="center">Llene todos los campos para crear el producto</p>
    <form action="${pageContext.request.contextPath}/servlet" method="post">
        <table class="tabla">
            <tr>
                <td class="texto">Nombre:</td> 
                <td><input type="text" class="input" name="crear_nombre"></td>
            </tr>
            <tr>                
                <td class="texto">Rerefencia:</td>
                <td><input type="text" class="input" name="crear_ref"></td>
            </tr>
            <tr> 
                <td class="texto">Precio</td>
                <td><input type="text" class="input" name="crear_precio"></td>
            </tr>
            <tr> 
                <td class="texto">Peso:</td>
                <td><input type="text" class="input" name="crear_peso"></td>
            </tr>
            <tr> 
                <td class="texto">Categoria:</td>
                <td><input type="text" class="input" name="crear_categoria"></td>
            </tr>
            <tr> 
                <td class="texto">Cantidad:</td>
                <td><input type="text" class="input" name="crear_cantidad"></td> 
            </tr>
        </table>
        <br>
        <input type="submit" style="margin-left:50%; transform: translateX(-50%)" name="btnCrear" value="Crear">
    </form>
    <form action="index.jsp" method="post">
        <input type="submit" style="margin-left:50%; transform: translateX(-50%)" value="Volver">
    </form>
</body>
</html>