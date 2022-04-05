<%-- 
    Document   : consultaralumno
    Created on : 4/04/2022, 08:10:55 PM
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
        
        <table border="2">
            <thead>
                <tr>
                    <th>Boleta</th>
                     <th>Nombre</th>
                      <th>Apellido Paterno</th>
                       <th>Apellido Materno</th>
                        <th>Telefono</th>
                         <th>Editar</th>
                          <th>Borrar</th>
                </tr>
            </thead>
            <tbody>
                
            
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
                   String q="select *from alumnobatiz order by boleta asc";
                   
                   set=con.createStatement();
                   
                   rs=set.executeQuery(q);
                   
                   while(rs.next()){
                       
                   
                   
                    %>
                    <tr>
                        <td><%=rs.getInt("boleta")%></td>
                        <td><%=rs.getString("nombre")%></td>
                        <td><%=rs.getString("appat")%></td>
                        <td><%=rs.getString("apmat")%></td>
                        <td><%=rs.getString("tel")%></td>
                        <td><a href="editaralumno.jsp?id=<%=rs.getInt("boleta")%>">Editar</a></td>
                        <td><a href="borraralumno.jsp?id=<%=rs.getInt("boleta")%>">Editar</a></td>
                        
                    </tr>
         
                    <%
                        }
                       
                }catch(SQLException es){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(es.getMessage());
                    %>
                    <h1>No se pudo conectar a la tabla</h1>
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
        </tbody>
        </table>
            <a href="index.html">Regresar a principal</a>
            <br>
            <a href="registroalumno.jsp">Registrar Alumno</a>
    </body>
</html>
