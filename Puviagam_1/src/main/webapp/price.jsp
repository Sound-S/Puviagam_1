<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Price Details</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<link rel="stylesheet" href="index.css">

<link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">
	
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}
</style>
</head>
<body class="bg-white">

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

	

	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%
	String sno = request.getParameter("Sno");
	String driverName = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "puviagam";
	String userId = "root";
	String password = "12345";
	String price_date = "";

	try 
	{
		Class.forName(driverName);
	} 
	catch (ClassNotFoundException e) 
	{
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	%>

	<h2 align="center">
		<font><strong>Price Details</strong></font>
	</h2>

	<div class="container table-responsive-lg" id="showcustomerdetails">

		<%
		try 
		{
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			statement = connection.createStatement();
			String sql = "select date_format(price_date,'%d-%m-%Y'),sand,cement,brick,steel,outer_paint,inner_paint,flooring,electrical_plumbing,bathroom_materials_amount,bathroom_door_amount,basic_main_door,premium_main_door,ultrapremium_main_door,bedroom_door_amount,window_cost,kitchen_granite_amount,Sno,Construction_Aggregate_amount from price_details order by Sno desc limit 1";

			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				price_date = resultSet.getString(1);
		%>
		

		<table class="table table-hover">
		
		<tr  class="text-white bg-success">
				<td style="width: 5%"><b></b></td>
				<td style="width: 5%"><b><%=price_date%></b></td>
				<td style="width: 5%"><b></b></td>
			</tr>
		
		

			<tr class="text-white bg-success">
				<td style="width: 5%"><b>Material Name</b></td>
				<td style="width: 5%"><b>Units</b></td>
				<td style="width: 5%"><b>Cost</b></td>
			</tr>

			<tr>
				<td>Sand</td>
				<td>cubic feet</td>
				<td><%=resultSet.getString(2)%></td>
			</tr>

			<tr>
				<td>Cement</td>
				<td>bag</td>
				<td><%=resultSet.getString(3)%></td>
			</tr>
			
			<tr>
				<td>Aggregate</td>
				<td>cubic feet</td>
				<td><%=resultSet.getString(19)%></td>
			</tr>

			<tr>
				<td>Brick</td>
				<td>piece</td>
				<td><%=resultSet.getString(4)%></td>
			</tr>

			<tr>
				<td>Steel</td>
				<td>kg</td>
				<td><%=resultSet.getString(5)%></td>
			</tr>

			<tr>
				<td>Outer Paint</td>
				<td>liter</td>
				<td><%=resultSet.getString(6)%></td>
			</tr>
			
			<tr>
				<td>Inner Paint</td>
				<td>liter</td>
				<td><%=resultSet.getString(7)%></td>
			</tr>

			<tr>
				<td>Flooring</td>
				<td>square feet</td>
				<td><%=resultSet.getString(8)%></td>
			</tr>
			
			<tr>
				<td>Electrical and Plumbing</td>
				<td>materials</td>
				<td><%=resultSet.getString(9)%></td>
			</tr>
			
			<tr>
				<td>Bathroom Materials</td>
				<td>materials</td>
				<td><%=resultSet.getString(10)%></td>
			</tr>
			
			<tr>
				<td>Bathroom Door</td>
				<td> qty 1 </td>
				<td><%=resultSet.getString(11)%></td>
			</tr>
			
			<tr>
				<td>Basic Main Door</td>
				<td>qty 1</td>
				<td><%=resultSet.getString(12)%></td>
			</tr>
			
			<tr>
				<td>Premium Main Door</td>
				<td>qty 1</td>
				<td><%=resultSet.getString(13)%></td>
			</tr>
			
			<tr>
				<td>Ultra-Premium Main Door</td>
				<td>qty 1</td>
				<td><%=resultSet.getString(14)%></td>
			</tr>
			
			<tr>
				<td>Bedroom Door</td>
				<td>qty 1</td>
				<td><%=resultSet.getString(15)%></td>
			</tr>
			
			<tr>
				<td>Window</td>
				<td>qty 1</td>
				<td><%=resultSet.getString(16)%></td>
			</tr>
						
			<tr>
				<td>Kitchen Granite</td>
				<td>square feet</td>
				<td><%=resultSet.getString(17)%></td>
			</tr>
		</table>
               <form id="myForm" action="Price_update.jsp" method="post">
		<div class="container d-flex justify-content-center">
			
				<input type="hidden" name="sno" value="<%=resultSet.getString(18)%>" />
				<div class="container d-flex justify-content-center">
					
					<input type="submit" value="Update Price"
						class="btn btn-primary btn-block mb-4 ">
				</div>

			</div>
		</form>

		<%
		}
		%>

		<%
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>

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