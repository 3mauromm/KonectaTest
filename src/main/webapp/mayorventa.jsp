<%-- 
    Document   : mayorventa
    Created on : 6/01/2022, 7:20:10 p. m.
    Author     : 3maur
--%>

<%@page import="konectatest.Inventario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="konectatest.Mysqlconexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta 2</title>
        <link href="css/estilos.css" rel="stylesheet">
    </head>
    <body>
        <h1>KONECTA: Inventario</h1>
        <h2>Consulta 2</h2>
        <%
            try {
                Connection con = null;
                Mysqlconexion mysqlcon = new Mysqlconexion();
                con = mysqlcon.abrirConexion();

                PreparedStatement ps;
                ResultSet res;
                ps = (PreparedStatement) con.prepareStatement("SELECT * FROM " + mysqlcon.DB + " ORDER BY ventas DESC;");
                res = ps.executeQuery();

                if (res.next()) {
                    System.out.println("Info en WebPages/listar.jsp:La busqueda tuvo resultado");
        %> 
        <p align="center">El prodcuto mas vendido es <%=res.getString("nombre")%> con ID <%=res.getString("id")%> y <%=res.getString("ventas")%> ventas.</p>
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
