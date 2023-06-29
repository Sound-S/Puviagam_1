<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="index.css">
    
    <link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">
	
</head>
<body>
<!--navbar start-->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">

            <div class="container">
                  
				<a href="" class="navbar-brand"><img
					src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1685905487/1685905387595_t6z2ge.png"
					class="img-fluid" alt="company logo"
					style="height: 40px; width: 180px;"> </a>
				

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
    
    <div class="container dis_back bg-white mb-4 " style="box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);background-attacment: fixed;  background-position: center;">
    
    <!-- Login Heading -->
    <div class="container d-flex justify-content-center Login_title">
        <h4 class="text-primary">Login</h4>
        </div>
       
    <form action="Admin_Login" method="post">
    
           <!-- Select Account --> 
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1">Account Type</label>
          <select class="form-select" aria-label="Default select example" name="login_type" required>
             <option selected>--Select--</option>
             <option value="Customer">Customer</option>
             <option value="Employee">Supervisor</option>
             <option value="Admin">Manager</option>
             
            </select>
          
        </div>
        <!-- Email input -->
        <div class="form-outline mb-4">
        <label class="form-label" for="form2Example1">Email</label>
          <input type="email" id="form2Example1" class="form-control" name="email_id" placeholder="Enter your email" required/>
          
        </div>
      
        <!-- Password input -->
        <div class="form-outline mb-4">
         <label class="form-label" for="form2Example2">Password</label>
          <input type="password"  class="form-control" id="myInput" name="password" placeholder="Enter your password" required/>
          </div>
      
      
      <div class="form-outline mb-4">
      <input type="checkbox" onclick="myFunction()"> Show Password 
      </div>
      
      
      
        <!-- 2 column grid layout for inline styling -->
        <div class="row mb-4">
          
      
          <div class="col">
            <!-- Simple link -->
            <a href="Forgot_Password.jsp">Forgot password?</a>
          </div>
          
          <div class="col">
            <!-- Error_Message_Login -->
            <h6 class="text-danger">${pass_err_msg }</h6>
          </div>
        </div>
      
        <!-- Submit button -->
        <div class="container d-flex justify-content-center">
        <input type="submit" value="Login" class="btn btn-primary btn-block mb-4 buttonw">
        
        </div>
      </form>
    </div>

	<script>
	function myFunction() {
		  var x = document.getElementById("myInput");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		}
	</script>
</body>
</html>