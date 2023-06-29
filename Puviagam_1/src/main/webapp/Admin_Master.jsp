
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="All_Codes.JDBC"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>

<link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

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
	
	<div class="container" style="margin-top:100px;margin-left:150px;">
	<h3><b>Dashboard</b></h3>
	</div>
   
   
   <div class="container text-white">
   
   
   <!-- First Row -->
   
	<div class="container   admindash ">
		<div class="row ">
			<div class="col px-4 text-top"
				onclick="location.href='show_employee_data.jsp';"  >
				<div class="p-3  div_details w-75 mt-3  "
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#e0afa0;">
					<h6>No.of Supervisors</h6>
					<% int count_employee=JDBC.Count_employee(); %><h5><%=count_employee %></h5>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686253014/icons8-customer-80_a2jiea.png" class="div_icons">
				</div>
			</div>
			<div class="col px-4 text-top"
				onclick="location.href='show_customer_data.jsp';">
				<div class="p-3  div_details w-75 mt-3 "
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#98BDFF;">
					<h6>No.of Customers</h6>
					<% int count_customer=JDBC.Count_customer(); %><h5><%=count_customer %></h5>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686253278/icons8-employee-90_ugrjqh.png" class="div_icons">
				</div>
			</div>

            	<div class="col px-4 text-top"
				onclick="location.href='show_Site_Status.jsp';">
				<div class="p-3  div_details w-75 mt-3"
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#F3797E;">
					<h6>No.of Sites</h6>
					<% int count_sites=JDBC.Count_customer(); %><h5><%=count_sites %></h5>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686286351/icons8-building-100_ukkjs4.png" class="div_icons">
				</div>
			</div>
			
			<div class="col px-4 text-top"
				onclick="location.href='Estimation.jsp';">
				<div class="p-3  div_details w-75 mt-3"
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#c6ac8f;">
					<h6>Estimation</h6>
					<pre>   </pre>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686285446/icons8-budget-58_fbtie3.png" class="div_icons">
				</div>
			</div>

		</div>

	</div>
	
	<!-- second row -->
	
	<div class="container   admindash_row2 ml-3">
		<div class="row gx-5">
			<div class="col px-4 text-top"
				onclick="location.href='Finding_estimations.jsp';"  >
				<div class="p-3  div_details w-75 mt-3 "
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#cb769e;">
					<h6>Estimation Reports</h6>
					<pre>  </pre>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686284241/icons8-pie-chart-report-100_kof4qy.png" class="div_icons">
				</div>
			</div>
			<div class="col px-4 text-top"
				onclick="location.href='price.jsp';">
				<div class="p-3  div_details w-75 mt-3"
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#ffd449;">
					<h6>Price</h6>
					<pre>   </pre>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686338424/icons8-rupee-96_vflujm.png" class="div_icons">
				</div>
			</div>

            	<div class="col px-4 text-top"
				onclick="location.href='Manager_Inventory.jsp';">
				<div class="p-3  div_details w-75 mt-3"
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#7DA0FA;">
					<h6>Inventory</h6>
					<pre>    </pre>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686285930/icons8-brick-96_1_jlum4h.png" class="div_icons">
				</div>
			</div>
			
			<div class="col px-4 text-top"
				onclick="location.href='Payment_Management.jsp';">
				<div class="p-3  div_details w-75 mt-3"
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#84a98c;">
					<h6>Payment</h6>
					<pre>  </pre>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686283910/icons8-dollar-account-96_kawble.png" class="div_icons">
				</div>
			</div>

		</div>

	</div>
	
	<!-- third row -->
	
	<div class="container   admindash_row3 ">
		<div class="row gx-5">
			<div class="col px-4 text-top"
				onclick="location.href='Show_Payment_Details.jsp';"  >
				<div class="p-3  div_details w-25 mt-3 "
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#7ccc63;margin-left:382px">
					<h6>Payment Reports</h6>
					<pre>  </pre>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686284241/icons8-pie-chart-report-100_kof4qy.png" class="div_icons">
				</div>
				</div>
			

		   

	</div>
	</div>
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