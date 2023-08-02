<%@include file="DBCON.jsp" %>
<%@page import="java.util.Date" %>
<html>
    <body style="display: static;
            align-items: center;
            justify-content: center;
            padding:  10px;
            min-height: 90vh;
            background: lightskyblue;"> 
        <%
            String role = request.getParameter("role");
            String loginid = request.getParameter("loginid");
            String loginpassword = request.getParameter("loginpassword");
            
            session.setAttribute("login_id", loginid);
            
            session.setAttribute("login_time", new Date());
            
            String customername="";
            String birthdate="";
            
            try
            {
                String viewaccountquery = "select * from account";
                Statement stmt = con.createStatement();
                ResultSet rs1 = stmt.executeQuery(viewaccountquery);
                
                int count = 0;
                while(rs1.next())
                {
                   customername = rs1.getString(2);
                   birthdate=rs1.getString(4);
                    //out.println(" " +rs1.getString(9));  //role
                    //out.println(" " +rs1.getString(10));  //password
                    //out.println("<br>");
                    
                    if(role.equalsIgnoreCase(rs1.getString(9)) && loginid.equalsIgnoreCase(rs1.getString(1)) && loginpassword.equals(rs1.getString(10)))
                    {
                        count ++;
                        break;
                    }
                }
                
                session.setAttribute("account_holder",customername);
                session.setAttribute("Birth_Date",birthdate);
                    
                if(count > 0)
                {
                        if(loginid.equalsIgnoreCase("A001"))
                        {
                            //out.println(" Admin Login success");
                           response.sendRedirect("AdminLogin.jsp");
                        }
                        else
                        {
                            response.sendRedirect("CustomerLogin.jsp");
                             //out.println(" customer Login success");
                        }
                }
                else
                {
                        RequestDispatcher dis= request.getRequestDispatcher("Login.jsp");
                        dis.include(request, response);
                        out.println("Invalid Credentials.....Login Failed");
                }
                
            }
            catch(Exception e)
            {
                out.println("Invalid Credentials.....Login Failed"+e);
            }
        %>    
    </body>
</html>