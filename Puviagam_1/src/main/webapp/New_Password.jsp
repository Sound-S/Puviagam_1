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

<link rel="stylesheet" href="index.css">

<link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">
	
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
    
    <!-- Login Heading -->
    <div class="container d-flex justify-content-center Login_title">
        <div class="container"><h4>Create new password</h4><p style="font-size:15px" class="pt-2">We'll ask for this password whenever you login</p></div>
  
        </div>

     
         <form action="New_Password.jsp" method="post" id="myForm">
      
        <!-- Password input -->
        <div class="form-outline mb-4">
        <label class="form-label" for="form2Example1">New password</label>
          <input type="password"  class="form-control" name="password" placeholder="Enter new password" id="myInput" required/>
          
        </div>
        
         <!-- Password input -->
        <div class="form-outline mb-4">
        <label class="form-label" for="form2Example1">Confirm password</label>
          <input type="password"  class="form-control" name="confirmPassword" placeholder="Enter confirm Password" id="myInput2" required/>
          <small id="confirmPassword-feedback" class="text-danger"></small>
        </div>
        
         <div class="form-outline mb-4">
      <input type="checkbox" onclick="myFunction()"> Show Password 
      </div>
        
        <!-- Submit button -->
        <div class="container d-flex justify-content-center">
        <input type="submit" value="Save Changes" class="btn btn-secondary btn-block mb-4">
        
        </div>
        
        </form>
      
    </div>
    
    <%
    
    	
   
              String Email=(String)(session.getAttribute("Email"));
              String Account_type=(String)(session.getAttribute("account_type"));
        	String New_Password =request.getParameter("password");
        	//System.out.println("Account_type"+Account_type);
        	try{
        		if(New_Password!=null)
        		{
        	if(Account_type.equals("Customer") )
        	//if(  Account_type == "Customer")	
        	{
        		//System.out.println("Account_type2"+Account_type);
        		//System.out.println("New_Password"+New_Password);
        		boolean pass_update_msg =JDBC.customer_New_password_entry(Email, New_Password);
        		
        		if(pass_update_msg)
        		{
        			//System.out.println("customer updated pasword");
        			request.setAttribute("Update_Sucess", "Password Updated Sucessfully");
        			request.getRequestDispatcher("Password_Success_Message.jsp").forward(request, response);
        		}
        		else
        		{
        			request.setAttribute("Update_Error", "Problem in updation");
        			request.getRequestDispatcher("Password_Success_Message.jsp").forward(request, response);
        		}
        	}
        	else
        	{
        		boolean pass_update_msg =JDBC.supervisor_New_password_entry(Email, New_Password);
        		if(pass_update_msg)
        		{
        			//System.out.println("supervisor updated pasword");
        			request.setAttribute("Update_Sucess", "Password Updated Sucessfully");
        			request.getRequestDispatcher("Password_Success_Message.jsp").forward(request, response);
        		}
        		else
        		{
        			request.setAttribute("Update_Error", "Problem in updation");
        			request.getRequestDispatcher("Password_Success_Message.jsp").forward(request, response);
        		}
        	}
        		}
        	
        		
    }
    catch(Exception E)
    {
    	E.printStackTrace();
    }
    %>
    
        <script>
      const form = document.getElementById("myForm");
      const password = form.password;
      const confirmPassword = form.confirmPassword;
      const feedback = document.getElementById("confirmPassword-feedback");
      let isPasswordMatch = false;

      confirmPassword.addEventListener("input", () => {
        if (password.value != confirmPassword.value) {
          feedback.innerHTML = "Password did not match.";
          isPasswordMatch = false;
        } else {
          feedback.innerHTML = "";
          isPasswordMatch = true;
        }
      });

      form.onsubmit = function () {
        if (isPasswordMatch) {
          alert("Password Changed Sucessfully!");
          return true;
        }
        alert("Wait! Password did not match.");
        return false;
      };
      
      function myFunction() {
		  var x = document.getElementById("myInput");
		  var y = document.getElementById("myInput2");
		  if (x.type === "password" && y.type === "password") 
		  {
		    x.type = "text";
		    y.type = "text";
		  } else {
		    x.type = "password";
		    y.type = "password";
		  }
		};
    </script>
        
    
    
   

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