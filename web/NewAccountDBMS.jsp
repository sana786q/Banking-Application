
<%@include  file="DBCON.jsp" %>
<html>
    <body>
    <center>
        <%
            try
            {
                String acno = request.getParameter("acno");
                String cname = request.getParameter("cname");
                String cfname = request.getParameter("cfname");
                String cdob = request.getParameter("cdob");
                String cgen = request.getParameter("cgen");
                String opdate = request.getParameter("opdate");
                String cadd = request.getParameter("cadd");
                String ccontact = request.getParameter("ccontact");
                
                String role = request.getParameter("rrole");
                String password = request.getParameter("password");
                String secquestion = request.getParameter("secques");
                String secanswer = request.getParameter("secans");
                String status = request.getParameter("status");
                
                
                String accountinsertquery = "insert into account values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
                
                PreparedStatement pst1 = con.prepareStatement(accountinsertquery);
                
                pst1.setString(1, acno);
                pst1.setString(2, cname);
                pst1.setString(3, cfname);
                pst1.setString(4, cdob);
                pst1.setString(5, cgen);
                pst1.setString(6, opdate);
                pst1.setString(7, cadd);
                pst1.setInt(8, Integer.parseInt(ccontact));
                pst1.setString(9, role);
                pst1.setString(10, password);
                pst1.setString(11, secquestion);
                pst1.setString(12, secanswer);
                pst1.setString(13, status);
                
                pst1.executeUpdate();
                
                out.println("<br> Account Created.... ");
                
                String customertable = "create table "+acno+"(accountno varchar(20), ref varchar(20), dotrans varchar(20), transid varchar(20), depamount int, wdrwamount int, netbal int);";
                
                PreparedStatement pst2 = con.prepareStatement(customertable);
                
                pst2.executeUpdate();
                
                out.println("<br> Customer transaction table created also .... ");

            }
            catch(Exception e)
            {
                out.println("Account not created....." +e);
            }
        
        %>
    </center>
    </body>
</html>