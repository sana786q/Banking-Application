<%@include file="DBCON.jsp" %>
<html>
    <body style="display: static;
            align-items: center;
            justify-content: center;
            padding:  10px;
            min-height: 90vh;
            background: lightskyblue;">
        <center>
        <%
        String loginid = request.getParameter("loginid");
        String secques=request.getParameter("secques");
        String secans=request.getParameter("secans");
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
                    if(secques.equals(rs.getString(11)) && secans.equalsIgnoreCase(rs.getString(12)))
                    {
                        out.println("Security Question And Answer Matched");
                        count++;
                        break;
                    }
                    else
                    {
                        out.println("Security Question And Answer Does Not Match");
                    }
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
                out.println("<b>Login ID Does Not Found</b>");
            }
        }
        catch(Exception e)
        {
            out.println("Password Does Not Change"+e);
        }
        %>
        </center>
    </body>
</html>