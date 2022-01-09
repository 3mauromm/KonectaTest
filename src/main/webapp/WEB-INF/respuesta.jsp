<%-- 
    Document   : respuesta
    Created on : 7/01/2022, 9:55:17 p. m.
    Author     : 3maur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>KONECTA: Inventario</h1>
        <h2>Respuesta:</h2>
        <p>${mensaje}</p>
        
        <br>
        <form action="index.jsp" method="post">
            <input type="submit" style="cursor: pointer; padding: 2px 2px; margin: 2px 2px;" value="Volver">
        </form>
    </body>
</html>
