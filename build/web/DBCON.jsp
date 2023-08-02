<%@page import="java.sql.*"%>
<html>
   
    <body>
       <%!Connection con;%>
       <%
           try
           {
               Class.forName("com.mysql.jdbc.Driver");
               String ConnectionURL="jdbc:mysql://localhost:3306/GlobalBankingDB";
               String dbuser="root";
               String dbpass="root";
               
               con=DriverManager.getConnection(ConnectionURL,dbuser,dbpass);
               //out.println("Connection Success...<br>");
           }
           catch(Exception e)
           {
               out.println("Connection Failed..."+e);
           }
       %>
    </body>
</html>
