<%@include file="DBCON.jsp"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
    <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Global Bank Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
      
    <!--navbar-->

    <nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: #e3f2fd;" style="display: static ">
                                                                                                   
                                                                                                    
        <div class="container-fluid ">
        <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">                 
            
            <li class="nav-item">
                <a class="nav-link" href="#"></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"></a>
            </li>

        </ul>
          <a class="navbar-brand " href="#"><b>Global Bank</b></a>
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bank2" viewBox="0 0 16 16">
            <path d="M8.277.084a.5.5 0 0 0-.554 0l-7.5 5A.5.5 0 0 0 .5 6h1.875v7H1.5a.5.5 0 0 0 0 1h13a.5.5 0 1 0 0-1h-.875V6H15.5a.5.5 0 0 0 .277-.916l-7.5-5zM12.375 6v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zm-2.5 0v7h-1.25V6h1.25zM8 4a1 1 0 1 1 0-2 1 1 0 0 1 0 2zM.5 15a.5.5 0 0 0 0 1h15a.5.5 0 1 0 0-1H.5z"/>
          </svg>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">                 
            </ul>

            <form class="d-flex">
                <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="Home.jsp">Home</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="Login.jsp">Login</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="NewAccount.jsp">Create Account</a>
                </li>

                <div class="btn-group">
                    <button type="button" class="btn btn-info p-1 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                      Services
                    </button>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#"><b>Customer Services</b></a></li>
                      <li><a class="dropdown-item" href="#">View Statement</a></li>
                      <li><a class="dropdown-item" href="#">Fund Transfer</a></li>
                      <li><a class="dropdown-item" href="#">Information</a></li>
                      <li><a class="dropdown-item" href="#">Change Password</a></li><br>

                      <li><a class="dropdown-item" href="#"><b>Admin Services</b></a></li>
                      <li><a class="dropdown-item" href="#">View Statement</a></li>
                      <li><a class="dropdown-item" href="#">Fund Transfer</a></li>
                      <li><a class="dropdown-item" href="#">Information</a></li>
                      <li><a class="dropdown-item" href="#">Change Password</a></li>
                    </ul>
                </div><br>
                    
                <li class="nav-item">
                    <a class="nav-link" href="#"></a>
                </li>
                    
                <div class="btn-group">
                    <button type="button" class="btn btn-info p-1 dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                      Address
                    </button>
                    <ul class="dropdown-menu">
                      <li><a class="dropdown-item" href="#">Global Square, Raigwan,<br> Patan Rd, Jabalpur,<br> Madhya Pradesh 482002</a></li>
                    </ul>
                </div><br>
                
                <li class="nav-item">
                    <a class="nav-link" href="#">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact Us</a>
                </li>
                  
                </ul>
            </form>
          </div>
        </div>
    </nav>
</head>
    <body bgcolor="pink" style="display: static;
            align-items: center;
            justify-content: center;
            padding:  10px;
            min-height: 90vh;
            background: lightskyblue;">
        
        <%!
            String acno="C00";
            //SimpleDateFormat formatter ;
            //Date dt;
        %>
      
        <%
            //dt= new Date();
        
            //formatter=new SimpleDateFormat("yyyy/MM/dd");
         try
            {
            String viewquery = "select * from account;";
            
            Statement st = con.createStatement();
            ResultSet rs1 = st.executeQuery(viewquery);
            int i=0;
            while(rs1.next()){
              i++;  
            }
            acno+=i;
             }
            catch(Exception e)
            {
                out.print(e);
            }
        %>
        
       <!--<h3 align="center">  New Account Registration </h3> -->
       <br><br> 
       <center>  
             <div><h1 class="margin:5%;">Welcome <%=session.getAttribute("login_id")%> <%=session.getAttribute("account_holder")%> Into Your Account | <%=session.getAttribute("login_time")%></h1>
             </div></center>
        <center>  
        
        <form action="NewAccountDBMS.jsp" method="post" style="position:static;  
                                                          margin-top: 5%; 
                                                          margin-left: 15%;
                                                          margin-right: 13%;
                                                          background: cornflowerblue;
                                                          width: 60%;
                                                          height: auto;
                                                          padding: 50px;
                                                          border-radius: 10px;
                                                          box-shadow: 7px 7px 60px #000;
                                                          margin-bottom: 40vh;">
            <table align="center">
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Account Number</td>
                    <td style="width: 50%"><input type="text" name="acno" value=<%=acno%>></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Customer Name</td>
                    <td style="width: 50%"><input type="text" name="cname"></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Father Name</td>
                    <td style="width: 50%"><input type="text" name="cfname"></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">DOB</td>
                    <td style="width: 50%"><input type="date" name="cdob"></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Gender</td>
                    <td style="width: 50%"><input type="text" name="cgen"></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Account Opening Date</td>
                    <td style="width: 50%"><input type="date" name="opdate"></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Address</td>
                    <td style="width: 50%"><input type="text" name="cadd"></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Contact No.</td>
                    <td style="width: 50%"><input type="text" name="ccontact"></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Role</td>
                    <td style="width: 50%"><input type="text" name="rrole"></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Password</td>
                    <td style="width: 50%"><input type="text" name="password"></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Security Question</td>
                    <td style="width: 50%">
                        <select name="secques">
                            <option value="birthplace">Birth Place</option>
                            <option value="FirstSchool">First School</option>
                            <option value="best friend">Best Friend</option>
                        </select>
                    </td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Security Answer</td>
                    <td style="width: 50%"><input type="text" name="secans"></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%">Status</td>
                    <td style="width: 50%"><select name="status">
                            <option value="activate">Activate</option>
                            <option value="deactivate">Deactivate</option>
                        </select></td>
                </tr>
                
                <tr style="width: 80%;
                           margin: 10%;
                           padding: 5%;
                           font-size: 20px;">
                    <td style="width: 50%"><input type="submit" name="b1" value="Save"></td>
                    <td style="width: 50%"><input type="reset" name="b1" value="Reset"></td>
                </tr>
            </table>    
                <%
                    acno="C00";
                %>
        </form>
        
        <footer class="container">
        <p class="float-end"><a href="#">Back to top</a></p>
        <p>© 2023?2025 RS Bank, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    <script src="js/translation.js"></script>
    </body>
</html>