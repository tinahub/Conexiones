<%-- 
    Document   : conexion1
    Created on : 10-oct-2016, 12:21:05
    Author     : alumno
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            
            InitialContext initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource dataSource = (DataSource)envCtx.lookup("jdbc/spacex");
            
            Connection connection = dataSource.getConnection();
            
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT Nombre FROM cohetes");
            
            while(rs.next()){
                String nombre = rs.getString("Nombre");
                out.println(nombre);
            }
            
            connection.close();
        %>
    </body>
</html>
