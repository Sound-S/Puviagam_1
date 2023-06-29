<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>

<link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">
	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="stylesheet" href="index.css">


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


				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#Mynavbar"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="Mynavbar">

					<ul class="navbar-nav ms-auto">
						<li class="nav-item"><a href="Admin_Master.jsp"
							class="nav-link  text-white">Home</a></li>

						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Registration</button>
								<ul class="dropdown-menu" >
									<li ><a class="dropdown-item" href="Customer_Details.jsp">Customer Registration</a></li>
									<li><a class="dropdown-item" href="Site_Register.jsp">Site
											Registration</a></li>
									<li><a class="dropdown-item" href="Employee_Details.jsp">Supervisor Registration</a></li>
								</ul>
							</div>

						</li>


						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Reports</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="show_customer_data.jsp">Customer
											Reports</a></li>
									<li><a class="dropdown-item" href="show_employee_data.jsp">Supervisor
											Reports</a></li>
									<li><a class="dropdown-item" href="show_Site_Status.jsp">Site
											Reports</a></li>
								</ul>
							</div>

						</li>

						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Estimation</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="Estimation.jsp">Estimation</a></li>
									<li><a class="dropdown-item"
										href="Finding_estimations.jsp">Estimation Reports</a></li>

								</ul>
							</div>

						</li>





						<li class="nav-item"><a href="price.jsp"
							class="nav-link text-white">Price</a></li>

						<li class="nav-item"><a href="Manager_Inventory.jsp"
							class="nav-link text-white">Inventory</a></li>

						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Payment</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="Payment_Management.jsp">Payment</a></li>
									<li><a class="dropdown-item"
										href="Show_Payment_Details.jsp">Payment Reports</a></li>

								</ul>
							</div>

						</li>

						<!--  <li class="nav-item"><a href="Payment_Management.jsp" class="nav-link text-white">Payment</a></li> 

						<li class="nav-item"><a href="Manager_Resource.jsp"
							class="nav-link text-white">Resource</a></li>-->

						<li class="nav-item">
							<form action="Logout" method="post">

								<input type="submit" value="Logout" class="nav-link text-white">

							</form>
						</li>


					</ul>

				</div>

			</div>

		</nav>
	</header>

	<!--end navbar -->
	
    <div class="container dis_back2 mb-4 bg-white">
    <div class="container d-flex justify-content-center Login_title">
        <h4 class="text-primary">Customer Registration</h4>
        </div>
        
     <form action="client_data" method="post">
     
     
        <!-- Error and Sucess_Message_Login -->
			<div class="container">
				<h6 class="text-danger">${pass_err_msg }</h6>
				<h6 class="text-success">${pass_sucess_msg }</h6>
			</div>
     
     
     
        <!-- customer_name input -->
        <div class="form-outline mb-4">
           <label class="form-label" for="form2Example1" >Name<span style="color:red;font-size: 18px;">*</span></label>
          <input type="text" id="form2Example1" class="form-control" name="Customer_Name" placeholder="Enter name" value="${Customer_Name }" required/>
         
        </div>
      
        <!-- Email-id input -->
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example2" >Email<span style="color:red;font-size: 18px;">*</span></label>
          <input type="email" id="form2Example2" class="form-control"  name="Customer_Email"  placeholder="Enter email" value="${Customer_Email }" required/>
          
        </div>

        
     
          
          <!-- Mobile number input -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" >Mobile Number<span style="color:red;font-size: 18px;">*</span></label>
            <input type="number" class="form-control" id="form2Example1" name="Customer_Mobile_No" placeholder="Enter mobile number"  value="${Customer_Mobile_No }" required>
            
          </div>

			<!-- Gender -->
			<div class="form-outline mb-4">
				<label class="form-label " for="form2Example1">Gender<span style="color:red;font-size: 18px;">*</span></label><br>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio"
						 id="inlineRadio1" value="Male" name="Gender" value="${Gender }" checked>
					<label class="form-check-label" for="inlineRadio1" >Male</label>
				</div>

				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio"
						 id="inlineRadio2" value="Female" name="Gender" value="${Gender }">
					<label class="form-check-label" for="inlineRadio2">Female</label>
				</div>
				
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio"
						 id="inlineRadio2" value="Others" name="Gender" value="${Gender }">
					<label class="form-check-label" for="inlineRadio2">Others</label>
				</div>
				
		

			</div>

			<!-- date of birth -->
			<div class="form-outline mb-4">
				<label class="form-label " for="form2Example1">Date of Birth<span style="color:red;font-size: 18px;">*</span></label>
				<div id="date-picker-example">
					
					<input placeholder="Select date" type="date" id="example"
						class="form-control" name="Date_of_Birth" value="${Date_of_Birth }">  
				</div>

			</div>



          
          <!-- Address details -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" >Residential Address<span style="color:red;font-size: 18px;">*</span></label>
           
            <textarea  id="form2Example1" class="form-control" name="Customer_Address" placeholder="Enter residential address">${Employee_Address }</textarea>
           
        </div>
          
        
        
          
      
      
        <!-- Submit button -->
        <div class="container d-flex justify-content-center">
        <!-- <button type="button" class="btn btn-primary btn-block mb-4 buttonw">Register</button>-->
        <input type="submit" value="Register" class="btn btn-primary btn-block mb-4 buttonw">
    </div>
      </form>
    </div>
    
    
    <%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1

response.setHeader("pragma", "no-cache"); //HTTP 1.0

response.setHeader("Expires", "0"); //proxies

if (session.getAttribute("Email") == null)

{

	response.sendRedirect("index.jsp");

}
%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
