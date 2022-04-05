<%-- 
    Document   : actualizarañumno
    Created on : 5/04/2022, 05:41:38 PM
    Author     : Alumno
--%>

<%@page import="org.apache.naming.java.javaURLContextFactory"%>
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
            
            url="jdbc:mysql://localhost/alumnos";
            username="root";
            password="n0m3l0";
            
            driver="com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con=DriverManager.getConnection(url,username,password);
                try{
                    String nom, appat, apmat, telefono;
                    int bol; 
                    
                    nom=request.getParameter("nombre2");
                    appat=request.getParameter("appat2");
                    apmat=request.getParameter("apmat2 ");
                    telefono=request.getParameter("telefono2");
                    bol=Integer.parseInt(request.getParameter("id"));
                    
                    set = con.createStatement();
                    
                    String q ="update alumnobatiz set nombre= '"+nom+"',"
                            +"appat='"+appat+"',apmat='"+apmat+"',"
                            +"telefono='"+telefono+"'"
                            +"where boleta= "+bol+"";
                    int registro=set.executeUpdate(q);
                    %>
                            <h1>Registro Exitoso</h1>
         
                    <%
                }catch(SQLException es){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(es.getMessage());
                    %>
                    <h1>No se pudo registrar en la tabla</h1>
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

