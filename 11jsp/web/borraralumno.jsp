<%-- 
    Document   : borraralumno
    Created on : 4/04/2022, 08:37:44 PM
    Author     : Alumno
--%>

<%@page contentType="text/html" language="java" import="java.sql.*, java.util.*, java.text.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con= null; 
            Statement set= null;
            ResultSet rs=null; 
            String username, url, password, driver; 
            
            url="jdc:mysql://localhost/alumnos";
            username="root";
            password="n0m3l0";
            
            driver="com.mysql,jdbc.Driver";
            
            try{
                Class.forName(driver);
                con=DriverManager.getConnection(url,username,password);
                try{
                    int id=Integer.parseInt(request.getParameter("id"));
                    
                    String q= "delete from alumnobatiz where boleta= "+id;
                    
                    set= con.createStatement();
                    
                    int borrar =set.executeUpdate(q);
                    %>
                            <h1>Alumno eliminado</h1>
         
                    <%
                }catch(SQLException es){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(es.getMessage());
                    %>
                    <h1>No se pudo eliminar en la tabla</h1>
                    <%
                }
            }catch(Exception e){
                System.out.println("Error al conectar en la BD");
                    System.out.println(e.getMessage());
                    %>
                    <h1>No conecto con la BD</h1>
                    <%
                        
                   }
            

            %>
        
            <a href="index.html">Regresar a principal</a>
    </body>
</html>

