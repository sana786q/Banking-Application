<%@include file="DBCON.jsp" %>
<html>
    <body style="display: static;
            align-items: center;
            justify-content: center;
            padding:  10px;
            min-height: 90vh;
            background: lightskyblue;">
        <center>
     <b>   Welcome <%=session.getAttribute("login_id")%> </b><br><br>
        <%
        String accno=request.getParameter("accno");
    
            try
            {
                //-------------FROM 1 CUSTOMER TO--------
                
                
                int lastbal=0;
                String viewquerylast="select * from "+accno;
                Statement stmt=con.createStatement();
                ResultSet rs2=stmt.executeQuery(viewquerylast);
                
                while(rs2.next())
                {
                    lastbal=rs2.getInt(7);
                }
                
                String refname=request.getParameter("refname");
                String dot=request.getParameter("dot");
                String trid=request.getParameter("trid");
                int depamt=Integer.parseInt(request.getParameter("depamt"));
                
                String depositequery="insert into "+accno+" values(?,?,?,?,?,?,?)";
                
                PreparedStatement pst1=con.prepareStatement(depositequery);
                
                pst1.setString(1,accno);
                pst1.setString(2,refname);
                pst1.setString(3,dot);
                pst1.setString(4,trid);
                pst1.setInt(5,0);
                pst1.setInt(6,depamt);
                pst1.setInt(7,(lastbal-depamt));
                
                pst1.executeUpdate();
                
                 //Deposit amount to digits
                
                long n = depamt;
                long limit = 1000000000000L, curr_hun, t = 0;
                String answer = "";
                
                if (n == 0)
			answer += "zero";
                
                String multiplier[] = { "", "Trillion", "Billion", "Million", "Thousand" };
                
                String first_twenty[] = {
			"",	 "One",	 "Two",	 "Three",
			"Four", "Five",	 "Six",	 "Seven",
			"Eight", "Nine", "Ten",	 "Eleven",
			"Twelve", "Thirteen", "Fourteen", "Fifteen",
			"Sixteen", "Seventeen", "Eighteen", "Nineteen"
		};
                
                String tens[] = { "",	 "Twenty", "Thirty", "Forty", "Fifty", "Sixty",
				"Seventy", "Eighty", "Ninety" };
                
                if (n < 20L)
			answer += first_twenty[(int)n];
                
                for (long i = n; i > 0; i %= limit, limit /= 1000) {

			curr_hun = i / limit;

			while (curr_hun == 0) {

				i %= limit;
				limit /= 1000;
				curr_hun = i / limit;
				++t;
			}

			if (curr_hun > 99)
				answer += (first_twenty[(int)curr_hun / 100] + " Hundred ");

			curr_hun = curr_hun % 100;

			if (curr_hun > 0 && curr_hun < 20)
				answer+= (first_twenty[(int)curr_hun] + " ");

			else if (curr_hun % 10 == 0 && curr_hun != 0)
				answer+= (tens[(int)curr_hun / 10 - 1] + " ");

			else if (curr_hun > 20 && curr_hun < 100)
				answer+= (tens[(int)curr_hun / 10 - 1] + " "+ first_twenty[(int)curr_hun % 10]+ " ");

			if (t < 4)
				answer += (multiplier[(int)++t] + " ");
		}
                
                out.println("<br>"+answer+"Cash Transfered Successfully....From "+accno+" TABLE<br>");
                
                //------------TO ANOTHER CUSTOMER ----------
                
                
                int lastbalcustomer=0;
                String viewquerylastcustomer="select * from "+refname;
                Statement stmt2=con.createStatement();
                ResultSet rs3=stmt2.executeQuery(viewquerylastcustomer);
                
                while(rs3.next())
                {
                    lastbalcustomer=rs3.getInt(7);
                }
                
                String depositequerycustomer="insert into "+refname+" values(?,?,?,?,?,?,?);";
                
                PreparedStatement pst2=con.prepareStatement(depositequerycustomer);
                
                pst2.setString(1,refname);
                pst2.setString(2,accno);
                pst2.setString(3,dot);
                pst2.setString(4,trid);
                pst2.setInt(5,depamt);
                pst2.setInt(6,0);
                pst2.setInt(7,(lastbalcustomer+depamt));
                
                pst2.executeUpdate();
                out.println("<br>"+answer+"Cash Credited Successfully....In "+refname+" TABLE");
                
                
                
            }
            catch(Exception e)
            {
                out.println("Cash Transfer Failed...."+e);
            }
        %>
        </center>
    </body>
</html>
