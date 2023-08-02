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
                    <a class="nav-link active" aria-current="page" href="Logout.jsp">Logout</a>
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
    <body style="display: static;
            align-items: center;
            justify-content: center;
            padding:  10px;
            min-height: 90vh;
            background: lightskyblue;">
    <center> <br> <b>  Welcome <%=session.getAttribute("login_id")%> <%=session.getAttribute("account_holder")%><br>
                    <br>  Here You Can Update Customer's Profile.<br><br></b>
        
        <form action="AdminUpdateCustomerDBMS.jsp" method="post" style="position:static;  
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
            Select which you want to update : <select name="field">
                            <option value="Select">Select</option>
                            <option value="custname">Name</option>
                            <option value="custfname">Father Name</option>
                            <option value="dob">Date of Birth</option>
                            <option value="gender">Gender</option>
                            <option value="address">Address</option>
                            <option value="contactno">Contact No.</option>
                            <option value="sques">Security Question</option>
                            <option value="sans">Security Answer</option>
                            <option value="status">Status</option>
                            </select><br><br>
                            
                            Enter Updated Value : <input type="text" name="upvalue"><br><br>
            
            <input type="submit" name="update" value="Update">
        </form>
                </center>>
    </body>
</html>