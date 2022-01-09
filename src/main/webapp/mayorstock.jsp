<%-- 
    Document   : mayorstock
    Created on : 6/01/2022, 7:19:46 p. m.
    Author     : 3maur
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="konectatest.Mysqlconexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cosulta 1</title>
        <link href="css/estilos.css" rel="stylesheet">
    </head>
    <body>
        <h1>KONECTA: Inventario</h1>
        <h2>Consulta 1</h2>
        <%
            try {
                Connection con = null;
                Mysqlconexion mysqlcon = new Mysqlconexion();
                con = mysqlcon.abrirConexion();

                PreparedStatement ps;
                ResultSet res;
                ps = (PreparedStatement) con.prepareStatement("SELECT * FROM konecta.inventario ORDER BY cantidad DESC;");
                res = ps.executeQuery();

                if (res.next()) {
                    System.out.println("Info en WebPages/listar.jsp:La busqueda tuvo resultado");
        %> 
        <p align="center">El producto con mas stock es <%=res.getString("nombre")%> con ID <%=res.getString("id")%> y <%=res.getString("cantidad")%> articulos.</p>
        <%
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        %>
        <p align="center">Ups! No se encontraron resultados</p>
        <%
            }

        %>
        <br>
        <form action="index.jsp" method="post">
            <input type="submit" style="margin-left:50%; transform: translateX(-50%)" value="Volver">
        </form>
    </body>
</html>
