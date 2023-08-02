<%@include file="DBCON.jsp" %>
<html>
    <body style="display: static;
            align-items: center;
            justify-content: center;
            padding:  10px;
            min-height: 90vh;
            background: lightskyblue;">
        Welcome <%=session.getAttribute("login_id")%>
        <%
        String upvalue=request.getParameter("value");
        String fields=request.getParameter("fields");
        
        try
        {
            String updatepasswordquery="update account set "+fields+"='"+upvalue+"' where accno='"+session.getAttribute("login_id")+"'";
            PreparedStatement pst=con.prepareStatement(updatepasswordquery);
                    
            pst.executeUpdate();
            out.println("<br> Data updated successfully");
        }
        catch(Exception e)
        {
            out.println("Data Does Not Change"+e);
        }
        %>
    </body>
</html>