package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class ForgetPasswordDBMS_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

Connection con;
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/DBCON.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<html>\n");
      out.write("   \n");
      out.write("    <body>\n");
      out.write("       ");
      out.write("\n");
      out.write("       ");

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
       
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <body style=\"display: static;\n");
      out.write("            align-items: center;\n");
      out.write("            justify-content: center;\n");
      out.write("            padding:  10px;\n");
      out.write("            min-height: 90vh;\n");
      out.write("            background: lightskyblue;\">\n");
      out.write("        <center>\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("        </center>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
