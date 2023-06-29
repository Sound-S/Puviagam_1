<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
    <%@page import="All_Codes.JDBC"%>
    <%@page import="All_Codes.mail_sending"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
	
	<link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">

<link rel="stylesheet" href="index.css">
<title>Forgot Password</title>
</head>
<body>

      <div class="container dis_back5 bg-white mb-4 " style="box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);">
    
    <!-- Login Heading -->
    <div class="container d-flex justify-content-center Login_title">
        <div class="container"><h4>Password assistance</h4><p style="font-size:15px" class="pt-2">Enter the email address associated with your Puviagam account</p></div>
  
        </div>
       
    <%
    String Error_Email_Msg=null;
       String Email = request.getParameter("email_id");
    String account_type = request.getParameter("account_type");
    
    	
   try{
    if(account_type.equals("Customer"))
    {
    	int aftercheck=JDBC.customer_check_email(Email);
    	if(aftercheck!=0)
    	{
    		String Mail_OTP=mail_sending.Forget_Password_email_otp(Email);
    		
    		//System.out.println("qwertyuiop"+Mail_OTP);
    		HttpSession session_email = request.getSession();
    		session_email.setAttribute("Email", Email);
    		session_email.setAttribute("OTP", Mail_OTP);
    		session_email.setAttribute("account_type",account_type);
    		response.sendRedirect("Enter_OTP.jsp");
    		
    	}
    	else
    	{
    		Error_Email_Msg="Invalid Email Id";
    	}
    }
    else
    {
    	int afteremployeecheck=JDBC.supervisor_check_email(Email);
    	if(afteremployeecheck!=0)
    	{
    		String Mail_OTP=mail_sending.Forget_Password_email_otp(Email);
    		
    		//System.out.println("qwertyuiop"+Mail_OTP);
    		HttpSession session_email = request.getSession();
    		session_email.setAttribute("Email", Email);
    		session_email.setAttribute("OTP", Mail_OTP);
    		session_email.setAttribute("account_type",account_type);
    		response.sendRedirect("Enter_OTP.jsp");
    		
    	}
    	else
    	{
    		Error_Email_Msg="Invalid Email Id";
    	}
    }
    
   }
   catch(Exception E)
   {
	   E.printStackTrace();
   }
    
    %>
     
         <form action="Forgot_Password.jsp" method="post">
      
      <div class="container">
				<h6 class="text-danger"><% if(Error_Email_Msg!=null){out.println(Error_Email_Msg); } %></h6>
				
			</div>
			
             <!-- Select Account --> 
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1">Account Type</label>
          <select class="form-select" aria-label="Default select example" name="account_type" required>
             <option selected>--Select--</option>
             <option value="Customer">Customer</option>
             <option value="Employee">Supervisor</option>
            </select>
          
        </div>
      
        <!-- Email input -->
        <div class="form-outline mb-4">
        <label class="form-label" for="form2Example1">Email</label>
          <input type="email" id="form2Example1" class="form-control" name="email_id" placeholder="Enter your email" required/>
          
        </div>

        <!-- Submit button -->
        <div class="container d-flex justify-content-center">
        <input type="submit" value="Get OTP" class="btn btn-secondary btn-block mb-4">
        
        </div>
        
        </form>
      
    </div>






<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>