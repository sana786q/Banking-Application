<%@include file="DBCON.jsp" %>
<html>
    <body style="display: static;
            align-items: center;
            justify-content: center;
            padding:  10px;
            min-height: 90vh;
            background: lightskyblue;">
        <center>
        Welcome <%=session.getAttribute("login_id")%>
        <%
        
        String upvalue=request.getParameter("upvalue");
        String fields=request.getParameter("field");
        
        try
        {
            String updateprofilequery="update account set "+fields+"='"+upvalue+"' where accno='"+session.getAttribute("acc_no")+"'";
            PreparedStatement pst=con.prepareStatement(updateprofilequery);
                    
            pst.executeUpdate();
            out.println("<br> Data updated successfully");
            
        }
        catch(Exception e)
        {
            out.println("Data Does Not Change"+e);
        }
        %>
        </center>
    </body>
</html>