<%@include file="DBCON.jsp" %>
<%@include file="ViewStatement.jsp" %>
<html>
    <body>
        <center>
        <h3 align="center">**********Statement*************</h3><br>
        <%
            try
            {
                String choice=request.getParameter("choice");
                String statementquery="";
                if(choice.equalsIgnoreCase("AccountNo"))
                {
                    String cn=request.getParameter("cuschoice");
                    statementquery="select * from "+cn;
                }  
                else
                {
                    statementquery="select * from transactionbank";
                }
                Statement stmt1=con.createStatement();
         
                ResultSet rs1=stmt1.executeQuery(statementquery);
         
                while(rs1.next())
                {
                    out.println("  "+rs1.getString(1));
                    out.println("  "+rs1.getString(2));
                    out.println("  "+rs1.getString(3));
                    out.println("  "+rs1.getString(4));
                    out.println("  "+rs1.getInt(5));
                    out.println("  "+rs1.getInt(6));
                    out.println("  "+rs1.getInt(7));
                    out.println("<br>");
                }
         
            }
            catch(Exception e)
            {
                out.println("<br>Failed to view the statement...");
            }
           
            
        %>
        <center>
    </body>
</html>