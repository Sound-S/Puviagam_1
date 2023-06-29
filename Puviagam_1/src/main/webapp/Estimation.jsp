<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estimation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="index.css">
    
    <link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">
	
</head>
<body >

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
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="Customer_Details.jsp">Customer Registration</a></li>
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
	
    <div class="container dis_back bg-white mb-4 " style="box-shadow: 5px 5px 20px; width:55%;box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);" >
    
    <!-- Login Heading -->
    <div class="container d-flex justify-content-center Login_title">
        <h4 class="text-primary">Estimation</h4>
        </div>
       
    <form action="Estimation" method="post">
    
        <div class="container d-flex justify-content-center">
        <h4> ${Total_Ammount}</h4>
       
        </div>


<!-- Form Div 1 -->
			<div class="container px-4 ">

				<!-- Name input -->
				<div class="row gx-5">
					<div class="col form-outline mb-4">
						<div>
							<label class="form-label" for="form2Example1">Customer Name<span style="color:red;font-size: 18px;">*</span></label> <input
								type="text" id="form2Example1" class="form-control" name="Name"
								placeholder="Enter name" value="${Name}" required />
						</div>
					</div>

					<!-- Email input -->
					<div class="col form-outline mb-4">
						<div>
							<label class="form-label" for="form2Example1">Customer Email<span style="color:red;font-size: 18px;">*</span></label> <input
								type="email" id="form2Example1" class="form-control"
								name="email_id" placeholder="Enter email" value="${email_id}" required />
						</div>
					</div>
				</div>
			</div>

<!-- Form end Div 1 -->

<!-- Form Div 2 -->
			<div class="container px-4 ">

				<!-- Phone number input -->
				<div class="row gx-5">
					<div class="col form-outline mb-4">
						<div>
							<label class="form-label" for="form2Example1">Customer Mobile Number<span style="color:red;font-size: 18px;">*</span>
								</label> <input type="number" id="form2Example1"
								class="form-control" name="Mobile_No"
								placeholder="Enter mobile number" value="${Mobile_No}" required />
						</div>
					</div>

					<!--Square feet input -->
					<div class="col form-outline mb-4">
						<div>
							<label class="form-label" for="form2Example2">Measurement<span style="color:red;font-size: 18px;">*</span></label>
							<input type="number" id="form2Example2" class="form-control"
								name="Square_feet" placeholder="Enter sq.feet" value="${Square_feet}"required />
						</div>
					</div>
				</div>
			</div>

<!-- Form end Div 2 -->


<!-- Form Div 3 -->
			<div class="container px-4 ">

				<!-- door Account -->
				<div class="row gx-5">
					<div class="col form-outline mb-4">
						<div>
							<label class="form-label" for="form2Example1">Main Door<span style="color:red;font-size: 18px;">*</span></label> <select
								class="form-select" aria-label="Default select example"
								name="Door_Cost" required>
								
								<option selected>---Select---</option>
								<option value="Basic">Basic</option>
								<option value="Premium">Premium</option>
								<option value="Ultra_Premium">Ultra Premium</option>

							</select>
						</div>
					</div>

					<!--House Category feet input -->
					<div class="col form-outline mb-4">
						<div>
							<label class="form-label" for="form2Example2">No.of Bedrooms<span style="color:red;font-size: 18px;">*</span></label>
							<input type="number" id="form2Example2" class="form-control"
								name="No_Of_rooms" placeholder="Enter no.of bedrooms" value="${No_Of_rooms}" required />
						</div>
					</div>
				</div>
			</div>

<!-- Form end Div 3-->

			
  <!-- Form Div 4 -->
			<div class="container px-4 ">

				<!--Bathroom Category feet input -->
				<div class="row gx-5">
					<div class="col form-outline mb-4">
						<div>
							<label class="form-label" for="form2Example2">Wash Room<span style="color:red;font-size: 18px;">*</span></label>
          <input type="number" id="form2Example2" class="form-control" name="Wash_Room" placeholder="Enter no.of wash room" value="${Wash_Room}" required/>
						</div>
					</div>

					<!--Windows Category feet input -->
					<div class="col form-outline mb-4">
						<div>
							<label class="form-label" for="form2Example2">Windows<span style="color:red;font-size: 18px;">*</span></label>
          <input type="number" id="form2Example2" class="form-control" name="Windows" placeholder="Enter no.of windows" value="${Windows}" required/>
						</div>
					</div>
				</div>
			</div>

<!-- Form end Div 4-->
     
        
            
 
            
       
        
        <!-- Submit button -->
        <div class="container d-flex justify-content-center">
        <input type="submit" value="Estimate" class="btn btn-primary btn-block mb-4 buttonw">
        
        </div>
        
       
        
        
      </form>

	<!-- 	<div class="container d-flex justify-content-center">
               
			  <a class="btn btn-secondary btn-block mb-4 buttonw" href="Finding_estimations.jsp" role="button">Estimation Details</a>
			 
		</div> -->


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
    
    
          
         
           
      
</body>
</html>