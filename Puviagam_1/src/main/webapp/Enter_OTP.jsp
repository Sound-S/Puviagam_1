<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
    <%@page import="All_Codes.JDBC"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Enter OTP</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
	
	<link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">

<link rel="stylesheet" href="index.css">
</head>
<body>

<!--navbar start-->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">

            <div class="container">
                   <a href="/" class="navbar-brand"> Puviagam </a>

                     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#Mynavbar" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                     </button>
 
            <div class="collapse navbar-collapse" id="Mynavbar">

                <ul class="navbar-nav ms-auto">
                   <li class="nav-item"> 
                    <a href="static.jsp" class="nav-link  text-white">Home</a>
                   </li>

                   <li class="nav-item">
                    <a href="index.jsp" class="nav-link text-white">Login</a>
                   </li>
                </ul>

            </div>

           </div>
           
        </nav>
    </header>
    <!--end navbar -->



<div class="container dis_back5 bg-white mb-4 " style="box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);">
    
     <%
     String Email=(String)(session.getAttribute("Email"));
    String User_Otp = request.getParameter("user_otp");
    String Mail_otp = (String)session.getAttribute("OTP");
    //System.out.println("User_Otp"+User_Otp);
    //System.out.println("Mail_otp"+Mail_otp);
    String Error_message =null;
    try{
    	if(User_Otp!=null)
    	{
    	if(User_Otp.equals(Mail_otp))
    	{
    		//HttpSession session_email = request.getSession();
    		//session_email.setAttribute("Email", Email);
    		//session_email.setAttribute("OTP", Mail_OTP);
    		response.sendRedirect("New_Password.jsp");
    	}
    	else
    	{
    		Error_message="Invalid OTP";
    	}
    	}
    	
    }
    catch(Exception E)
    {
    	E.printStackTrace();
    }
    
    %>
    <!-- Login Heading -->
    <div class="container d-flex justify-content-center Login_title">
        <div class="container"><h4>Verification required</h4><p style="font-size:15px" class="pt-2">To continue, complete this verification step. We've sent an OTP to the email "<% if(Email!=null){out.println(Email); } %>". Please enter it below to complete verification.</p></div>
  
        </div>
    
   <div class="container">
				<h6 class="text-danger"><% if(Error_message!=null){out.println(Error_message); } %></h6>
				
			</div>
    
     
         <form action="Enter_OTP.jsp" method="post">
      
        <!-- Email input -->
        <div class="form-outline mb-4">
        <label class="form-label" for="form2Example1">Enter OTP</label>
          <input type="text" id="form2Example1" class="form-control" name="user_otp" placeholder="Enter OTP" required/>
          
        </div>

        <!-- Submit button -->
        <div class="container d-flex justify-content-center">
        <input type="submit" value="Continue" class="btn btn-secondary btn-block mb-4">
        
        </div>
        
        </form>
      
    </div>


<%

      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  //HTTP 1.1

      response.setHeader("pragma", "no-cache");  //HTTP 1.0

      response.setHeader("Expires", "5");  //proxies

   

      if(session.getAttribute("Email") == null)

      {

    	  response.sendRedirect("index.jsp");

      }

      %>

<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>