<%@include file="DBCON.jsp" %>
<html>
    <body style="display: static;
            align-items: center;
            justify-content: center;
            padding:  10px;
            min-height: 90vh;
            background: lightskyblue;">
        <%
        String loginid = request.getParameter("loginid");
        String newpassword=request.getParameter("newpass");
        String confirmpassword=request.getParameter("cnpass");
        
        try
        {
            String passforgetquery="select * from account where accno='"+loginid+"'";
            Statement stmt=con.createStatement();
            ResultSet rs=stmt .executeQuery(passforgetquery);
            int count=0;
            while(rs.next())
            {
                if(loginid.equalsIgnoreCase(rs.getString(1)))
                {
                    count++;
                    break;
                }
            
            }
            if(count>0)
            {
                out.println("<br>Correct Login ID You are Valid User");
                if(newpassword.equals(confirmpassword))
                {
                    out.println("<br>both confirm and new password are same");
                    String updatepasswordquery="update account set password='"+newpassword+"' where accno='"+loginid+"'";
                    PreparedStatement pst=con.prepareStatement(updatepasswordquery);
                    pst.executeUpdate();
                    out.println("<br> password updated successfully Now Login Again");
                    
                    out.println("<br><a href=Login.jsp>Login Again</a>");
                }
                else
                {
                    out.println("<br>both confirm and new password are not same");
                }
            }
            else
            {
                out.println("Login ID Does Not Found");
            }
        }
        catch(Exception e)
        {
            out.println("Password Does Not Change"+e);
        }
        %>
    </body>
</html>