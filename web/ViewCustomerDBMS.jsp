<%@include file="DBCON.jsp" %>
<%@include file="ViewCustomer.jsp" %>
<html>
    <body style="display: static;
            align-items: center;
            justify-content: center;
            padding:  10px;
            min-height: 90vh;
            background: lightskyblue;">
       <center>     
        <%
            try
            {
                String choice = request.getParameter("choice");
                
                String CustomerViewquery = "";
                
                if(choice.equalsIgnoreCase("custname"))
                {
                    String cn = request.getParameter("cuschoice");
                    CustomerViewquery = "select * from account where custname='"+cn+"'";
                    
                    //session.setAttribute("value", choice);
                }
                
                else if(choice.equalsIgnoreCase("address"))
                {
                    String cn = request.getParameter("cuschoice");
                    CustomerViewquery = "select * from account where address='"+cn+"'";
                }
                
                else if(choice.equalsIgnoreCase("accno"))
                {
                    String cn = request.getParameter("cuschoice");
                    CustomerViewquery = "select * from account where accno='"+cn+"'";
                }
                
                else if(choice.equalsIgnoreCase("contactno"))
                {
                    String cn = request.getParameter("cuschoice");
                    CustomerViewquery = "select * from account where contactno='"+cn+"'";
                }
                
                else if(choice.equalsIgnoreCase("gender"))
                {
                    String cn = request.getParameter("cuschoice");
                    CustomerViewquery = "select * from account where gender='"+cn+"'";
                }
                
                else
                {
                    CustomerViewquery = "select * from account";
                }
                
                Statement stmt = con.createStatement();
                
                ResultSet rs1 = stmt.executeQuery(CustomerViewquery);
                
                while(rs1.next())
                {
                    out.println(" " +rs1.getString(1));
                    out.println(" " +rs1.getString(2));
                    out.println(" " +rs1.getString(3));
                    out.println(" " +rs1.getString(4));
                    out.println(" " +rs1.getString(5));
                    out.println(" " +rs1.getString(6));
                    out.println(" " +rs1.getString(7));
                    out.println(" " +rs1.getInt(8));
                    out.println("<br>");
                    
                    session.setAttribute("acc_no", rs1.getString(1));
                }
            }
                
            catch(Exception e)
            {
                out.println("Data not found....."+e);
            }
        %>
        
        <br>
        <a href="AdminUpdateCustomer.jsp"><input type="submit" name="update" value="Update"></a>
        
        <a href="AdminDeleteCustomer.jsp"><input type="submit" name="delete" value="Delete"></a>
       </center>
    </body>
</html>