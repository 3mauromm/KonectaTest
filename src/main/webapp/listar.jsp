<%-- 
    Document   : listar
    Created on : 6/01/2022, 7:18:40 p. m.
    Author     : 3maur
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="konectatest.Inventario"%>
<%@page import="java.sql.Connection"%>
<%@page import="konectatest.Mysqlconexion" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de inventario</title>
        <style>
            table, th, td {
                color: white;
                font-size: 15px;
                font-family: verdana;
                padding: 3px;
            }
            table {
                width: 80%;
            }
            th, td {
                text-align: left
            }
        </style>
        <link href="css/estilos.css" rel="stylesheet">
    </head>
    <body>
        <h1>KONECTA: Inventario</h1>
        <h2>Lista de inventario</h2>

        <%
            try {
                Connection con = null;
                Mysqlconexion mysqlcon = new Mysqlconexion();
                con = mysqlcon.abrirConexion();

                PreparedStatement ps;
                ResultSet res;
                ps = (PreparedStatement) con.prepareStatement("SELECT * FROM konecta.inventario");
                res = ps.executeQuery();

                if (res.next()) {
                    System.out.println("Info en WebPages/listar.jsp:La busqueda tuvo resultado");

        %>
        <table class="tabla">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Rerefencia</th>
                <th>Precio</th>
                <th>Peso</th>
                <th>Categoria</th>
                <th>Cantidad </th>
                <th>Fecha de creación</th>
            </tr>
            <tr>
                <td><%=res.getString("id")%></td>
                <td><%=res.getString("nombre")%></td>
                <td><%=res.getString("ref")%></td>
                <td><%=res.getString("precio")%></td>
                <td><%=res.getString("peso")%></td>
                <td><%=res.getString("categoria")%></td>
                <td><%=res.getString("cantidad")%> </td>
                <td><%=res.getString("fecha")%></td>
            </tr>
            <%
                while (res.next()) {
            %>
            <tr>
                <td><%=res.getString("id")%></td>
                <td><%=res.getString("nombre")%></td>
                <td><%=res.getString("ref")%></td>
                <td><%=res.getString("precio")%></td>
                <td><%=res.getString("peso")%></td>
                <td><%=res.getString("categoria")%></td>
                <td><%=res.getString("cantidad")%> </td>
                <td><%=res.getString("fecha")%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
        } else {
            System.out.println("Warning en WebPages/listar.jsp: La busqueda NO tuvo resultado");
        %>
        Ups! No se encontraron resultados
        <%
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        %>
        Ups! No se encontraron resultados
        <%
            }
        %> 
        <br>
        <form action="index.jsp" method="post">
            <input type="submit" style="margin-left:50%; transform: translateX(-50%)" value="Volver">
        </form>
    </body>
</html>
